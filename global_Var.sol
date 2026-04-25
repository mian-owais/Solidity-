// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract globalVar{
    address public owner;
    address public myBlockHash;
    uint public Difficulty;
    uint public gasLimit;
    uint public Number;
    uint public value;
    uint public timeStamp;
    uint public gasPrice;
    uint public nowOn;
    address public Origin;
    bytes public callData;
    bytes4 public firstFour;



    constructor(){
        owner = msg.sender; //Global Variable (Who ever deploy this contract will be the owner of this Contract)
        //Owner Add = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC41
        //Account Add=0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
        //These both are same.( What it does that it takes the account adders 
        //                     taken from which we deploy this Contract and assign
        //                     to the owner Variable)

        //-------- All Other Global Variables ---------------

    myBlockHash = block.coinbase;
    Difficulty = block.prevrandao; //same is difficulty in previous version
    gasLimit = block.gaslimit;
    Number = block.number;
    timeStamp = block.timestamp;
    gasPrice = tx.gasprice;
    Origin = tx.origin;
    callData = msg.data;
    firstFour = msg.sig;

    // value = msg.data;
    // nowOn = now;
    }
}