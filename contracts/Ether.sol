// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";

// https://eth-converter.com/
contract Ether1 {

    // Declare contract state variables with Ether units
    uint public value1 = 1 wei;
    uint public value2 = 1;
    uint public value3 = 1 gwei;
    uint public value4 = 1000000000;
    uint public value5 = 1 ether;
    uint public value6 = 1000000000000000000;
}

contract Ether2 {
    // Allows contract to receive Ether (receive() is a new function in Solidity 0.6)
    // msg.data must be empty
    receive() external payable {}
}

contract Ether3 {
    uint public count = 0;

    // Allows contract to receive Ether
    // msg.data is not empty
    // called as "fallback" if receive() not implemented
    // You can also execute business logic inside these functions
    fallback() external payable {
        count ++;
    }

    // Shows how to get Ether blance of current contract: "this"
    function checkBalance() public view returns (uint) {
        return address(this).balance;
    }
}


// Transferring Ether from contract to another address
contract Ether4 {

    // Not preferred way to transfer Ether
    function transfer1(address payable _to) public payable {
        // Don't do it this way...
        _to.transfer(msg.value);
    }

    // Preferred way to transfer Ether
    // Can inspect return value to check if transfer was successful
    // Can specify metadata for the transfer
    function transfer2(address payable _to) public payable {
        // Use #call() instead!
        (bool sent, ) = _to.call{value: msg.value}("");

        // Check if transfer was successful
        require(sent, "Failed to send Ether");
    }
}

// Payable
contract Ether5 {
    uint public balance;

    function deposit1() public {
        // Not payable, will fail if trying to send ether...
        // balance += msg.value;
    }

    function deposit2() public payable {
        balance += msg.value;
    }
}
