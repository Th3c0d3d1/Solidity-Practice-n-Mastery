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
      // Add 1 eth as arg in pay function
      await contract.pay({value: ether(1)})

      // Uncomment the following line to log the result of paying 1 eth
      // let result = await contract.pay({value: ether(1)})
      // console.log(result)

      // Verify the value set in pay function arg is assigned to amount 
      expect(await contract.amount()).to.eq(ether(1))
      let accounts = await ethers.getSigners()

      // Verify the tx origin & payer address
      // Payer & Origin can differ; eg. Deployer(payer) vs User(origin)
      expect(await contract.payer()).to.eq(accounts[0].address)
      expect(await contract.origin()).to.eq(accounts[0].address)
    })

    it('demonstrates the "block" global variable', async () => {
      let result = await contract.getBlockInfo()
      console.log(result)
    })
  })

  describe('Example 6', async () => {
    let contract

    beforeEach(async () => {
      const Contract = await ethers.getContractFactory("Variables6")
      contract = await Contract.deploy()
    })

    it('defaults to internal visibility', async () => {
      // Verifying the variable visibility
      expect(await contract.getName1()).to.eq("Name 1")
    })

    it('cannot access private variable outside the contract', async () => {
      // Uncomment the following line to cause an error
      // expect(await contract.name2()).to.be.reverted;
    })

    it('can access internal variable within the contract', async () => {
      // Internal variables are not accessible directly from outside the contract
      // Uncomment the following line to cause an error
      // expect(await contract.name3()).to.be.reverted;
    })

    it('can access public variable outside the contract', async () => {
      expect(await contract.name4()).to.eq("Name 4")
    })
  })
})
