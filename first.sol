// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

contract MyFirstContract {
    //------ { Different Way to update the State Variables } ------ 
    
    //----> { 1st Way } of initialization 

    //string public Name = "Owais Hashmii";
    //uint256 public Reg = 2023316;
//---------------------------------------------------------------    
    //-----> { 2nd Way } Using Constructor 

    // string public Name;
    // uint256 public Reg;

    // constructor (string memory _Name, uint _Reg){
    //     Name = _Name;
    //     Reg = _Reg;
    // }

//----------------------------------------------------------------
    //------> { 3rd Way } Using Function
    
    string public Name;
    uint256 public Reg;

    function Info (string memory _Name, uint _Reg) public {
        Name = _Name;
        Reg = _Reg;
    }
}

//ABI : []


// Byte Code:  {6080604052348015600f57600080fd5b50603f80601d6000396000f3fe6080604052600080fdfea2646970667358221220ffccb76b63016df1afd80750b1334e45ab136ed8c6e049cba21931a18d74ba1e64736f6c634300080d0033}