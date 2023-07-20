# Freqtrade

## Hyperopt

|------------|----------------|--------|
|Configure f.| Strategy name  | Results|
|------------|----------------|--------|

## Training
```
freqtrade backtesting  -c config_strategy9.json --strategy bbrsi9sortinoBLW --timerange 20230101- | less
```

## Trading
```
freqtrade trade  -c config_strategy7.json --strategy bbrsi7sortinoBLW
```

## Results
```bash
[ble: elapsed 14h32m42s (CPU 108.6%)] freqtrade hyperopt --config config_strategy10.json --hyperopt-loss SharpeHyperOptLossDaily --strategy  bbrsi7sortinoBLW_train -e 10000 --spaces default --timerange=20230101-20230301
```

```
Best result:

  6150/10000:     60 trades. 43/15/2 Wins/Draws/Losses. Avg profit   2.58%. Median profit   2.70%. Total profit  0.00118444 BTC (   0.00%). Avg duration 1 day, 23:58:00 min. Objective: -10.86578


    # Buy hyperspace params:
    buy_params = {
        "buy_adx": 29.0,
        "buy_adx_enabled": True,
        "buy_rsi": 23,
        "buy_rsi_enabled": False,
        "buy_trigger": "macd_cross_signal",
    }

    # Sell hyperspace params:
    sell_params = {
        "sell_adx": 72.4,
        "sell_adx_enabled": True,
        "sell_rsi": 75,
        "sell_rsi_enabled": True,
        "sell_trigger": "bb_lower4",
    }

    # ROI table:
    minimal_roi = {
        "0": 0.267,
        "459": 0.158,
        "831": 0.027,
        "1878": 0
    }

    # Stoploss:
    stoploss = -0.338

    # Trailing stop:
    trailing_stop = True  # value loaded from strategy
    trailing_stop_positive = 0.18959  # value loaded from strategy
    trailing_stop_positive_offset = 0.26492  # value loaded from strategy
    trailing_only_offset_is_reached = True  # value loaded from strategy


    # Max Open Trades:
    max_open_trades = inf  # value loaded from strategy
```

## Custom Hyperopt, using Harmonic mean and a combination of indicators

Using the following, it happens that I can have a good volume of trades, low quantity of losses, 
a lot of variation of wins and control the fact that we don't want negative profit returns.

- Sortino;
- Total profit;
- Drawdown profit;

```python
"""
Custom Hyperopt, using Harmonic mean and a combination of indicators:
- Sortino;
- Total profit;
- Drawdown profit;
"""

from pandas import DataFrame

from freqtrade.data.metrics import calculate_max_drawdown
from freqtrade.optimize.hyperopt import IHyperOptLoss
from freqtrade.data.metrics import calculate_sortino
from freqtrade.constants import Config
from datetime import datetime
from math import exp, sqrt

# higher numbers penalize drawdowns more severely
DRAWDOWN_MULT = 0.075

# Set TARGET_TRADES to suit your number concurrent trades so its realistic
# to the number of days
TARGET_TRADES = 600

# This is assumed to be expected avg profit * expected trade count.
# For example, for 0.35% avg per trade (or 0.0035 as ratio) and 1100 trades,
# expected max profit = 3.85
# Check that the reported Σ% values do not exceed this!
# Note, this is ratio. 3.85 stated above means 385Σ%.
EXPECTED_MAX_PROFIT = 3.0

# Max average trade duration in minutes.
# If eval ends with higher value, we consider it a failed eval.
MAX_ACCEPTED_TRADE_DURATION = 300


class BLWOptLoss(IHyperOptLoss):
    @staticmethod
    def hyperopt_loss_function(
        results: DataFrame,
        trade_count: int,
        min_date: datetime,
        max_date: datetime,
        config: Config,
        *args,
        **kwargs
    ) -> float:
        total_profit = results["profit_abs"].sum()

        try:
            max_drawdown_abs = calculate_max_drawdown(results, value_col="profit_abs")[5]
        except ValueError:
            max_drawdown_abs = 0

        starting_balance = config["dry_run_wallet"]
        sortino_ratio = calculate_sortino(results, min_date, max_date, starting_balance)
        max_coef = total_profit * (1 - max_drawdown_abs * DRAWDOWN_MULT)
        total_profit = results["profit_abs"].sum()
        # print(expected_returns_mean, down_stdev, sortino_ratio)

        total_profit = results["profit_ratio"].sum()
        trade_duration = results["trade_duration"].mean()

        # trade_loss = 1 - 0.25 * exp(-((trade_count - TARGET_TRADES) ** 2) / 10**5.8)
        # profit_loss = max(0, 1 - total_profit / EXPECTED_MAX_PROFIT)
        # duration_loss = 0.4 * min(trade_duration / MAX_ACCEPTED_TRADE_DURATION, 1)
        # result = trade_loss + profit_loss + duration_loss

        # total_profit = results["profit_ratio"].sum()
        # trade_duration = results["trade_duration"].mean()
        if total_profit < 0:
            v = 1000
        else:
            v = -1 * (3 / (1 / max_coef + 1 / sortino_ratio + 1 / total_profit))

        return v
```
