// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";

// Structs
// Enums - Enumerator or Enumeration
// Enums are used to create user-defined types with a finite set of values
// Datatype that stores several values from a specified list
// Enums are used to keep track of a list of possible states
// e.g. task manager, supply chain, etc.
contract Enums1 {
    enum Status {
        // Enum values
        // Possible states
        // Enum values are indexed starting from 0
        Todo,
        InProgress,
        Done
    }

    // Defaults to first item, e.g., "Todo"
    // Saving enum to state variable
    // Current status of contract (Todo)
    Status public status;

    // Todo: 0
    // InProgress: 1
    // Done: 2
    // Returns current status of contract (0)
    function get() public view returns (Status) {
        return status;
    }

    // Set status manually
    // Set status to "InProgress" or 1
    function set(Status _status) public {
        status = _status;
    }

    // User-defined function (complete)
    function complete() public {

        // Set status to "Done" or 2
        status = Status.Done;
    }

    // Resets to default value, i.e., Todo or 0
    function reset() public {
        delete status;
    }
}
