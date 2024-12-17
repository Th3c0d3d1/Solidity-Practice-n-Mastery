// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";


contract Loops1 {
    // Sample array of numbers
    uint[] numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

    // Function to count even numbers in the array
    // Returns a uint
    function countEvenNumbers() public view returns(uint) {

        // Variable to store count of even numbers
        uint count = 0;

        // Loop through the array
        for (uint i = 0; i < numbers.length; i++) {

            // Check if number is even
            if (i % 2 == 0) {

                // Increment count
                count ++;

            // If number is odd, continue to next iteration
            } else {
                continue;
            }
        }

        return count;
    }
}

contract Loops2 {

    // Event to log numbers
    event LogNumber(uint number);

    // Function to log numbers
    // Returns a boolean
    function logNumbers() public returns(bool) {

        // Variable to store count of even numbers
        uint x = 0;

        // While loop to log numbers
        // Loop will run until x is less than 5
        while(x < 5) {
            // Uncomment this to see number logged to console
            // console.log(x);

            // Emit event to log number
            emit LogNumber(x);

            // Increment x
            x ++;
        }

        return true;
    }
}
