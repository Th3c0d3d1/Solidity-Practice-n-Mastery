const { expect } = require('chai');
const { ethers } = require('hardhat');

describe('Events', () => {

  describe('Example 1', () => {
    let user1, user2

    beforeEach(async () => {
      let accounts = await ethers.getSigners()
      user1 = accounts[0]
      user2 = accounts[1]
    })

    it('demonstrates basic event subscription and history', async () => {
      const Contract = await ethers.getContractFactory('Events1')
      let contract = await Contract.deploy()

      // Pass value 'Hey!' into updateMessage function
      // Call the tx once & check the event log in real time
      let transaction = await contract.updateMessage('Hey!')
      await transaction.wait()
      await expect(transaction).to.emit(contract, 'MessageUpdated')
        .withArgs(user1.address, 'Hey!')

      // Calling it a few more times to get event history
      transaction = await contract.updateMessage('Ho!')
      await transaction.wait()

      transaction = await contract.updateMessage('Ha!')
      await transaction.wait()

      // Getting all past events (stream)
      // https://docs.ethers.io/v5/getting-started/#getting-started--history
      let eventStream = await contract.queryFilter('MessageUpdated')
      // Uncomment below to see the event stream
      // console.log(eventStream)
      expect(eventStream.length).to.equal(3)

      // Check first event in the stream
      let firstEvent = eventStream[0]
      // Uncomment below to see the event stream
      // console.log(firstEvent)
      expect(firstEvent.args[1]).to.equal('Hey!')
      expect(firstEvent.args[0]).to.equal(user1.address)


      // Trigger event from user 2
      transaction = await contract.connect(user2).updateMessage('Huh!')
      await transaction.wait()

      // Filter only events created by user2
      // Unindexed parameters can't be filtered (e.g. message argument = null )
      // Indexed parameters can also left unfiltered by passing null
      let user2Filter = contract.filters.MessageUpdated(user2.address, null)

      // Get all events from created user 2 filtered stream
      eventStream = await contract.queryFilter(user2Filter)
      expect(eventStream.length).to.equal(1)

      // Make sure it's user 2's message & address
      firstEvent = eventStream[0]
      expect(firstEvent.args[1]).to.equal('Huh!')
      expect(firstEvent.args[0]).to.equal(user2.address)
    })
  })
})
