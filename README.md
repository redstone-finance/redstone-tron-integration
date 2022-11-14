# redstone-tron-integration

This repository contains a sample dApp implementation with the integrated RedStone oracles.

RedStone oracles use an alternative design of providing oracle data to smart contracts. Instead of constantly persisting data on EVM storage (by data providers), the information is brought on-chain only when needed (by end users). Until that moment data remains in the decentralised cache layer, which is powered by RedStone light cache gateways and streamr data broadcasting protocol. Data is transferred to the EVM by end users, who should attach signed data packages to their transaction calldata. The information integrity is verified on-chain through signature checking.

To learn more about RedStone oracles design go to the [RedStone docs](https://docs.redstone.finance/docs/introduction)

The dApp code is located in the [dapp](./dapp/) folder and includes smart contracts, tests, and deployment instructions.

## Smart Contracts

- Sample consumer contract - [RedstoneSampleConsumer.sol](./dapp/contracts//RedstoneSampleConsumer.sol)
- RedStone contracts for data extraction and signature verification - [redstone-contracts folder](./dapp//contracts/redstone-contracts/core/)

## Tests

Tests based on TronBox framework are located in the [dapp/test](./dapp/test/) folder.

Take a look at the tests to understand how the RedStone oracle paylaod should be prepared

To run the tests:

- Launch local tron node in a separate terminal tab (`docker run -it --rm -p 9090:9090 --name tron trontools/quickstart`)
- Clone this repo (`git clone https://github.com/redstone-finance/redstone-tron-integration && cd redstone-tron-integration`)
- Install dependencies (`yarn install`)
- Go to the `dapp` folder (`cd ./dapp`)
- Run the tests (`npx tronbox test`)

## Deployed Smart Contracts

Sample RedStone oracle consumer is alredy deployed on the Tron testnet (Nile): [TQQXQkS6qbAGkmYTukNmiddZMH6zLSwvgi](https://nile.tronscan.org/#/contract/TQQXQkS6qbAGkmYTukNmiddZMH6zLSwvgi/code)

## Live Frontend Demo (showroom)

You can check fetching the oracle data from the deployed contract using the following dapp: https://tron-showroom.redstone.finance/

The source code of the dApp is publicly available at: https://github.com/redstone-finance/redstone-tron-showroom
