// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "./redstone-contracts/data-services/MainDemoConsumerBase.sol";

contract RedstoneSampleConsumer is MainDemoConsumerBase {
    function getPrices() public view returns (uint256[] memory) {
        bytes32[] memory symbols = new bytes32[](6);
        symbols[0] = bytes32("BTC");
        symbols[1] = bytes32("ETH");
        symbols[2] = bytes32("BNB");
        symbols[3] = bytes32("AR");
        symbols[4] = bytes32("AVAX");
        symbols[5] = bytes32("CELO");

        return getOracleNumericValuesFromTxMsg(symbols);
    }
}
