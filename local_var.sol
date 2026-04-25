// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract localVariable {
    uint public  num;
    
    function local() public returns(uint, uint, address) {
        uint i = 300;
        num = i;
        i += 16;
        address myAddresses =  address(1);
        return (i, num, myAddresses);
    }
}