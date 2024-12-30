const { expect } = require('chai');
const { ethers } = require('hardhat');

const tokens = (n) => {
  return ethers.utils.parseUnits(n.toString(), 'ether')
}

const ether = tokens

describe('Interactions', () => {

  describe('Example 1', () => {

    it('demonstrates simple contract interaction', async () => {
      // Deploy SecretVault
      const SecretVault = await ethers.getContractFactory('SecretVault')
      let secretVault = await SecretVault.deploy('Secret')

      // Deploy Interactions1
      const Contract = await ethers.getContractFactory('Interactions1')
      let contract = await Contract.deploy(secretVault.address)

      // Get accounts

      // Default secret state set to 'Secret'
      expect(await contract.getSecret()).to.equal('Secret')

      // Set secret state to 'New Secret'
      await contract.setSecret('New Secret')
      // Check if secret state is 'New Secret'
      expect(await contract.getSecret()).to.equal('New Secret')

    })
  })

  // describe('Example 2', () => {

  //   it('demonstrates simple contract interaction', async () => {
  //     const Token = await ethers.getContractFactory('Token')
  //     let token = await Token.deploy('My Token', 'MTK', tokens(1000000))

  //     const Contract = await ethers.getContractFactory('Interactions2')
  //     let contract = await Contract.deploy()

  //     accounts = await ethers.getSigners()
  //     owner = accounts[0]

  //     // Approve tokens
  //     await token.approve(contract.address, tokens(1000000))
  //     // Deposit
  //     await contract.deposit(token.address, tokens(1000000))

  //     expect(await token.balanceOf(contract.address)).to.equal(tokens(1000000))
  //   })
  // })

})
