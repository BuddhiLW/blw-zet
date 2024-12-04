# Freqtrade commands

20241201003220

``` bash
cd /home/russell/PP/ft-experience/ft_userdata
freqtrade trade --config user_data/config_run23.json --strategy BLW_run23
```

20241204020906

``` bash
cd ft_userdata
nohup docker-compose run --rm freqtrade trade --config ./user_data/config_run20.json --strategy BLW_run20 --db-url sqlite:///tradesv3.blw20_run.sqlite &
```
