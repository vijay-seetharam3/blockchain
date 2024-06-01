// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract cal{
    uint public num1;
    uint public num2;
    uint public total;
    address public owner;
    mapping(address=>bool) private valid;
    function getval(uint a,uint b)public {
        num1=a;
        num2=b;
    }
    constructor() {
        owner=msg.sender;
    }
    function validaddr(address a) payable public{
        require(msg.value==5 ether,"invalidd");
        valid[a]=true;
    }
    function add()public payable {
        require(msg.value==1 ether || owner==msg.sender,"invalid user");
        total= num1+num2;
    }
    function sub()public payable returns(uint){
        require(msg.value==1 ether || owner==msg.sender,"invalid user");
        uint total1 = num1 - num2;
        return total1;
    }
    function mul()public view returns(uint){
        require(valid[msg.sender]==true || owner==msg.sender);
        return num1*num2;
    }
    function div()public view returns(uint){
        require(valid[msg.sender]==true,"invalidd");
        return num1/num2;
    }
}