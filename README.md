# Solidity Masterclass Project

Welcome to the Solidity Masterclass Project! This repository contains a collection of Solidity smart contracts designed to demonstrate various features and functionalities of the Ethereum blockchain. The project is built using Hardhat and includes comprehensive tests for each contract.

## Table of Contents

- [Introduction](#introduction)
- [Features](#features)
- [Project Structure](#project-structure)
- [Setup Instructions](#setup-instructions)
- [Deployment](#deployment)
- [Testing](#testing)
- [Scripts](#scripts)
- [Technologies Used](#technologies-used)
- [Contributing](#contributing)
- [License](#license)

## Introduction

This project serves as a learning resource for Solidity developers, showcasing examples of smart contracts that cover topics such as conditionals, loops, mappings, events, and error handling. Each contract is accompanied by unit tests to ensure functionality and reliability.

## Features

- **Error Handling**: Demonstrates `require`, `revert`, `assert`, and custom error handling.
- **Conditionals and Loops**: Examples of `if-else`, `for`, and `while` loops.
- **Mappings and Structs**: Usage of mappings and structs for data storage.
- **Events**: Emitting and subscribing to blockchain events.
- **Comprehensive Testing**: Unit tests for all contracts using Hardhat and Chai.

## Project Structure
. 
├── .gitignore
├── artifacts/
├── cache/
├── contracts/
│ ├── Errors.sol
│ ├── Conditionals.sol
│ ├── Loops.sol
│ ├── Mappings.sol
│ ├── Events.sol
│ └── Ether.sol
├── hardhat.config.js
├── package.json
├── scripts/
│ └── deploy.js
├── test/
│ ├── Errors.js
│ ├── Conditionals.js
│ ├── Loops.js
│ ├── Mappings.js
│ ├── Events.js
│ └── Ether.js
└── README.md


## Setup Instructions

1. **Clone the repository**: git clone https://github.com/Th3c0d3d1/Solidity-Practice-n-Mastery.git


2. **Install dependencies**: npm install


3. **Set up environment variables**:
Create a `.env` file in the root directory and add the following: ALCHEMY_API_KEY=your-alchemy-api-key PRIVATE_KEYS=your-private-keys


## Deployment

1. **Compile the contracts**: npx hardhat compile


2. **Deploy the contracts**: npx hardhat run deploy.js --network localhost


## Testing

1. **Run the tests**: npx hardhat test


## Scripts

- **Deploy contracts**: npx hardhat run deploy.js --network localhost


- **Run tests**: npx hardhat test


## Technologies Used

- **Solidity**: Smart contract programming language.
- **Hardhat**: Ethereum development environment.
- **Ethers.js**: Library for interacting with the Ethereum blockchain.
- **Chai**: Assertion library for testing.

## Contributing

Contributions to this project are welcome. Please fork the repository and submit pull requests for any enhancements or bug fixes.

## License

This project is licensed under the MIT License. See the LICENSE file for details.

