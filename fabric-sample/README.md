# Hyperledger BESU Sample

Sample Network Script to run Solidity Smart Contracts in Hyperledger Fabric using fabric-chaincode-evm.

## Pre-Requisite

-    Hyperledger Fabric
-    Fabric Chaincode EVM
-    Truffle

## Run

1. Go to Dir `fabric-sample/test-network`

```
cd fabric-sample/test-network
```

2. Start the Network

```
./network.sh up
```

3. Make & Join channel

```
./scripts/prepare.sh
```

4. Deploy Fabric EVM CC

```
./scripts/installEVMCC.sh
```

5. Deploy sample contract
   Simple [Storage contract](https://gist.github.com/Shritesh99/7847ca54376883483d851a7e994f958d) is deployed in this step.

```
./scripts/deployContract.sh
```

6. Intract with the Contract
   Copy contract adress from previous command and paste parameters as per the following [blog](https://medium.com/coinmonks/solidity-smart-contract-on-hyperledger-fabric-3d50f25e577b) in the script `scripts/interactContract.sh` then, run the script.

```
./scripts/interactContract.sh
```

7. Setup Fab3
   Clone the [fabric-chaincode-evm](https://github.com/hyperledger/fabric-chaincode-evm) in your `$GOPATH/github.com/hyperledger`
   path.
   Setting Fab3 according to the configuration given [here](https://github.com/hyperledger/fabric-chaincode-evm/blob/main/examples/EVM_Smart_Contracts.md#using-web3).

     Make your `first-network-sdk-config.yaml` according to the [first-network-sdk-config.yaml](./first-network-sdk-config.yaml)

```
mkdir -p $(go env GOPATH)/src/github.com/hyperledger/
git clone https://github.com/hyperledger/fabric-chaincode-evm.git $(go env GOPATH)/src/github.com/hyperledger/fabric-chaincode-evm
cd $(go env GOPATH)/src/github.com/hyperledger/fabric-chaincode-evm
```

Export necessary variables.

```
export FAB3_CONFIG=${GOPATH}/src/github.com/hyperledger/fabric-chaincode-evm/examples/first-network-sdk-config.yaml # Path to a compatible Fabric SDK Go config file
export FAB3_USER=User1 # User identity being used for the proxy (Matches the users names in the crypto-config directory specified in the config)
export FAB3_ORG=Org1  # Organization of the specified user
export FAB3_CHANNEL=mychannel # Channel to be used for the transactions
export FAB3_CCID=evmcc # ID of the EVM Chaincode deployed in your fabric network. If not provided default is evmcc.
export FAB3_PORT=5000 # Port the proxy will listen on. If not provided default is 5000.
```

Building the Fab Proxy

```
make fab3
```

Running Fab3 Proxy

```
./bin/fab3
```

**Output**

```
{"level":"info","ts":1627068073.4284694,"logger":"fab3","caller":"cmd/main.go:149","msg":"Starting Fab3","port":5000}
```

8. Truffle tests

Install truffle globally using npm

```
npm install truffle -g
```

In another terminal go to `samples/fabric-sample/InteractContract`

```
cd samples/fabric-sample/InteractContract
```

Run the migrations

```
truffle migrate
```

Run the tests

```
truffle test
```
