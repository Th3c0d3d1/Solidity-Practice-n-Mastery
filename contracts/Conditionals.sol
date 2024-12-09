// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract Conditionals1 {
    // Check if a number is even or odd
    function evenOrOdd1(uint x) public pure returns (string memory) {

        // Use the modulo operator to check if the number is even or odd
        // 10 % 2 = 0, 11 % 2 = 1
        if (x % 2 == 0) {
            return "even";
        } else {
            return "odd";
        }
    }

    // Simplified version of evenOrOdd1
    // Exact same functionality as evenOrOdd1
    function evenOrOdd2(uint x) public pure returns (string memory) {
        if (x % 2 == 0) {
            return "even";
        }

        return "odd";
    }

    // Simplified version of evenOrOdd2
    // Exact same functionality as evenOrOdd1
    function evenOrOdd3(uint x) public pure returns (string memory) {
        // The ternary operator is a shorthand for an if-else statement
        // if true ? return this (even) : else return this (odd)
        return x % 2 == 0 ? "even" : "odd";
    }
}

contract Conditionals2 {
    // Check if a number is positive, negative, or zero
    function checkNumber1(uint x) public pure returns (uint) {
        if (x < 10 ) {
            return 0;
        } else if (x < 100) {
            return 1;
        } else {
            return 2;
        }
    }

    // Using nested conditionals
    function checkNumber2(uint x) public pure returns (uint) {
        if (x < 10 ) {
            if (x < 5) {
                return 0;
            } else {
                return 1;
            }
        } else if (x < 100) {
            return 2;
        } else {
            return 3;
        }
    }
}
