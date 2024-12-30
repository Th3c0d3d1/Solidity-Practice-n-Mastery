// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract Errors1 {

    // Use require to check a condition
    // Event to log messages from the contract
    event Log(string message);

    // User inputs a value, if it is less than 10, it will revert
    function example1(uint _value) public {

        // If the require fails, this will be emitted
        require(_value > 10, "must be greater than 10");
        // If the require passes, this will be emitted
        emit Log("success");
    }

    // Revert with a custom message
    // Least used form of error handling
    function example2(uint _value) public {
        if (_value <= 10) {
            revert("must be greater than 10");
        }
        emit Log("success");
    }

    // Usually checks internal values & equality...
    function example3(uint _value) public {
        assert(_value == 10);
        emit Log("success");
    }

    // Custom error handling
    error InvalidValue(uint value);

    // Trigger a custom error
    function example4(uint _value) public {
        if (_value <= 10) {

            // Key value pair ({value: _value})
            // You can add more arguments to this...
            // Error message will be triggereed if value is less than 10
            revert InvalidValue({value: _value });
        }
        emit Log("success");
    }
}
