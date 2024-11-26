// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";

// Read functions are free
// Write functions cost gas
// Write function with arguments cost gas
// Write functions without arguments
contract Functions1 {
    string name = "Example 1";

    // Write function with arguments
    function setName(string memory _name) public {
        name = _name;
    }

    // Read Only function without arguments
    function getName() public view returns(string memory) {
        return name;
    }

    // Write function without arguments
    function resetName() public {
        name = "Example 1";
    }
}


// Functions can call other functions
// Only public functions are visible outside the contract
contract Functions2 {
    uint public count;

    function increment() public {
        count = add(count, 1);
    }

    function add(uint a, uint b) internal pure returns(uint) {
        return a + b;
    }
}


// Functions can be declared outside the contract
// Can be used in multiple contracts
function addNumbers(uint a, uint b) pure returns(uint) {
    return a + b;
}

contract Functions3 {
    uint public count;

    // Call the previous function from the global scope
    function increment() public {
        count = addNumbers(count, 1);
    }
}

// Visibility
// https://docs.soliditylang.org/en/v0.8.16/cheatsheet.html?highlight=global%20variables#function-visibility-specifiers
// public: visible externally and internally
// private: only visible in the current contract
// external: only visible externally (only for functions) - i.e. can only be message-called (via this.func)
// internal: only visible internally
contract Functions4 {
    uint public count;

    function increment1() public {
        count = count + 1;
    }

    // Calls increment1
    function increment2() public {
        increment1();
    }

    // Only visible in the current contract
    // *Can* call this from another function inside this contract
    // *Cannot* call this from another contract
    function increment3() private {
        count = count + 1;
    }

    function increment4() public {
        increment3();
    }

    // Cannot call this function inside another function.
    // Will not compile.
    function increment5() external {
        count = count + 1;
    }

    // Cannot call this outside the contract
    // *Can* call this from another function
    // *Can* call this from an inherited contract
    function increment6() internal {
        count = count + 1;
    }

    function increment7() public {
        increment6();
    }
}

// Modifiers -> pure, view, payble
contract Functions5 {
    string public name = "Example 5";
    uint public balance;

    // View
    // *Can not* modify state (e.g. change name)
    // *Can* accesss sate (e.g. read name)
    function getName() public view returns(string memory) {
        return name;
    }

    // Pure
    // *Can not* modify state (e.g. change name)
    // *Can not* accesss sate (e.g. read name); eg. name = "New name"; inside function will not compile
    function add(uint a, uint b) public pure returns(uint) {
        return a + b;
    }

    // Payable
    // Accepts cryptocurrency when tx is created
    function pay() public payable {
        balance = msg.value;
    }
}

// Custom modifiers
contract Functions6 {
    address private owner;
    string public name = "";
    bool private nameSet = false;

    constructor() {
        owner = msg.sender;
    }

    // Creating a custom modifier
    // Only the owner can call this function
    modifier onlyOwner {
        require(msg.sender == owner, 'caller must be owner');
        _;
    }

    // Custom modifier
    // Only set the name once
    modifier onlyOnce {
        require(nameSet == false, 'can only set name once');
        _;
    }

    function setName1(string memory _name) onlyOwner public {
        name = _name;
    }

    function setName2(string memory _name) onlyOwner onlyOnce public {
        name = _name;
        nameSet = true;
    }
}

// Return Values
contract Functions7 {
    string name = "Example 7";

    // Explicitly return a value
    function getName1() public view returns(string memory) {
        return name;
    }

    // Implicitly return a default value if no return is provided
    function getName2() public view returns(string memory) {
        name;
    }

    // Return a value from another function
    function getName3() public view returns(string memory) {
        return getName1();
    }

    // Returns a named variable without declaring the type inline
    // This is useful when the return type is complex
    // Does not need return keyword
    // Will look for a variable with the same name in the function
    function getName4() public view returns(string memory anotherName) {
        anotherName = "Another name";
    }

    // Reads the return value from another function as a variable & returns it
    function getName5() public view returns(string memory anotherName) {
        anotherName = getName4();
    }

    // Returns multiple values
    // Use a tuple to return multiple values; eg. (string memory, string memory)
    // return statement must match the returns tuple
    function getName6() public view returns(string memory name1, string memory name2) {
        return(name, "New name");
    }

    // Returns multiple values from another function
    // Declare variables to be assigned in the tuple
    function getName7() public view returns(string memory name1, string memory name2) {
        // Assigning values as parallel assignment
        (name1, name2) = getName6();
        return(name1, name2);
    }

    // Values returned from a transaction are not available outside of EVM
    // Use events to accomplish this
    event NameChanged(string name);

    function setName1() public returns(string memory) {
        // Update the name
        name = "New name";
        // Emit NameChanged event
        // This will be available outside of the EVM
        // Name will not be available outside of the EVM
        emit NameChanged(name);
        return name;
    }

    // Return value from another function
    // Does not emit an event
    function setName2() public returns(string memory newName) {
        newName = "New name";
        name = newName;
        return name;
    }

    // Return value from function setName2
    // Emit an event
    // Wrapping the behavior of setName2 in another function
    // Inside of EVM, the name will be updated
    // MM cannot access the updated name
    function setName3() public returns(string memory newName) {
        newName = setName2();
        emit NameChanged(newName);
        return newName;
    }
}
