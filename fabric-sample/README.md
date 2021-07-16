# Hyperledger BESU Sample

Sample Network Script to run

## Pre-Requisite

-    Hyperledger Fabric
-    Fabric Chaincode EVM

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
