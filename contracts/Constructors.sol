// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";

// https://docs.soliditylang.org/en/v0.8.16/contracts.html

// Special Functions that runs only once when the contract is deployed
// Contracts do not require a constructor
contract Constructors1 {
    string public name = "Example 1";
}

// Contract can contain a constructor with no arguments
contract Constructors2 {
    string public name;

    constructor() {
        // Initialize/set state variable
        // Does not let deployer pass any arguments
        name = "Example 2";
    }
}

// Contract can contain a constructor with arguments
contract Constructors3 {
    string public name;

    // Constructor with arguments
    // Arguments can be passed when deploying the contract by deployer
    constructor(string memory _name) {
        name = _name;
    }
}

// Constructors can be payable
contract Constructors4 {
    string public name;

    // Payable constructors can receive ether when deployed
    // Stores the ether in the contract
    constructor() payable {
        name = "Example 4";
    }
}

// Constructors can inherit from base contract
contract Parent1 {
    string public name;

    constructor() {
        name = "Example 5";
    }
}

// Inherit from Parent1
// Does not override the constructor
contract Constructors5 is Parent1 {
    // State variable
    string public description = "This contract inherits from Parent 1";
    // Do not declare a constructor here
}

// Constructors can extend behavior from parent contstructor
contract Parent2 {
    string public name;

    // Constructor with arguments
    constructor(string memory _name) {
        name = _name;
    }
}

// Use new constructor to set description & extend behavior from Parent2 to set name
contract Constructors6 is Parent2 {
    // State variable
    // Description is set in the constructor for this contract
    string public description;

    // Parent2 inherited constructor is called and passed in with: (Parent2(_name))
    constructor(string memory _name, string memory _description) Parent2(_name) {
        // Set description locally within this constructor block
        description = _description;
    }
}
