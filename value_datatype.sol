// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract ValDatatype{
    //-----------Boolean datatype--------------------------------------------------------
    //by default bool value is false 
    // bool public hay; 
    // bool public no = true;



    //------------Unsign integer--------------------------------------------------------- 
    //( Rnage from 8 to 256 ) ---> mean positive integers
    //These  ranges are important for overflow underflow
    //by default it take 256 ---> uint is alies of uint 256

    // uint8 public number; // Range 2^8 - 1 = 255
    // uint16 public number1; // Range 2^8 - 1 = 65535
    // uint256 public number2; // Range 2^256 - 1 = 1.15792e+77

    // uint public u =1;
    // uint public u4 =256;
    // uint public u3 =5;



    //-------------Negative Integers------------------------------------------------------
    // Range from (-2*255) to (2*255 - 1) =  - 5.7896045e76 to 5.7896045e76
    // int8 public i1 = -1;
    // int public i4 = 256;
    // int256 public i256 = -5;


    // -----------Min Max Range of INTEGERS----------------
    // int public minInt = type(int).min;
    // int public maxInt = type(int).max; 



    //-------------- Address Datatype ---------------------------------------------------
    address public defAdd;
    address public add = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;


    //  NOTE : In Solidity there is no Concept of NULL & Undefined.
    // So, lets check the defualt vale of each datatype. 
    
    bool public defVal; // False 
    int public defVal1; // 0
    uint public defVal2; // 0
    address public defVal3; // 0x000000
}