#!/bin/bash

./network.sh up;
jq ".orderers[\"orderer.example.com\"].tlsCACerts.pem=\"$(cat organizations/ordererOrganizations/example.com/tlsca/tlsca.example.com-cert.pem )\" | .peers[\"peer0.org1.example.com\"].tlsCACerts.pem=\"$(cat organizations/peerOrganizations/org1.example.com/tlsca/tlsca.org1.example.com-cert.pem )\" | .peers[\"peer0.org2.example.com\"].tlsCACerts.pem=\"$(cat organizations/peerOrganizations/org2.example.com/tlsca/tlsca.org2.example.com-cert.pem )\" | .certificateAuthorities[\"ca.org1.example.com\"].tlsCACerts.pem=\"$(cat organizations/peerOrganizations/org1.example.com/ca/ca.org1.example.com-cert.pem )\" | .certificateAuthorities[\"ca.org2.example.com\"].tlsCACerts.pem=\"$(cat organizations/peerOrganizations/org2.example.com/ca/ca.org2.example.com-cert.pem )\"" ../mychannel/connection_tp.json > ../mychannel/connection.json;
jq ".credentials.certificate=\"$(cat organizations/peerOrganizations/org1.example.com/users/User1@org1.example.com/msp/signcerts/User1@org1.example.com-cert.pem )\" | .credentials.privateKey=\"$(cat organizations/peerOrganizations/org1.example.com/users/User1@org1.example.com/msp/keystore/priv_sk )\"" ../user1@org1-example-com_tp.json > ../user1@org1-example-com.json;

./network.sh createChannel -c mychannel;

