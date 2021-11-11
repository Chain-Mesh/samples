// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "sidemesh-solidity/resource/Verifier.sol";

contract VerifierRegistery {

    IVerifier verifier;
    constructor(address _verifier) {
        verifier = IVerifier(_verifier);
    }
    function register(
        string memory network,
        uint chain,
        address contractC, 
        string memory functionC) 
        external {
            verifier.register(network, chain, contractC, functionC);
    }
    
    function resolve(
        string memory network, 
        uint chain) 
        external view
        returns(string memory){
            return verifier.resolve(network, chain);
    }
}