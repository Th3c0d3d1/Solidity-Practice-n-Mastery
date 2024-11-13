const { expect } = require('chai');
const { ethers } = require('hardhat');

describe('Types', () => {
  beforeEach(async () => {
    const Contract = await ethers.getContractFactory('Solidity_Data_Types_1')
    contract = await Contract.deploy()
  })

  describe('Example 1', () => {
    it('demonstrates boolean values', async () => {
      expect(await contract.boolean1()).to.eq(true)
      expect(await contract.boolean2()).to.eq(false)
    })
    it('demonstrates unassigned integer values', async () => {
      expect(await contract.MyUint1()).to.eq(1)
      expect(await contract.MyUint2()).to.eq(0)
      expect(await contract.MyUint3()).to.eq(1)
      expect(await contract.MyUint4()).to.eq(1)
      expect(await contract.MyUint5()).to.eq(1)
    })
    it('demonstrates integer values', async () => {
      expect(await contract.MyInt1()).to.eq(1)
      expect(await contract.MyInt2()).to.eq(0)
      expect(await contract.MyInt3()).to.eq(-1)
      expect(await contract.MyInt4()).to.eq(1)
      expect(await contract.MyInt5()).to.eq(1)
      expect(await contract.MyInt5()).to.eq(1)
    })
    it('demonstrates string, byte, and address values', async () => {
      expect(await contract.myString()).to.eq("My string")
      expect(await contract.myBytes32()).to.eq(ethers.utils.formatBytes32String("My Bytes 32"))
      expect(await contract.myAddress()).to.eq("0x52bc44d5378309EE2abF1539BF71dE1b7d7bE3b5")
    })
  })
})
