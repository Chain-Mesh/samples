#!/bin/bash

export CORE_PEER_TLS_ENABLED=true;
export ORDERER_CA=${PWD}/organizations/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem;
export PEER0_ORG1_CA=${PWD}/organizations/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt;
export PEER0_ORG2_CA=${PWD}/organizations/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/ca.crt;

export CORE_PEER_LOCALMSPID="Org1MSP";
export CORE_PEER_TLS_ROOTCERT_FILE=$PEER0_ORG1_CA;
export CORE_PEER_MSPCONFIGPATH=${PWD}/organizations/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp;
export CORE_PEER_ADDRESS=localhost:7051;

export PATH=${PWD}/../bin:$PATH;
export FABRIC_CFG_PATH=$PWD/../config/;

# Paste Contract Adress from previous command as key to the "Args" parameter {"Args":["<contract adress>","<input from remix>"]}
peer chaincode query -n evmcc -C mychannel -c '{"Args":["account"]}'
peer chaincode invoke -n evmcc -C mychannel -c '{"Args":["ab491d97ebe46d4fc3bd25e1e23b78cbe9e7cb4d","6057361d0000000000000000000000000000000000000000000000000000000000000005"]}' -o localhost:7050 --tls --cafile $ORDERER_CA
peer chaincode query -n evmcc -C mychannel -c '{"Args":["ab491d97ebe46d4fc3bd25e1e23b78cbe9e7cb4d","2e64cec1"]}'