# Freqtrade Moving Averages strats

# Indicators:

- bb_upper
- bb_mid
- bb_lower
- ht_trendline
- ht_trendline_1h
- ht_trendline_1d
- stoch (slowk, slowd)

## Long

### Entry
Trigger: 
- (slowk crossed above slowd)

Context:
- ht_trendline_1h > bb_lower
- bb_upper > ht_trendline
- ht_trendline > bb_mid
- all > ht_trendline_1d

### Sell
- (slowk crossed below slowd)

