// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";

// Array initalization
// Collection of items that can be sorted
// Arrays can be of fixed size or dynamic
contract Arrays1 {

    // Initializes an array of uints
    // Dynamic array (can grow/shrink in size)
    // Can only be uint data type
    uint[] public array1 = [1, 2, 3];

    // Initializes an array of uints
    uint[] public array2;

    // Initializes a fixed size array of 10 uints, default to 0
    // Fixed size array (cannot grow/shrink in size)
    // Default array = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    uint[10] public array3;

    // Initializes an array of strings
    // Dynamic array (can grow/shrink in size)
    // Can only be string data type
    string[] public array4  = ["apple", "banana", "carrot"];

    // Initializes an array of strings
    string[] public array5;

    // Initializes a fixed size array of 10 uints, default to ""
    // Default array = ["", "", "", "", "", "", "", "", "", ""]
    string[10] public array6;
}

// Array functions
contract Arrays2 {
    uint[] public array;

    // Get/Fetch value at a given index
    function get(uint i) public view returns (uint) {
        return array[i];
    }

    // Return the whole array from state variable
    function getArray() public view returns (uint[] memory) {
        return array;
    }

    // Return the whole array from local variable
    // Returns the length of the array
    function length() public view returns (uint) {
        return array.length;
    }

    // Adds new value at the end of the array
    function push(uint i) public {
        array.push(i);
    }

    // Removes last item from array
    function pop() public {
        array.pop();
    }

    // Remove item at given index
    // Doesn't remove the value at index, but sets it to 0/Default value
    function remove(uint index) public {
        delete array[index];
    }
}
