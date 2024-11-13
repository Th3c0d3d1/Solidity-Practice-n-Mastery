// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract Solidity_Data_Types_1 {
    // Value types

    // Creates state boolean var w/ value = true
    bool public boolean1 = true;
    // Creates state boolean var w/ default value (false); unassigned var
    bool public boolean2;

    // Creates most commonly used state intergers for dealing with money to guarantee
    // positive balances or 0 (whole numbers)
    uint public MyUint1 = 1;
    // Unassigned uints default to 0
    uint public MyUint2;
    // Same as uint
    uint256 public MyUint3 = 1;
    // uint8 = max val of number -> (2 ** 8) - 1 = 255
    // Overflows back to 0 after 255 bytes
    uint8 public MyUint4 = 1;
    uint16 public MyUint5 = 1;

    // Integers can be negative
    int public MyInt1 = 1;
    // Anassigned Integers also default to 0
    int public MyInt2;
    // can be negative
    int public MyInt3 = -1; 
    // same as int
    int256 public MyInt4 = 1; 
    uint8 public MyInt5 = 1;
    uint16 public MyInt6 = 1;

    // Other common types

    // Strings
    // Used for arbitrary human readable text
    string public myString = "My string";

    // Bytes Array
    // Other benefits ex. arrays, size checking
    // Fixed size array
    // Format to string from bytes32 in testing by using ethers.utils.formatBytes32String() 
    bytes32 public myBytes32  = "My Bytes 32";

    // Addresses
    // Username or location of an entity on blockchain
    // ex. Externally owned account (metamask); Smart contract address
    address public myAddress = 0x52bc44d5378309EE2abF1539BF71dE1b7d7bE3b5;
}
