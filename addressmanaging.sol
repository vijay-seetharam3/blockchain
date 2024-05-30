// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AddressList {
    address[] public addresses;

    function addAddress(address _address) public {
        addresses.push(_address);
    }

    function getAddress(uint index) public view returns (address) {
        require(index < addresses.length, "Index out of bounds");
        return addresses[index];
    }

    function removeAddress(uint index) public returns (address) {
        require(index < addresses.length, "Index out of bounds");
        for (uint i = index; i < addresses.length - 1; i++) {
            addresses[i] = addresses[i + 1];
        }
        addresses.pop();
        return addresses[addresses.length-1];
    }

    function getAddresses() public view returns (address[] memory) {
        return addresses;
    }
}