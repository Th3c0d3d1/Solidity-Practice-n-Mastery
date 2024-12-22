// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract Time1 {

    // Creating state variables

    // Create an access point for authorized user (owner)
    address public owner;
    // Create a state variable to store the time when the deposit is allowed
    uint public depositStartTime;
    // Create a state variable to store the time when the withdrawal is allowed
    uint public withdrawStartTime;

    // Create a modifier to initialize the state variables
    modifier onlyOwner {

        // Verify contract caller is the authorized to perform the action
        require(msg.sender == owner, 'caller must be owner');
        _;
    }

    //  Initialize state variables in the constructor
    constructor(uint _depositStartTime, uint _withdrawStartTime) {
        owner = msg.sender;
        depositStartTime = _depositStartTime;
        withdrawStartTime = _withdrawStartTime;
    }

    // Create a function to deposit ether
    // Place where funds from clients are received
    function deposit() public payable onlyOwner {

        // Check if the deposit (minting start, crowdfunding commencing, airdrop, etc) time has started
        require(block.timestamp >= depositStartTime, 'cannot deposit yet');
        // Contract receives ether...
    }

    // Create a function to withdraw after the withdrawal time has started
    modifier afterWithdrawEnabled {

        // Verify the withdrawal time has started
        require(
            block.timestamp >= withdrawStartTime,
            'cannot withdraw yet'
        );
        _;
    }

    function withdraw() public onlyOwner afterWithdrawEnabled {
        uint256 value = address(this).balance;
        (bool sent, ) = owner.call{value: value}("");
        require(sent);
    }
}
