var RedstoneSampleConsumer = artifacts.require("./RedstoneSampleConsumer.sol");

module.exports = function(deployer) {
  deployer.deploy(RedstoneSampleConsumer);
};
