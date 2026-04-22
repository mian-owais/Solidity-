// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract refDatatype{
    //----------------- Array ------------------
    // In Solidity the datatype bytes represent the sequence of bytes.
    //There are two type of bytes: 
    //---------------------------(i) Fixed Size bytes Array ----> (define explicitly) 
    //                               For fixed size you should to set the number.
    //---------------------------(ii) Dynamic Size bytes Array --->(dynamic based on the function)
    //                               When  you define bytes in smart contract, it represents  dynamic bytes array
    // There is no difference b/w bytes and string, but byte is more efficient.
    
    //bytes1 public b1; Represtation = start with 0 and then we have data like " 0x16 ",  "0xf6 "
    //bytes1 public b2;

    bytes1 public b1 = 0xf6; //[101010110]
    bytes1 public b2 = 0x16; //[11100011]

}