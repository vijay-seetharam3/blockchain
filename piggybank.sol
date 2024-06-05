// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract piggybank {
    address public owner;
    uint amnt;
    constructor(){
        owner=msg.sender;
    }
    function deposit() external payable{
        require(msg.sender==owner && msg.value!=0,"you are not the owner");
        amnt+=msg.value;
    }
    function withdraw() public{
        require(msg.sender==owner,"you are not owner of this piggy bank");
        payable(msg.sender).transfer(amnt);
    }
}