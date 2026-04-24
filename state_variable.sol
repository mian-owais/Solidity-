// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract stateVar{
    //Define State Variables 
    string public name;
    uint public regNum ;
    // bytes public  defByte;
    // uint[] public arr;

    
    //--------------------- Def & Initialize State Variable -------------------

    // string public defName = "Hi, How are you Hashmii";
    // uint public defRegNum = 2023316;
    // bytes public defBytes = "Hi, This is me, Owais"; //This data will be store in term 
    // of bits and bytes insted of String, So thats why its cost Efficient.

    //------------ Initialize through Constructor ------------------ 
    // constructor (string memory _name, uint _Reg){
    //     name = _name;
    //     regNum = _Reg;
    // }


    //-------------- Init Through Functions -----------------------
    function updates (string memory _name, uint _Reg) public {
        name = _name;
        regNum = _Reg;
    }

}