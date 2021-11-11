// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "../installed_contracts/sidemesh-solidity/contracts/sidemesh/Sidemesh.sol";
import "../installed_contracts/sidemesh-solidity/contracts/lock/LockManager.sol";
import "../installed_contracts/sidemesh-solidity/contracts/transaction/GlobalTransactionManager.sol";

contract CrossPrimary {

    string constant BESU_NETWORK_ID = "hl_besu_test_network";
    string constant FABRIC_NETWORK_ID = "hl_besu_test_network";

    ISidemesh sidemesh;
    ILockManager lockManager;
    IGlobalTransactionManager globalTxManager;

    constructor(address _sidemesh, address _lockManager, address _globalTxManager){
        sidemesh = ISidemesh(_sidemesh);
        lockManager = ILockManager(_lockManager);
        globalTxManager = IGlobalTransactionManager(_globalTxManager);
    }

    function initNetwork() external{
        sidemesh.setNetwork(BESU_NETWORK_ID);
    }

    function doCross(string memory a, string memory b, uint ttlHeight, uint ttlTime, address crossNetwork)external returns(string memory){
        globalTxManager.startGlobalTransaction(ttlHeight, ttlTime);
        lockManager.putLockedStateWithPrimaryLock("testlocka", abi.encodePacked(a));
        lockManager.putLockedStateWithPrimaryLock("testlocka", abi.encodePacked(a));

        string[] memory args = new string[](1);
        args[0] = string(abi.encodePacked(a, b));
        globalTxManager.registerNetworkTransaction(FABRIC_NETWORK_ID, 2, crossNetwork, "doNetwork", args);
        globalTxManager.preparePrimaryTransaction("doCross");

        return string(abi.encodePacked(a, b));
    }

    function confirmDoCross(
        address primaryPrepareTxSender,
        string memory network2,
        string memory chain2,
        string memory txSender2,
        string memory txProof2
    )external{
        string[][] memory networkTxRes = new string[][](1);
        networkTxRes[0] = new string[](4);
        networkTxRes[0][0] = network2;
        networkTxRes[0][1] = chain2;
        networkTxRes[0][2] = txSender2;
        networkTxRes[0][3] = txProof2;
        globalTxManager.confirmPrimaryTransaction(primaryPrepareTxSender, networkTxRes);
    }
}