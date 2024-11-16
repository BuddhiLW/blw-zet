# Freqtrade Hyperopt hacks

Use `SortinoHyperOptLoss` to optimize `buy` and `sell` calls. This will be a little bit aggressive, if your strategy can handle good buys, but will come with a fare share of drop-down. This will be mostly caped by your sell, but even more so, by the next optimization using `CalmarHyperOptLoss`, of `roi` and `stoploss` parameters.

Finally, `trailing` and `protection` is very customized in your strategy will make it that much safer, while maintaining sizable gains. This will be the icing in the cake. 

Now, a script can be done, as the following, to train an strategy throughout a time-frame, and shift the months on each training, so not to over-fit.


``` bash
#!/bin/bash

# Initialize TIME_BEGIN and TIME_END
TIME_BEGIN_INIT=20240101
TIME_END_INIT=20240401
TIME_BEGIN=$TIME_BEGIN_INIT
TIME_END=$TIME_END_INIT

# Define the commands to be run
COMMAND1="freqtrade hyperopt --hyperopt-loss SortinoHyperOptLoss --strategy BLW_train14 -e 700 --spaces buy sell --timerange=$TIME_BEGIN-$TIME_END"
COMMAND2="freqtrade hyperopt --hyperopt-loss CalmarHyperOptLoss --strategy BLW_train14 -e 1000 --spaces roi stoploss --timerange=$TIME_BEGIN-$TIME_END"
COMMAND3="freqtrade hyperopt --hyperopt-loss CalmarHyperOptLoss --strategy BLW_train14 -e 500 --spaces trailing protection --timerange=$TIME_BEGIN-         $TIME_END"

# Function to increment date by 1 month
increment_month() {
    local date=$1
    echo $(date -d "${date}01 +1 month -1 day" +"%Y%m%d")
}

# Function to shift begin and end dates by 1 month
shift_dates() {
    TIME_BEGIN=$(date -d "$TIME_BEGIN +1 month" +"%Y%m%d")
    TIME_END=$(date -d "$TIME_END +1 month" +"%Y%m%d")

    # Reset TIME_BEGIN to 20240101 when TIME_END reaches 20241101
    if [ "$TIME_END" == "20241201" ]; then
      TIME_BEGIN=$TIME_BEGIN_INIT
      TIME_END=$TIME_END_INIT
    fi
}

# Loop 30 times
for i in {1..30}
do
    echo "Running iteration $i..."
    
    # Run the commands with the current TIME_BEGIN and TIME_END
    eval $COMMAND1
    eval $COMMAND2
    eval $COMMAND3

    # Shift the dates for the next iteration
    shift_dates
done

echo "All 30 iterations completed."
```
