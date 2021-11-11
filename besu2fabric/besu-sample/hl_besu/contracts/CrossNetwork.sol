// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "sidemesh-solidity/sidemesh/Sidemesh.sol";
import "sidemesh-solidity/lock/LockManager.sol";
import "sidemesh-solidity/transaction/GlobalTransactionManager.sol";

contract CrossNetwork {
    string constant BESU_NETWORK_ID = "hl_besu_test_network";
    string constant FABRIC_NETWORK_ID = "hl_besu_test_network";

    ISidemesh sidemesh;
    ILockManager lockManager;
    IGlobalTransactionManager globalTxManager;

    constructor(
        address _sidemesh,
        address _lockManager,
        address _globalTxManager
    ) {
        sidemesh = ISidemesh(_sidemesh);
        lockManager = ILockManager(_lockManager);
        globalTxManager = IGlobalTransactionManager(_globalTxManager);
    }

    function initNetwork() external {
        sidemesh.setNetwork(FABRIC_NETWORK_ID);
    }

    function doNetwork(
        string memory value,
        address globalTxQueryContract,
        string memory globalTxQueryFunc,
        string memory primaryNetwork,
        uint primaryChain,
        address primaryTxSender,
        string memory primaryTxProof
    ) external{
        globalTxManager.startNetworkTransaction(primaryNetwork, primaryChain, primaryTxSender, primaryTxProof);
        lockManager.putLockedStateWithNetworkLock("testlocka", bytes(value), primaryNetwork, primaryChain, primaryTxSender);
        globalTxManager.prepareNetworkTransaction(primaryNetwork, primaryChain, primaryTxSender, globalTxQueryContract, globalTxQueryFunc, "doNetwork");
    }

    function confirmDoNetwork(
        address networkPrepareTxSender,
        uint globalTxStatus,
        string memory primaryNetwork,
        uint primaryChain,
        address primaryConfirmTxSender,
        string memory primaryConfirmTxProof
    ) external {
        globalTxManager.confirmNetworkTransaction(networkPrepareTxSender, globalTxStatus, primaryNetwork, primaryChain, primaryConfirmTxSender, primaryConfirmTxProof);
    }
}
