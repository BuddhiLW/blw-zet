---
title: "Freqtrade Moving Averages strats"
description: "# Indicators:- bb_upper- bb-mid- b b_lower- ht_trendline- h t_t trendsline_1h- h  ht trendlines_1d"
published: "2025-01-11"
image: "images/image-post-159.png"
draft: false
---

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
