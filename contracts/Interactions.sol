// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";

// https://docs.soliditylang.org/en/v0.8.16/contracts.html?highlight=inheritance#inheritance

contract SecretVault {

    // State variables
    string private secret;

    constructor(string memory _secret) {
        secret = _secret;
    }

    // Set the secret
    // This function is only accessible by the contract itself
    // Setters are functions that allow you to modify the state of a contract
    function setSecret(string memory _secret) external {
        secret = _secret;
    }

    // Get the secret
    // This function is accessible by anyone
    // Getters are functions that allow you to read the state of a contract
    function getSecret() external view returns(string memory) {
        return secret;
    }
}

contract Interactions1 {

    // The contract SecretVault is imported as a state variable
    // Refering to the SecretVault contract as public allows the contract to access the functions of the SecretVault contract
    SecretVault public secretVault;

    // The constructor takes an instance of the SecretVault contract and assigns it to the state variable secretVault
    // Saves the address of the SecretVault contract
    constructor(SecretVault _secretVault) {
        secretVault = _secretVault;
    }

    // Calling the setSecret function of the SecretVault contract
    // This function allows the contract to set the secret in the SecretVault contract
    function setSecret(string memory _secret) public {
        secretVault.setSecret(_secret);
    }

    // Calling the getSecret function of the SecretVault contract
    // This function allows the contract to get the secret from the SecretVault contract
    function getSecret() public view returns(string memory) {
        return secretVault.getSecret();
    }
}

import "./Token.sol";

// Interface for the ERC20 token
// Using only the parts of the contract that are needed
// This is a way to interact with the token contract without importing the whole contract
interface IERC20 {

    // Returns the total token supply
    // Does not need the function body
    function transferFrom(
        address _from,
        address _to,
        uint256 _value
    )
        external
        returns (bool success);
}

contract Interactions2 {

    // This function allows the contract to deposit tokens into the contract
    function deposit(address _tokenAddress, uint _amount) public {

        // Transfer the tokens from the sender to the contract
        // Talk to contract directly using the interface (IERC20) & pass the token address (_tokenAddress)
        // Call the transferFrom function of the token contract
        // No need to store the token contract in a state variable
        // Instatiate the token contract using the token address
        IERC20(_tokenAddress).transferFrom(msg.sender, address(this), _amount);
    }
}
