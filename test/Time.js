const { expect } = require('chai');
const { ethers } = require('hardhat');
const { time } = require('@nomicfoundation/hardhat-network-helpers');

const tokens = (n) => {
  return ethers.utils.parseUnits(n.toString(), 'ether')
}

const ether = tokens

describe('Time Examples', () => {

  describe('Example 1', () => {
    it('demonstrates time restriction with block.timestamp', async () => {

      // Configure time
      // Get the current timestamp in Unix time (seconds)
      let now = await time.latest()

      // Uncomment this to see the current timestamp
      // console.log(now)

      // Set the deposit start time to 1 second from now
      let depositStartTime = now + 1000 
      // Set the withdraw start time to 2 seconds from now
      let withdrawStartTime = now + 2000 // add 2,000 seconds

      // Deploy contract with time settings
      const Contract = await ethers.getContractFactory('Time1')
      contract = await Contract.deploy(depositStartTime, withdrawStartTime)

      // Try to deposit before deposit start time
      await expect(contract.deposit({ value: ether(1) })).to.be.reverted

      // Advance time past deposit start time + 1 second to allow deposit
      await time.increaseTo(depositStartTime + 1);

      // Deposit after deposit start time
      await contract.deposit({ value: ether(1) })
      expect(await ethers.provider.getBalance(contract.address)).to.equal(ether(1))

      // Try to withrwaw
      await expect(contract.withdraw()).to.be.reverted

      // Advance time past withdraw start time + 1 second
      await time.increaseTo(withdrawStartTime + 1);

      // Withdraw after withdraw start time
      await contract.withdraw()
      expect(await ethers.provider.getBalance(contract.address)).to.equal(ether(0))
    })
  })
})
