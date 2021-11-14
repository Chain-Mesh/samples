// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "sidemesh-solidity/resource/Register.sol";

contract ResorceRegistery {

    IRegister register;
    constructor(address _register) {
        register = IRegister(_register);
    }
    function register(
        string memory network,
        uint chain,
        string memory connection) 
        external {
            register.register(network, chain, connection);
    }
    
    function resolve(
        string memory network, 
        uint chain) 
        external view
        returns(string memory){
            return register.resolve(network, chain);
    }
}