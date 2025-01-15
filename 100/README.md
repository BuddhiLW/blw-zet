---
title: "Trading Stategy #1 - Hyperoptable strategy"
description: "A mix of BB and Ichv strategies. Trying to enter in trading markets after pull-backs. Do not remove these libs."
published: "2023-10-23"
image: "images/image-post-100.png"
draft: false
---

# Trading Stategy #1 - Hyperoptable strategy

A mix of BB and Ichv strategies. Trying to enter in trading markets after pull-backs.


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

pd.options.mode.chained_assignment = None  # default='warn'
import technical.indicators as ftt

# --------------------------------
# Add your lib to import here
import talib.abstract as ta
import freqtrade.vendor.qtpylib.indicators as qtpylib

def touch_above(df, rolling):
    filter = ((df["high"]>df["bb_upper2"]) & (df["open"]>df["keltner_upper"]) & (df["close"]>df["keltner_upper"]))
    df['uppers'] = pd.Series(index=df.index, data=np.where(filter, 1, 0)).rolling(rolling).sum()
    return df['uppers'] > 0

def aroon_crossed_above(df, rolling):
    filter = (qtpylib.crossed_above(df["aroon_up"], df["aroon_down"]).rolling(rolling).sum() > 0
                      & ~(qtpylib.crossed_below(df["aroon_up"], df["aroon_down"]).rolling(rolling).sum() > 0))
    df["aroon_crossed_above"] = pd.Series(index=df.index, data=np.where(filter, 1, 0)).sum()
    return df["aroon_crossed_above"] > 0

