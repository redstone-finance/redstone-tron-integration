// SPDX-License-Identifier: BUSL-1.1

pragma solidity ^0.8.4;

import "../libs/NumericArrayLib.sol";

/**
 * @title Default implementations of virtual redstone consumer base functions
 * @author The Redstone Oracles team
 */
library RedstoneDefaultsLib {
  uint256 constant DEFAULT_MAX_DATA_TIMESTAMP_DELAY_IN_SECONDS = 3 * 60;
  uint256 constant DEFAULT_MAX_DATA_TIMESTAMP_AHEAD_IN_SECONDS = 60;

  function isTimestampValid(uint256 receivedTimestamp) internal view returns (bool) {
    // Getting data timestamp from future seems quite unlikely
    // But we've already spent too much time with different cases
    // Where block.timestamp was less than dataPackage.timestamp.
    // Some blockchains may case this problem as well.
    // That's why we add MAX_BLOCK_TIMESTAMP_DELAY
    // and allow data "from future" but with a small delay
    uint256 blockTimestampMilliseconds = block.timestamp * 1000;

    require(
      (blockTimestampMilliseconds + DEFAULT_MAX_DATA_TIMESTAMP_AHEAD_IN_SECONDS * 1000) >
        receivedTimestamp,
      "Data with future timestamps is not allowed"
    );

    return
      blockTimestampMilliseconds < receivedTimestamp ||
      blockTimestampMilliseconds - receivedTimestamp <
      DEFAULT_MAX_DATA_TIMESTAMP_DELAY_IN_SECONDS * 1000;
  }

  function aggregateValues(uint256[] memory values) internal pure returns (uint256) {
    return NumericArrayLib.pickMedian(values);
  }
}
