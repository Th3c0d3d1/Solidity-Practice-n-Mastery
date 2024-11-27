// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract Conditionals1 {
    // Check if a number is even or odd
    function evenOrOdd1(uint x) public pure returns (string memory) {

        // Use the modulo operator to check if the number is even or odd
        if (x % 2 == 0) {
            return "even";
        } else {
            return "odd";
        }
    }

    function evenOrOdd2(uint x) public pure returns (string memory) {
        if (x % 2 == 0) {
            return "even";
        }

        return "odd";
    }

    function evenOrOdd3(uint x) public pure returns (string memory) {
        // The ternary operator is a shorthand for an if-else statement
        return x % 2 == 0 ? "even" : "odd";
    }

}

contract Conditionals2 {
    // Check if a number is positive, negative or zero
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
