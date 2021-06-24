# Hyperledger BESU Sample

Sample Network Script to run Hyperledger BESU Client with Ganache local test ethereum network.

## Pre-Requisite

-    Docker
-    Ganache-cli

## Run

1. Open dir `besu-sample` in terminal

```
cd besu-sample
```

2. Run the Ganach-CLI

```
ganache-cli
```

3. Specify the JSON-RPC port

```
export JSON_RPC_PORT=7545 # default - 7545
```

4. Run the script

```
chmod +x ./network.sh
./network.sh
```
