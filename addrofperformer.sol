// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract addrofperformer{
    uint public cnt;
    address public addri;
    address public addrd;
    function setval(uint a)public {
        cnt=a;
    }
    function increment()public {
        cnt++;
        addri=msg.sender;
    }
    function decrement()public {
        cnt--;
        addrd=msg.sender;
    }
}