const HDWalletProvider = require('truffle-hdwallet-provider')
require('dotenv').config()

module.exports = {
  networks: {
    develop: {
      host: '127.0.0.1',
      port: 7545,
      network_id: '*'
    },
    test: {
      host: '127.0.0.1',
      port: process.env.GANACHE_PORT,
      network_id: '*'
    },
    ropsten: {
      provider: function() {
        return new HDWalletProvider(
          "36e25855f80482ec31609804f224c110435eba3d35f096517d35a861c30af604",
          `https://ropsten.infura.io/v3/a79e6eefa1eb4c0fbef770d74d549db7`
        )
      },
      networkCheckTimeout:10000000,
      network_id: 3,
      gas: 4000000 //make sure this gas allocation isn't over 4M, which is the max
    }
  }
}