// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";

// State variable values are written directly to the blockchain; accessible everywhere in contract
// Solidity will expose a "name()" function with public visibility
// Store data that is different from the data itself
contract Variables1 {
    string public name = "Example 1";
}

contract Variables2 {
    // Declaring the variable
    string public name;

    // Assigning the state variables value inside constructor to initialize state variables
    // _name is a local variable
    // Not stored in blockchain
    constructor(string memory _name) {
        name =_name;
    }
}

contract Variables3 {
    // Name is assigned a blank string by default
    string name;

    // Functions can read state vars
    // view => modifier for reading state var only
    // pure => modifier cannot read state
    function getName() public view returns(string memory) {
        return name;
    }

    // Functions can set state vars
    function setName(string memory _name) public {
        name = _name;
    }
}

contract Variables4 {
    // Constants are set in contract
    // Declare constants upon variable initialization
    string constant NAME = "Example 4";

    // Immutable can be in constructor & should not change
    // Immutable is a type of constant
    address immutable OWNER;

    // Setting the OWNER to the deployer(msg.sender)
    constructor() {
        OWNER = msg.sender;
    }

    // Calling the constant
    function name() public pure returns(string memory) {
        return NAME;
    }


    function owner() public view returns(address) {
        return OWNER;
    }
}

// Global variables 
contract Variables5 {
    // Setting state variables
    address public contractAddress;
    address public payer;
    address public origin;
    uint public amount;

    constructor() {
        // this => global var
        // Returns address of current contract
        contractAddress = address(this);
    }

    // Function to pay the contract
    // payable modifier give access to msg.value(cannot be used w/o payable)
    function pay() public payable {
        // msg is the global variable
        // value is the amount of crypto
        // Value given in wei(smallest unit of ether); 1 ETH = 1000000000000000000 WEI
        amount = msg.value;
        payer = msg.sender;
        origin = tx.origin;
    }

    // 
    function getBlockInfo() public view returns(uint, uint, uint) {
        return(
            block.number,
            block.timestamp,
            // current blockchain user is currently connected to
            block.chainid
        );
    }
}