const { expect } = require('chai');
const { ethers } = require('hardhat');
const { Contract } = require('hardhat/internal/hardhat-network/stack-traces/model');

const tokens = (n) => {
  return ethers.utils.parseUnits(n.toString(), 'ether')
}

const ether = tokens

describe('Variables', () => {

  describe('Example 1', () => {
    it('it has a state variable with a default value', async () => {
      const Contract = await ethers.getContractFactory("Variables1")
      let contract = await Contract.deploy()
      expect(await contract.name()).to.eq("Example 1")
    })
  })

  describe('Example 2', () => {
    it('it demonstrates the constructor sets the state variable', async () => {
      const Contract = await ethers.getContractFactory("Variables2")

      // Deploying contract while passing a value to the _name argument ("Example 2") 
      let contract = await Contract.deploy("Example 2")

      // Verifying the set variable state
      expect(await contract.name()).to.eq("Example 2")
    })
  })

  describe('Example 3', () => {
    let contract

    beforeEach(async () => {
      const Contract = await ethers.getContractFactory("Variables3")

      // Deploying contract while passing a value to the _name argument ("Example 2") 
      contract = await Contract.deploy()
    })

    it('has a blank name by default', async () => {
      // Verifying the set variable state
      expect(await contract.getName()).to.eq("")
    })

    it('has functions to get & set state variables', async () => {
      await contract.setName("Example 3")
      expect(await contract.getName()).to.eq("Example 3")
    })

    it('does not expose name() function', async () => {
      // await expect(contract.name()).to.be.reverted
    })
  })

  describe('Example 4', async () => {
    let contract

    beforeEach(async () => {
      const Contract = await ethers.getContractFactory("Variables4")

      // Deploying contract while passing a value to the _name argument ("Example 2") 
      contract = await Contract.deploy()
    })

    it('has a NAME constant', async () => {
      expect(await contract.name()).to.eq("Example 4")
    })

    it('tracks the owner as immutable', async () => {
      let accounts = await ethers.getSigners()
      expect(await contract.owner()).to.eq(accounts[0].address)
    })
  })

  describe('Example 5', async () => {
    let contract

    beforeEach(async () => {
      const Contract = await ethers.getContractFactory("Variables5")
      contract = await Contract.deploy()
    })

    it('demonstrates "this" global variable', async () => {
      expect(await contract.contractAddress()).to.eq(contract.address)
    })

    it('demonstrates "msg" & "tx" global variables', async () => {
      await contract.pay({value: ether(1)})
      expect(await contract.amount()).to.eq(ether(1))
      let accounts = await ethers.getSigners()
      expect(await contract.payer()).to.eq(accounts[0].address)
      expect(await contract.origin()).to.eq(accounts[0].address)
    })
  })
})
