// SPDX-License-Identifier: MIT

pragma solidity >=0.4.22 <0.9.0;

import "./redstone-contracts/data-services/MainDemoConsumerBase.sol";

contract RedstoneSampleConsumer is MainDemoConsumerBase {
    function proxyRequestToBaseOracleContract(bytes32 assetId)
        public
        view
        returns (uint256)
    {
        return getOracleNumericValueFromTxMsg(assetId);
    }

    /**
     * Returns the latest price of the given asset
     */
    function getLatestPrice(
        bytes calldata redstonePayload,
        bytes32 assetDataFeedId
    ) public view returns (uint256) {
        // Prepare call to RedStone base function
        bytes memory encodedFunction = abi.encodeWithSignature(
            "proxyRequestToBaseOracleContract(bytes32)",
            assetDataFeedId
        );
        bytes memory encodedFunctionWithRedstonePayload = abi.encodePacked(
            encodedFunction,
            redstonePayload
        );

        // Securely getting oracle value
        (bool success, bytes memory result) = address(this).staticcall(
            encodedFunctionWithRedstonePayload
        );

        // Parsing response
        uint256 priceValue;
        if (!success) {
            assembly {
                revert(add(32, result), mload(result))
            }
        }
        assembly {
            priceValue := mload(add(result, 32))
        }

        return priceValue;
    }
}
