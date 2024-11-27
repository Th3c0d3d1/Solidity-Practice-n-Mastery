// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";

// Basic Math
contract Operators1 {
    
    // Does not modify state, so it can be external
    // pure means it does not read state
    function add(uint a, uint b) external pure returns(uint) {
        return a + b;
    }

    function sub(uint a, uint b) external pure returns(uint) {
        return a - b;
    }

    function mul(uint a, uint b) external pure returns(uint) {
        return a * b;
    }

    function div(uint a, uint b) external pure returns(uint) {
        return a / b;
    }

    function exp(uint a, uint b) external pure returns(uint) {
        return a ** b;
    }

    // Modulo
    // Returns the remainder of a division
    // E.g. 11 / 2 = 5 remainder 1
    // E.g. 11 % 2 = 1
    function mod(uint a, uint b) external pure returns(uint) {
        return a % b;
    }

    // E.g. a = a + 1
    function increment(uint a) external pure returns(uint) {
        a++;
        return a;
    }

    // E.g. a = a - 1
    function decrement(uint a) external pure returns(uint) {
        a --;
        return a;
    }

    // Example of multiple operations
    function mathExample() external pure returns(uint) {
        uint a;

        // a does not have to be assigned a value
        a = a + 1; // 1
        a ++; // 2
        a = a * 2; // 4
        a = a ** 2; // 16
        a = a / 2; // 8
        a = a - 1; // 7
        a --; // 6
        return a;
    }
}

// Comparison
// Note: many types can be compared besides numbers
// This simply shows the operators
contract Operators2 {

    // Does not read or write/modify state
    function eq(uint a, uint b) external pure returns(bool) {
        // == is the equality operator
        // does not assign a value (=)
        return a == b;
    }

    function notEq(uint a, uint b) external pure returns(bool) {
        // != is the not equal operator
        // (!) known as the bang operator; the opposite of the value
        return a != b;
    }

    function gt(uint a, uint b) external pure returns(bool) {
        return a > b;
    }

    function lt(uint a, uint b) external pure returns(bool) {
        return a < b;
    }

    function gtOrEq(uint a, uint b) external pure returns(bool) {
        return a >= b;
    }

    function ltOrEq(uint a, uint b) external pure returns(bool) {
        return a <= b;
    }

    // Example of non-integer comparison
    function checkAddress() external pure returns(bool) {
        address address1 = 0x1aD91ee08f21bE3dE0BA2ba6918E714dA6B45836;
        address address2 = 0xe5c430b2Dd2150a20f25C7fEde9981f767A48A3c;
        return(address1 == address2);
    }
}

// Locial Operators
// Used to compare boolean values
contract Operators3 {
    function and(bool a, bool b) external pure returns(bool) {

        // returns true if both a and b are true; otherwise false
        return a && b;
    }

    function or(bool a, bool b) external pure returns(bool) {

        // returns true if either a or b is true; otherwise false
        return a || b;
    }

    function not(bool a) external pure returns(bool) {

        // returns the opposite of the value
        return !a;
    }

    // Example of multiple operations
    function comparisonExample() external pure returns(bool) {
        
        // 1 + 1 == 2 is true
        // 2 + 2 == 4 is true
        // true && true is true
        return (1 + 1 == 2) && (2 + 2 == 4);
    }
}
