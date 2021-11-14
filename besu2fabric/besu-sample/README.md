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
export JSON_RPC_PORT=8545 # default Port - 7545
```

4. Deploy CrossChain Contract

```
cd hl_besu
npm install
truffle install sidemesh-solidity
truffle compile
truffle migrate
```

5. Run the script

```
chmod +x ./network.sh
./network.sh
```

7. Make sure you both the Fabric network is running.

8. Make sure you both the Mesher relays are running

-    Go to Mesher directory
-    Add proper environment variables
-    Run the networks

```
SPRING_PROFILES_ACTIVE=hl-besu ./gradlew boolrun
```

9. Run the tests

```
truffle test
```
