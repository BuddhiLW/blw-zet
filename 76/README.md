# Kelly Criterion for Blackjack - Betting Variation

Optimal betting variation for a given bank-roll can be found using the Kelly Criterion.

This happens when `f`, the fraction of the bankroll used to bet, is exactly `p`-`q` - the player's edge over the house (`p` probability of winning; `q` probability of losing).

Therefore, given that we have a minimum hand of `5$`, what should be our bank, such that when true-count is 3, we want the optimal-bet to be `15$`.

True-counts give an proximally `0.5` player-edge gain. So, true-count `3` should give that `f=1.5`.

Therefore, `1.5%*bank = 15$` implies 1000$ should be your bank-roll at the time of bet.


