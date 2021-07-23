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
peer chaincode invoke -o localhost:7050 --tls --cafile $ORDERER_CA -C mychannel -n evmcc --peerAddresses localhost:7051 --tlsRootCertFiles $PEER0_ORG1_CA --peerAddresses localhost:9051 --tlsRootCertFiles $PEER0_ORG2_CA -c '{"Args":["83c75ce0cc0a62ca1a704c17a82cbfdafbb55a0f","6057361d0000000000000000000000000000000000000000000000000000000000000007"]}'
peer chaincode query -n evmcc -C mychannel -c '{"Args":["83c75ce0cc0a62ca1a704c17a82cbfdafbb55a0f","2e64cec1"]}'