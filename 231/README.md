# Quick Notes on Software development


When on VPN, or DNS "restricted" networks, use `--network=host`.

``` bash
sudo docker build --network=host -t website-test:latest .
```
