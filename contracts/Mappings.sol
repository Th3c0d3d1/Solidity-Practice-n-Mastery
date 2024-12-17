// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";

// Mapping examples (key value pairs)
// Key can only have one value
contract Mappings1 {

    // Mapping of string like a database
    // Uint is the key, string is the value
    mapping(uint => string) public names;

    // Mapping of addresses(string) like a database
    mapping(uint => address) public addresses;

    // Map balances to an address
    mapping(address => uint) public balances;

    // Tracks if a user has voted
    mapping(address => bool) public hasVoted;

    // Add values to the mapping in the constructor
    // This is a constructor function that runs when the contract is deployed
    // Mappings can only be state variables
    constructor() {

        // Assign values to the names mappings
        names[1] = "Adam";
        names[2] = "Ben";

        // Assign values to the addresses mappings
        addresses[1] = 0x3EcEf08D0e2DaD803847E052249bb4F8bFf2D5bB;
        addresses[2] = 0xe5c430b2Dd2150a20f25C7fEde9981f767A48A3c;

        // Assign values to the balances mappings
        balances[0x3EcEf08D0e2DaD803847E052249bb4F8bFf2D5bB] = 1 ether;
        balances[0xe5c430b2Dd2150a20f25C7fEde9981f767A48A3c] = 2 ether;

        // Assign values to the hasVoted mappings
        hasVoted[0x3EcEf08D0e2DaD803847E052249bb4F8bFf2D5bB] = true;
        hasVoted[0xe5c430b2Dd2150a20f25C7fEde9981f767A48A3c] = true;
    }

}

contract Mappings2 {

    // Mapping of structs
    struct Book {
        string author;
        string title;
    }

    mapping(uint => Book) public books;

    // Nested mapping
    // Track token balances for a given account
    mapping(address => mapping(address => uint)) public balances;

    constructor() {
        // Assign values to the books mappings (Enter new books)
        books[1] = Book("A Tale of Two Cities", "Charles Dickens");
        books[2] = Book("Les Miserables", "Victor Hugo");

        // Assign values to the balances mappings
        address user1 = 0x3EcEf08D0e2DaD803847E052249bb4F8bFf2D5bB;
        address user2 = 0xe5c430b2Dd2150a20f25C7fEde9981f767A48A3c;

        // Token addresses assigned to address
        // Assigned token addresses to check balances associated with the address
        address dai = 0x6B175474E89094C44Da98b954EedeAC495271d0F;
        address weth = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;

        // Setting user balances
        balances[user1][dai] = 1 ether;
        balances[user2][weth] = 2 ether;
    }

}

// Getting and setting mapping values
contract Mappings3 {
    mapping(uint => string) public myMapping;

    // Get the value of a key
    function get(uint _id) public view returns (string memory) {
        return myMapping[_id];
    }

    // Set the value of a key
    function set(uint _id, string memory _value) public {
        myMapping[_id] = _value;
    }

    // Remove the value of a key
    function remove(uint _id) public {
        // Resets the value to the default value.
        delete myMapping[_id];
    }
}


// Getting and setting nested values
contract Mappings4 {

    // Nested mapping of possible existence of a key 
    mapping(address => mapping(uint => bool)) public myMapping;

    // Get the value of a key
    function get(address _user, uint _id) public view returns (bool) {
        return myMapping[_user][_id];
    }

    // Set the value of a key
    function set(address _user, uint _id, bool _value) public {
        myMapping[_user][_id] = _value;
    }

    // Remove the value of a key
    function remove(address _user, uint _id) public {
        // Resets the value to the default value.
        delete myMapping[_user][_id];
    }
}
