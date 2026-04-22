// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract funDemo{
    //------ Definition : function is a group of Code that can be reuse any where 
    //throughout the Program, which generally saves the excessive use of memeory 
    //and decrease the runtime of the program.
    // Creating a function reduce the need of writing the same code again and agin.
    // With the help of function a program can be divided into small pieces of code
    //for better understanding and managing.

    //------- Types :
    //              (i) Declarative.
    //              (i) Non Declarative.


    //--------- Skelton :
    // function <function - name> (Parameters-list) scope returns(return-type){}

    //uint256 public num;
    int num;

    function getInfo() public view returns (int){ //view is used to look for the state variable
        return num;
    }

    function updData(int256 _num) public{
        num = _num;
    }

    function addData(int _a, int _b) public  returns (int){ // here i use pure insted of view, because i dont need to change or look any state variable, so it only perform coputation. 
        int newNum = _a + _b;
        num = newNum;
        return num;
    }
}

// ABI of This Code

// [
// 	{
// 		"inputs": [
// 			{
// 				"internalType": "int256",
// 				"name": "_a",
// 				"type": "int256"
// 			},
// 			{
// 				"internalType": "int256",
// 				"name": "_b",
// 				"type": "int256"
// 			}
// 		],
// 		"name": "addData",
// 		"outputs": [
// 			{
// 				"internalType": "int256",
// 				"name": "",
// 				"type": "int256"
// 			}
// 		],
// 		"stateMutability": "nonpayable",
// 		"type": "function"
// 	},
// 	{
// 		"inputs": [
// 			{
// 				"internalType": "int256",
// 				"name": "_num",
// 				"type": "int256"
// 			}
// 		],
// 		"name": "updData",
// 		"outputs": [],
// 		"stateMutability": "nonpayable",
// 		"type": "function"
// 	},
// 	{
// 		"inputs": [],
// 		"name": "getInfo",
// 		"outputs": [
// 			{
// 				"internalType": "int256",
// 				"name": "",
// 				"type": "int256"
// 			}
// 		],
// 		"stateMutability": "view",
// 		"type": "function"
// 	}
// ]


// Byte Code: 6080604052348015600e575f5ffd5b5061024b8061001c5f395ff3fe60806040
//              5234801561000f575f5ffd5b506004361061003f575f3560e01c80632c99cd
//              1a146100435780635a9b0b89146100735780635d6ced8014610091575b5f5f
//              fd5b61005d60048036038101906100589190610116565b6100ad565b604051
//              61006a9190610163565b60405180910390f35b61007b6100ce565b60405161
//              00889190610163565b60405180910390f35b6100ab60048036038101906100
//              a6919061017c565b6100d6565b005b5f5f82846100bb91906101d4565b9050
//              805f819055505f5491505092915050565b5f5f54905090565b805f81905550
//              
//              50565b5f5ffd5b5f819050919050565b6100f5816100e3565b81146100ff575
//              f5ffd5b50565b5f81359050610110816100ec565b92915050565b5f5f604083
//8503121561012c5761012b6100df565b5b5f61013985828601610102565b925050602061014a8
//5828601610102565b9150509250929050565b61015d816100e3565b82525050565b5f60208201
//90506101765f830184610154565b92915050565b5f60208284031215610191576101906100df5
//65b5b5f61019e84828501610102565b91505092915050565b7f4e487b71000000000000000000
//000000000000000000000000000000000000005f52601160045260245ffd5b5f6101de826100e
//3565b91506101e9836100e3565b92508282019050828112155f8312168382125f841215161715
//61020f5761020e6101a7565b5b9291505056fea2646970667358221220e138fb05c235b9eb54e
//286d30491b43f0d150f8770e971e60b91fc1e6c79a52064736f6c634300081e0033