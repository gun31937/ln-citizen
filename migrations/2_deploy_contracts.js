const Citizen = artifacts.require("Citizen");

module.exports = function(deployer) {
  deployer.deploy(Citizen);
};
