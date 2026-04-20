// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;


contract NFTCount {
    uint256 public count_NFT;
    // Check total number of NFT's
    function Check_NFT_Count() public view returns (uint256)  {
        return count_NFT;
    }
    
    //Create NFT's
    function addNFT() public {
        count_NFT += 1;
    }
    
    // delete NFT'S
    function delNFT() public {
        count_NFT -= 1;
    }
    
}