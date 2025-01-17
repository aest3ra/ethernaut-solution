# ethernaut-solution


## Set .env file

```.env
PRIVATE_KEY = ""
ETHERSCAN_KEY = ""
MY_ADDRESS = ""
```

## 삽질...

```
1. Holesky network는 지원하지 않는다. Sepolia network를 사용하자.
2. Sepolia network를 사용할 떄 foundary.toml 파일에 eth_rpc_url 를 추가하자.
```