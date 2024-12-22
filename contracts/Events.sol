// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";

// Events log data on the blockchain
contract Events1 {
    string public message = "Hello World";

    // Defining event
    // Note: events can have up to 17 arguments
    // You can use any basic data type you want (e.g. string, uint, address, bool, etc...)
    event MessageUpdated(

        // The indexed keyword allows you to search for events based on the indexed argument
        // Allows for subscription to an event based on a specific indexed argument(user in this case)
        // You can index up to 3 arguments
        address indexed _user,
        string _message
    );

    function updateMessage(string memory _message) public {
        message = _message;

        // Emitting event
        // Can also be written using the state variable "message": 
        // ---> emit MessageUpdated(msg.sender, message); <---
        emit MessageUpdated(msg.sender, _message);
    }
}