# This class is a sample. Feel free to customize it.
class BLW_train8(IStrategy):

    buy_params = {
        "buy_trend_above_senkou_level": 1,
        # "buy_trend_bullish_level": 6,
        "buy_fan_magnitude_shift_value": 3,
        # "buy_min_fan_magnitude_gain": 1.002 # NOTE: Good value (Win% ~70%), alot of trades
        #"buy_min_fan_magnitude_gain": 1.008 # NOTE: Very save value (Win% ~90%), only the biggest moves 1.008,
    }

    sell_trigger1_enabled = BooleanParameter(default=True, space="sell", optimize=True)
    buy_rolling_aroon = IntParameter(5, 20, default=10, space="buy", optimize=True)
    buy_aroon_enabled = BooleanParameter(default=True, space="buy")
    sell_aroon_enabled = BooleanParameter(default=True, space="sell")
    sell_aroon = DecimalParameter(-5, 20, decimals=1, default=0.1, space="sell", optimize=True)
    buy_rolling = IntParameter(1, 5, default=3, space="buy", optimize=True)
    buy_rolling_ichv = IntParameter(2, 10, default=3, space="buy", optimize=True)
    cooldown_lookback = IntParameter(20, 40, default=5, space="protection", optimize=True)
    stop_duration = IntParameter(12, 200, default=100, space="protection", optimize=True)
    use_stop_protection = BooleanParameter(default=True, space="protection", optimize=True)

    buy_trend_up_enabled = BooleanParameter(default=True, space="buy", optimize=True, load=True)
    sell_trend_stop_enabled = BooleanParameter(default=True, space="sell", optimize=True, load=True)
    # buy_predict_up = BooleanParameter(default=True, space="buy", optimize=True, load=True)
    # sell_predict_down = BooleanParameter(default=True, space="sell", optimize=True, load=True)

    # ------------ Hilbert Transform, Dominant Cycle Period - first derivatives
    # buy_diff_ht_dcphase_enabled = BooleanParameter(default=True, space="buy", optimize=True, load=True)
    buy_arc_diff_ht_dcphase = DecimalParameter(0, np.pi/5, default=np.pi/10, space="buy", optimize=True, load=True)
    # sell_diff_ht_dcphase_enabled = BooleanParameter(default=True, space="sell", optimize=True, load=True)
    sell_arc_diff_ht_dcphase = DecimalParameter(-np.pi/2, 0, default=-np.pi/4, space="sell", optimize=True, load=True)

    # ------------ Fan Magnitude first derivatives
    # buy_diff_fan_magnitude_enabled = BooleanParameter(default=True, space="buy", optimize=True, load=True)
    buy_arc_diff_fan_magnitude = DecimalParameter(0, np.pi/5, default=np.pi/10, space="buy", optimize=True, load=True)
    # sell_diff_fan_magnitude_enabled = BooleanParameter(default=True, space="sell", optimize=True, load=True)
    sell_arc_diff_fan_magnitude = DecimalParameter(-np.pi/2, 0, default=-np.pi/4, space="sell", optimize=True, load=True)
    buy_min_fan_magnitude_gain = DecimalParameter(1.001, 1.01, default=1.003, space="buy", optimize=True, load=True)
    # param_up_down = IntParameter(-40, -15, default=-20, space="buy", optimize=True, load=True)
    buy_trend_bullish_level = IntParameter(1, 8, default=3, space="buy", optimize=True, load=True)


    @property
    def protections(self):
        prot = []

        prot.append({
            "method": "CooldownPeriod",
            "stop_duration_candles": self.cooldown_lookback.value
        })
        if self.use_stop_protection.value:
            prot.append({
                "method": "StoplossGuard",
                "lookback_period_candles": 24 * 3,
                "trade_limit": 4,
                "stop_duration_candles": self.stop_duration.value,
                "only_per_pair": False
            })

        return prot


    # buy_adx = DecimalParameter(20, 40, decimals=1, default=30.4, space="buy")
    # buy_rsi = IntParameter(15, 40, default=24, space="buy")
    # buy_adx_enabled_less = BooleanParameter(default=False, space="buy")
    # buy_rsi_enabled_less = CategoricalParameter([True, False], default=True, space="buy")
    # buy_adx_enabled_more = BooleanParameter(default=True, space="buy")
    # buy_rsi_enabled_more = CategoricalParameter([True, False], default=False, space="buy")
    # buy_stoch_enabled = BooleanParameter(default=False, space="buy")
    # buy_doji = IntParameter(60, 100, default=70, space="buy")
    # buy_doji_enabled = BooleanParameter(default=True, space="buy")
    buy_trigger = CategoricalParameter(
        [
            "bb_lower1",
            "bb_lower2",
            "bb_lower3",
            "bb_lower4",
        ],
        default="bb_lower3",
        space="buy",
    )

    # sell_adx = DecimalParameter(70, 100, decimals=1, default=77.4, space="sell")
    # sell_rsi = IntParameter(50, 100, default=66, space="sell")
    # sell_adx_enabled_more = BooleanParameter(default=False, space="sell")
    # sell_rsi_enabled_more = CategoricalParameter([True, False], default=True, space="sell")
    # sell_stoch_enabled = BooleanParameter(default=False, space="sell")
    sell_trigger = CategoricalParameter(
        [
            "bb_lower1",
            "bb_lower2",
            "bb_lower3",
            "bb_lower4",
            "bb_mid1",
            "bb_mid2",
            "bb_mid3",
            "bb_mid4",
            "bb_upper1",
            "bb_upper3",
            "bb_upper4",
            # "macd_cross_signal",
            # "bb_percent",
            # "bb_width",
            # "stoch",
        ],
        default="bb_mid3",
        space="sell",
    )

    sell_trigger2 = CategoricalParameter(
        [
            "trend_close_15m",
            "trend_close_30m",
            "trend_close_1h",
            "trend_close_2h",
            "trend_close_4h",
            "trend_close_6h",
            "trend_close_8h"
        ],
        default="trend_close_1h",
        space="sell"
    )

    # sell_trigger = CategoricalParameter(
    #     ["bb_mid1", "bb_mid4", "macd_cross_signal"], default="bb_mid1", space="sell"
    # )
    # sell_trigger = CategoricalParameter(
    #     ["bb_upper1", "bb_upper4", "macd_cross_signal"], default="bb_upper1", space="sell"
    # )

    # Minimal ROI designed for the strategy.
    # This attribute will be overridden if the config file contains "minimal_roi".
    # ROI table:
    minimal_roi = {"0": 0.404, "195": 0.207, "748": 0.062, "1954": 0}

    # Optimal stoploss designed for the strategy.
    # This attribute will be overridden if the config file contains "stoploss".
    stoploss = -0.05

    # Trailing stoploss
    trailing_stop = True
    trailing_stop_positive = 0.18959
    trailing_stop_positive_offset = 0.26492
    trailing_only_offset_is_reached = True

    # Optimal ticker interval for the strategy.
    timeframe = "5m"

    # Run "populate_indicators()" only for new candle.
    process_only_new_candles = True

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
            # "bb_lower1": {"color": "green"},
            "bb_lower2": {"color": "red"},
            # "bb_lower3": {"color": "green"},
            # "bb_lower4": {"color": "green"},
            # "bb_mid1": {"color": "orange"},
            "bb_mid2": {"color": "white"},
            # "bb_mid3": {"color": "orange"},
            # "bb_mid4": {"color": "orange"},
            # "bb_upper1": {"color": "red"},
            "bb_upper2": {"color": "green"},
            # "bb_upper3": {"color": "red"},
            # "bb_upper4": {"color": "red"},
            # "tema": {},
            # "sar": {"color": "white"},
        },
        "subplots": {
            # "MACD": {
            #     "macd": {"color": "blue"},
            #     "macdsignal": {"color": "orange"},
            # },
            # "RSI": {
            #     "rsi": {"color": "red"},
            # },
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

        # AROON
        dataframe["aroon_osc"] = ta.AROONOSC(dataframe["high"], dataframe["low"], timeperiod=14)
        dataframe["aroon_up"], dataframe["aroon_down"] = ta.AROON(dataframe["high"], dataframe["low"], timeperiod=14)

        # ADX
        # dataframe["adx"] = ta.ADX(dataframe)

        # ATR
        dataframe["atr"] = ta.ATR(dataframe, timeperiod=14)

        # EMA
        dataframe["ema"] = ta.EMA(dataframe, timeperiod=20)


        # Keltner Channels
        dataframe["keltner_upper"] = dataframe["ema"] + dataframe["atr"] * 2
        dataframe["keltner_mid"] = dataframe["ema"]
        dataframe["keltner_lower"] = dataframe["ema"] - dataframe["atr"] * 2

        dataframe['ht_dcperiod'] = ta.HT_DCPERIOD(dataframe['close'])
        dataframe['ht_dcphase'] = ta.HT_DCPHASE(dataframe['close'])
        dataframe['ht_phasor_inphase'], dataframe['ht_phasor_quadrature'] = ta.HT_PHASOR(dataframe['close'])
        dataframe['ht_sine'], dataframe['ht_leadsine'] = ta.HT_SINE(dataframe['close'])
        dataframe['ht_trendmode'] = ta.HT_TRENDMODE(dataframe['close'])

        # RSI
        # dataframe["rsi"] = ta.RSI(dataframe)

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
        # dataframe["bb_width"] = (dataframe["bb_upper1"] - dataframe["bb_lower1"]) / dataframe[
        #     "bb_mid1"
        # ]

        # stochastic
        stoch_fast = ta.STOCHF(dataframe, 5, 3, 0, 3, 0)
        dataframe["fastd"] = stoch_fast["fastd"]
        dataframe["fastk"] = stoch_fast["fastk"]

        # CDL Dragron Fly
        # dataframe["dragon_fly"] = ta.CDLDRAGONFLYDOJI(dataframe)


        dataframe['ht_dcperiod'] = ta.HT_DCPERIOD(dataframe['close'])
        dataframe['ht_dcphase'] = ta.HT_DCPHASE(dataframe['close'])
        dataframe['ht_phasor_inphase'], dataframe['ht_phasor_quadrature'] = ta.HT_PHASOR(dataframe['close'])
        dataframe['ht_sine'], dataframe['ht_leadsine'] = ta.HT_SINE(dataframe['close'])
        dataframe['ht_trendmode'] = ta.HT_TRENDMODE(dataframe['close'])
        # dataframe['rsi'] = ta.RSI(dataframe['close'], timeperiod=14)

        heikinashi = qtpylib.heikinashi(dataframe)
        dataframe['open'] = heikinashi['open']
        dataframe['close'] = heikinashi['close']
        dataframe['high'] = heikinashi['high']
        dataframe['low'] = heikinashi['low']

        dataframe['trend_close_5m'] = dataframe['close']
        dataframe['trend_close_15m'] = ta.EMA(dataframe['close'], timeperiod=3)
        dataframe['trend_close_30m'] = ta.EMA(dataframe['close'], timeperiod=6)
        dataframe['trend_close_1h'] = ta.EMA(dataframe['close'], timeperiod=12)
        dataframe['trend_close_2h'] = ta.EMA(dataframe['close'], timeperiod=24)
        dataframe['trend_close_4h'] = ta.EMA(dataframe['close'], timeperiod=48)
        dataframe['trend_close_6h'] = ta.EMA(dataframe['close'], timeperiod=72)
        dataframe['trend_close_8h'] = ta.EMA(dataframe['close'], timeperiod=96)

        dataframe['trend_open_5m'] = dataframe['open']
        dataframe['trend_open_15m'] = ta.EMA(dataframe['open'], timeperiod=3)
        dataframe['trend_open_30m'] = ta.EMA(dataframe['open'], timeperiod=6)
        dataframe['trend_open_1h'] = ta.EMA(dataframe['open'], timeperiod=12)
        dataframe['trend_open_2h'] = ta.EMA(dataframe['open'], timeperiod=24)
        dataframe['trend_open_4h'] = ta.EMA(dataframe['open'], timeperiod=48)
        dataframe['trend_open_6h'] = ta.EMA(dataframe['open'], timeperiod=72)
        dataframe['trend_open_8h'] = ta.EMA(dataframe['open'], timeperiod=96)

        dataframe['fan_magnitude'] = (dataframe['trend_close_1h'] / dataframe['trend_close_8h'])
        dataframe['fan_magnitude_gain'] = dataframe['fan_magnitude'] / dataframe['fan_magnitude'].shift(-1)

        ichimoku = ftt.ichimoku(dataframe, conversion_line_period=20, base_line_periods=60, laggin_span=120, displacement=30)
        dataframe['chikou_span'] = ichimoku['chikou_span']
        dataframe['tenkan_sen'] = ichimoku['tenkan_sen']
        dataframe['kijun_sen'] = ichimoku['kijun_sen']
        dataframe['senkou_a'] = ichimoku['senkou_span_a']
        dataframe['senkou_b'] = ichimoku['senkou_span_b']
        dataframe['leading_senkou_span_a'] = ichimoku['leading_senkou_span_a']
        dataframe['leading_senkou_span_b'] = ichimoku['leading_senkou_span_b']
        dataframe['cloud_green'] = ichimoku['cloud_green']
        dataframe['cloud_red'] = ichimoku['cloud_red']

        dataframe['diff_fan_magnitude'] = (dataframe['fan_magnitude'] - dataframe['fan_magnitude'].shift(-1)) / dataframe['fan_magnitude'].shift(-1)
        dataframe['arc_diff_fan_magnitude'] = np.arctan(dataframe['diff_fan_magnitude'])
        dataframe['diff_ht_dcphase'] = (dataframe['ht_dcphase'] - dataframe['ht_dcphase'].shift(-1)) / dataframe['ht_dcphase'].shift(-1)
        dataframe['arc_diff_ht_dcphase'] = np.arctan(dataframe['diff_ht_dcphase'])

        return dataframe

    def delayed_signal_trend(self, dataframe: DataFrame, metadata: dict, rolling: int) -> DataFrame:
        conditions2 = []

        # Trends bullish
        if self.buy_trend_bullish_level.value >= 1:
            conditions2.append(dataframe['trend_close_5m'] > dataframe['trend_open_5m'])

        if self.buy_trend_bullish_level.value >= 2:
            conditions2.append(dataframe['trend_close_15m'] > dataframe['trend_open_15m'])

        if self.buy_trend_bullish_level.value >= 3:
            conditions2.append(dataframe['trend_close_30m'] > dataframe['trend_open_30m'])

        if self.buy_trend_bullish_level.value >= 4:
            conditions2.append(dataframe['trend_close_1h'] > dataframe['trend_open_1h'])

        if self.buy_trend_bullish_level.value >= 5:
            conditions2.append(dataframe['trend_close_2h'] > dataframe['trend_open_2h'])

        if self.buy_trend_bullish_level.value >= 6:
            conditions2.append(dataframe['trend_close_4h'] > dataframe['trend_open_4h'])

        if self.buy_trend_bullish_level.value >= 7:
            conditions2.append(dataframe['trend_close_6h'] > dataframe['trend_open_6h'])

        if self.buy_trend_bullish_level.value >= 8:
            conditions2.append(dataframe['trend_close_8h'] > dataframe['trend_open_8h'])
        # Angular conditions2 (first derivative)
        # if self.buy_diff_ht_dcphase_enabled.value:
        conditions2.append(dataframe['arc_diff_ht_dcphase'] > self.buy_arc_diff_ht_dcphase.value)

        # if self.buy_diff_fan_magnitude_enabled.value:
        conditions2.append(dataframe['arc_diff_fan_magnitude'] > self.buy_arc_diff_fan_magnitude.value)

        # Trends magnitude gain and absolute value
        conditions2.append(dataframe['fan_magnitude_gain'] >= self.buy_min_fan_magnitude_gain.value)
        conditions2.append(dataframe['fan_magnitude'] >= 1)

        dataframe['ichv_delayed_signal'] = pd.Series(index=dataframe.index, data=np.where(reduce(lambda x, y: x & y, conditions2), 1, 0)).rolling(rolling).sum()

        return dataframe['ichv_delayed_signal'] > 0

    def populate_entry_trend(self, dataframe: DataFrame, metadata: dict) -> DataFrame:
        conditions = []

        # GUARDS AND TRENDS
        # if self.buy_adx_enabled_more.value:
        #     conditions.append(dataframe["adx"] > self.buy_adx.value)
        # if self.buy_rsi_enabled_less.value:
        #     conditions.append(dataframe["rsi"] < self.buy_rsi.value)
        # if self.buy_doji_enabled.value:
        #     conditions.append(dataframe["dragon_fly"] > self.buy_doji.value)

        # TRIGGERS
        # if self.buy_trigger.value != "macd_cross_signal":
        conditions.append(dataframe["close"] < dataframe[f"{self.buy_trigger.value}"])
        # else:
        #     conditions.append(qtpylib.crossed_above(dataframe["macd"], dataframe["macdsignal"]))

        # if self.buy_stoch_enabled.value:
        #     conditions.append(qtpylib.crossed_above(dataframe["fastk"], dataframe["fastd"]))

        if self.buy_aroon_enabled.value:
            aroon_crossed_above(dataframe, self.buy_rolling_aroon.value)

            # conditions.append(dataframe["aroon_osc"] >= 0)

        conditions.append(touch_above(dataframe, self.buy_rolling.value))
        conditions.append(dataframe["low"] < dataframe["keltner_upper"])
        conditions.append(self.delayed_signal_trend(dataframe, metadata, self.buy_rolling_ichv.value))

        # Check that volume is not 0
        conditions.append(dataframe["volume"] > 0)



        if conditions:
            dataframe.loc[reduce(lambda x, y: x & y, conditions), "buy"] = 1

        # if conditions2:
        #     dataframe.loc[reduce(lambda x, y: x & y, conditions2), "buy"] = 1

        return dataframe

    def populate_exit_trend(self, dataframe: DataFrame, metadata: dict) -> DataFrame:
        """
        Based on TA indicators, populates the sell signal for the given dataframe
        :param dataframe: DataFrame populated with indicators
        :param metadata: Additional information, like the currently traded pair
        :return: DataFrame with sell column
        """
        conditions = []

        # GUARDS AND TRENDS
        # if self.sell_adx_enabled_more.value:
        #     conditions.append(dataframe["adx"] > self.sell_adx.value)
        # if self.sell_rsi_enabled_more.value:
        #     conditions.append(dataframe["rsi"] > self.sell_rsi.value)

        if self.sell_aroon_enabled.value:
            conditions.append(dataframe["aroon_osc"] <= self.sell_aroon.value)

        # TRIGGERS
        if self.sell_trigger1_enabled.value:
            conditions.append(dataframe["close"] > dataframe[f"{self.sell_trigger.value}"])


        # Check that volume is not 0
        conditions.append(dataframe["volume"] > 0)


        conditions2 = []

        if self.sell_trend_stop_enabled.value:
            conditions2.append(dataframe['ht_trendmode'] == 0)

        # if self.sell_predict_down.value:
        #     conditions2.append(dataframe["&s-up_or_down"] == "down")

        # if self.sell_diff_ht_dcphase_enabled.value:
        conditions2.append(dataframe['arc_diff_ht_dcphase'] > self.sell_arc_diff_ht_dcphase.value)

        # if self.sell_diff_fan_magnitude_enabled.value:
        conditions2.append(dataframe['arc_diff_fan_magnitude'] > self.sell_arc_diff_fan_magnitude.value)

        conditions2.append(qtpylib.crossed_below(dataframe['trend_close_5m'], dataframe[f"{self.sell_trigger.value}"]))
        conditions2.append(dataframe['fan_magnitude'] <= 1)

        if conditions:
            dataframe.loc[reduce(lambda x, y: x & y, conditions), "exit_long"] = 1

        if conditions2:
            dataframe.loc[reduce(lambda x, y: x & y, conditions2), "exit_long"] = 1

        return dataframe
```
