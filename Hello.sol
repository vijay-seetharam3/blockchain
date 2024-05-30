// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HelloWorld {
    // State variable to store the greeting message
    string private greeting = "Hello, World!";

    // Function to get the greeting message
    function getGreeting() public view returns (string memory) {
        return greeting;
    }
}