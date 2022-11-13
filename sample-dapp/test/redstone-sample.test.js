const sdk = require("redstone-sdk");
const protocol = require("redstone-protocol");
const { convertStringToBytes32 } = require("redstone-protocol/dist/src/common/utils");

const RedstoneSampleConsumer = artifacts.require("./RedstoneSampleConsumer.sol");

async function getRedstonePayload(dataFeeds) {
  // Fetching oracle data from redstone decetrnalized data layer
  const signedDataPackagesResponse = await sdk.requestDataPackages({
    dataServiceId: "redstone-main-demo",
    uniqueSignersCount: 1,
    dataFeeds,
  }, ["https://cache-service-direct-1.b.redstone.finance"]);

  // Parsing response
  const signedDataPackages = [];
  for (const dataFeedId of Object.keys(signedDataPackagesResponse)) {
    signedDataPackages.push(...signedDataPackagesResponse[dataFeedId]);
  }

  // Prepare redstone payload
  const unsignedMetadata = "tron-redstone-payload";
  const redstonePayload = "0x" + protocol.RedstonePayload.prepare(
    signedDataPackages, unsignedMetadata);

  return redstonePayload;
}

contract('RedstoneSampleConsumer', function() {
  it("Should get oracle value", async function() {

    async function getOraclePriceFromContract(symbol) {
      const redstonePayload = await getRedstonePayload([symbol]);
      const priceFromContract = await contract.call("getLatestPrice", [
        redstonePayload,
        convertStringToBytes32(symbol)
      ]);
      return priceFromContract.toNumber() / 10 ** 8;
    }

    const contract = await RedstoneSampleConsumer.deployed();
    const trxPrice = await getOraclePriceFromContract("TRX");
    const jstPrice = await getOraclePriceFromContract("JST");
    const btcPrice = await getOraclePriceFromContract("BTC");

    console.log({trxPrice, jstPrice, btcPrice});

    // assert.equal(balance.toNumber(), 10000, "10000 wasn't in the first account");
  });

});
