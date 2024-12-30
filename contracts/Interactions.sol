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
    SecretVault public secretVault;

    // The constructor takes an instance of the SecretVault contract and assigns it to the state variable secretVault
    constructor(SecretVault _secretVault) {
        secretVault = _secretVault;
    }

    function setSecret(string memory _secret) public {
        secretVault.setSecret(_secret);
    }

    function getSecret() public view returns(string memory) {
        return secretVault.getSecret();
    }
}

import "./Token.sol";

interface IERC20 {
    function transferFrom(
        address _from,
        address _to,
        uint256 _value
    )
        external
        returns (bool success);
}

contract Interactions2 {

    function deposit(address _tokenAddress, uint _amount) public {
        IERC20(_tokenAddress).transferFrom(msg.sender, address(this), _amount);
    }
}
