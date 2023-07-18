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
