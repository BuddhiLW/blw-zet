# Freqtrade operations

```bash
freqtrade trade  -c 14.json --strategy BLW14
```

for running these markets:

```json
            "FLUX/BTC",
            "MATIC/BTC",
            "XMR/BTC",
            "BNB/BTC",
            "ETH/BTC",
```

Strategy:
```python
# pragma pylint: disable=missing-docstring, invalid-name, pointless-string-statement
# isort: skip_file
# --- Do not remove these libs ---
import numpy as np  # noqa
import pandas as pd  # noqa
from pandas import DataFrame
from freqtrade.strategy.interface import IStrategy
from freqtrade.strategy import (
    BooleanParameter,
    CategoricalParameter,
    DecimalParameter,
    IStrategy,
    IntParameter,
)
from functools import reduce

# --------------------------------
# Add your lib to import here
import talib.abstract as ta
import freqtrade.vendor.qtpylib.indicators as qtpylib


# This class is a sample. Feel free to customize it.
class BLW14(IStrategy):
    # Minimal ROI designed for the strategy.
    # This attribute will be overridden if the config file contains "minimal_roi".
    # ROI table:

    minimal_roi = minimal_roi = {"0": 0.22099999999999997, "271": 0.146, "429": 0.073, "1225": 0}

    # Stoploss:
    stoploss = -0.135

    # Trailing stoploss
    trailing_stop = True
    trailing_stop_positive = 0.18959
    trailing_stop_positive_offset = 0.26492
    trailing_only_offset_is_reached = True

    # Optimal ticker interval for the strategy.
    timeframe = "1h"

    # Run "populate_indicators()" only for new candle.
    process_only_new_candles = False

    # These values can be overridden in the "ask_strategy" section in the config.
    use_exit_signal = True
    exit_profit_only = False
    ignore_roi_if_sell_signal = False
    # Number of candles the strategy requires before producing valid signals
    startup_candle_count: int = 30

    # Optional order type mapping.
    order_types = {
        "entry": "limit",
        "exit": "limit",
        "emergency_exit": "market",
        "force_entry": "market",
        "force_exit": "market",
        "stoploss": "market",
        "stoploss_on_exchange": False,
        "stoploss_on_exchange_interval": 60,
        "stoploss_on_exchange_limit_ratio": 0.99,
    }

    process_only_new_candles = True

    plot_config = {
        "main_plot": {
            "tema": {},
            "sar": {"color": "white"},
        },
        "subplots": {
            "MACD": {
                "macd": {"color": "blue"},
                "macdsignal": {"color": "orange"},
            },
            "RSI": {
                "rsi": {"color": "red"},
            },
        },
    }

    def informative_pairs(self):
        """
        Define additional, informative pair/interval combinations to be cached from the exchange.
        These pair/interval combinations are non-tradeable, unless they are part
        of the whitelist as well.
        For more information, please consult the documentation
        :return: List of tuples in the format (pair, interval)
            Sample: return [("ETH/USDT", "5m"),
                            ("BTC/USDT", "15m"),
                            ]
        """
        return []

    def populate_indicators(self, dataframe: DataFrame, metadata: dict) -> DataFrame:
        # ADX
        dataframe["adx"] = ta.ADX(dataframe)

        # MACD
        macd = ta.MACD(dataframe)
        dataframe["macd"] = macd["macd"]
        dataframe["macdsignal"] = macd["macdsignal"]
        dataframe["macdhist"] = macd["macdhist"]

        # RSI
        dataframe["rsi"] = ta.RSI(dataframe)

        # Bollinger Bands
        bollinger1 = qtpylib.bollinger_bands(qtpylib.typical_price(dataframe), window=20, stds=1)
        dataframe["bb_lower1"] = bollinger1["lower"]
        dataframe["bb_mid1"] = bollinger1["mid"]
        dataframe["bb_upper1"] = bollinger1["upper"]

        bollinger2 = qtpylib.bollinger_bands(qtpylib.typical_price(dataframe), window=20, stds=2)
        dataframe["bb_lower2"] = bollinger2["lower"]
        dataframe["bb_mid2"] = bollinger2["mid"]
        dataframe["bb_upper2"] = bollinger2["upper"]

        bollinger3 = qtpylib.bollinger_bands(qtpylib.typical_price(dataframe), window=20, stds=3)
        dataframe["bb_lower3"] = bollinger3["lower"]
        dataframe["bb_mid3"] = bollinger3["mid"]
        dataframe["bb_upper3"] = bollinger3["upper"]

        bollinger4 = qtpylib.bollinger_bands(qtpylib.typical_price(dataframe), window=30, stds=4)
        dataframe["bb_lower4"] = bollinger4["lower"]
        dataframe["bb_mid4"] = bollinger4["mid"]
        dataframe["bb_upper4"] = bollinger4["upper"]

        dataframe["bb_percent"] = (dataframe["close"] - dataframe["bb_lower1"]) / (
            dataframe["bb_upper1"] - dataframe["bb_lower1"]
        )
        dataframe["bb_width"] = (dataframe["bb_upper1"] - dataframe["bb_lower1"]) / dataframe[
            "bb_mid1"
        ]

        stoch_fast = ta.STOCHF(dataframe, 5, 3, 0, 3, 0)
        dataframe["fastd"] = stoch_fast["fastd"]
        dataframe["fastk"] = stoch_fast["fastk"]

        return dataframe

    def populate_entry_trend(self, dataframe: DataFrame, metadata: dict) -> DataFrame:

        dataframe.loc[
            (
                # (dataframe["close"] <= dataframe["bb_lower2"])
                (dataframe["adx"] <= 32.6)
                & (dataframe["rsi"] <= 24)
                # & (
                #     dataframe["close"] / (dataframe["close"] - dataframe["open"])
                #     >= dataframe["bb_percent"]
                # )
                # & qtpylib.crossed_above(dataframe["fastd"], dataframe["fastk"])
            ),
            "buy",
        ] = 1

        return dataframe

    def populate_exit_trend(self, dataframe: DataFrame, metadata: dict) -> DataFrame:
        """
        based on ta indicators, populates the sell signal for the given dataframe
        :param dataframe: dataframe populated with indicators
        :param metadata: additional information, like the currently traded pair
        :return: dataframe with sell column
        """

        dataframe.loc[
            (
                (dataframe["adx"] >= 98.7)
                & (dataframe["rsi"] >= 81)
                & (dataframe["open"] >= dataframe["bb_mid3"])
                # & qtpylib.crossed_below(dataframe["fastd"], dataframe["fastk"])
                # & (
                #     dataframe["close"] / (dataframe["close"] - dataframe["open"])
                #     > dataframe["bb_percent"]
                # )
            ),
            "sell",
        ] = 1

        return dataframe
```


## Bots

Current running:
```bash
freqtrade trade -c 18.json --strategy BLW18
freqtrade trade -c 16.json --strategy BLW16
freqtrade trade -c 19.json --strategy BLW19
freqtrade trade -c 1-UST.json --strategy BLW20_USDT
```

20230911144237
```
freqtrade trade -c 2_USDT.json --strategy BLW22_USDT
```


