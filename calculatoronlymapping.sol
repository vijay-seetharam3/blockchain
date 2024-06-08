// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract mapcal{
    uint public num1;
    uint public num2;
    address public owner;
    uint public total;
    mapping(address=>bool) public addradd;
    constructor(){
        owner=msg.sender;
    }
    function setval(uint a,uint b)public{
        num1=a;
        num2=b;
    }
    function addaddr(address a) public {
        require(addradd[a]==true,"invalidd");
        addradd[a]=true;
    }
    function add()public {
        require(addradd[msg.sender]==true,"invalid");
        total=num1+num2;
    }
}