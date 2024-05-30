// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract SandR{
    uint public  snum;
    function set(uint num) public{
        snum=num;
    }
    /*function get()view public returns(uint) {
        return snum;
    }*/
}