# RedStone oracles integration with TRON

This repository contains a sample dApp implementation with the integrated RedStone oracles.

The dApp code is located in the [dapp](./dapp/) folder and includes smart contracts, tests, and deployment instructions.

## How RedStone oracles work on TRON

RedStone oracles use an alternative design of providing oracle data to smart contracts. Instead of constantly persisting data on EVM storage (by data providers), the information is brought on-chain only when needed (by end users). Until that moment data remains in the decentralised cache layer, which is powered by RedStone light cache gateways and streamr data broadcasting protocol. Data is transferred to the EVM by end users, who should attach signed data packages to their transaction calldata. The information integrity is verified on-chain through signature checking.

To learn more about RedStone oracles design go to the [RedStone docs](https://docs.redstone.finance/docs/introduction)

## Smart Contracts

- Sample consumer contract that consumes RedStone oracles data - [RedstoneSampleConsumer.sol](./dapp/contracts//RedstoneSampleConsumer.sol)
- RedStone contracts for data extraction and signature verification - [dapp/redstone-contracts](./dapp//contracts/redstone-contracts/core/)

## Tests

Tests based on TronBox framework are located in the [dapp/test](./dapp/test/) folder.

Tests include the demontration of how RedStone bytes paylaod should be prepared.

To run the tests:

- Launch local tron node in a separate terminal tab (`docker run -it --rm -p 9090:9090 --name tron trontools/quickstart`)
- Clone this repo (`git clone https://github.com/redstone-finance/redstone-tron-integration && cd redstone-tron-integration`)
- Install dependencies (`yarn install`)
- Go to the `dapp` folder (`cd ./dapp`)
- Run the tests (`npx tronbox test`)

## Deployed Smart Contracts

Sample RedStone oracle consumer is alredy deployed on the Tron testnet (Nile): [TQQXQkS6qbAGkmYTukNmiddZMH6zLSwvgi](https://nile.tronscan.org/#/contract/TQQXQkS6qbAGkmYTukNmiddZMH6zLSwvgi/code)

<img width="1240" alt="Screenshot 2022-11-14 at 18 06 17" src="https://user-images.githubusercontent.com/48165439/201722248-b0d714b2-c382-43f5-835e-afc87e532327.png">


## Live Frontend Demo (showroom)

You can check fetching the oracle data from the deployed contract using the following dapp: https://tron-showroom.redstone.finance/

The source code of the dApp is publicly available at: https://github.com/redstone-finance/redstone-tron-showroom

### Fetched Oracle Data view
<img width="1267" alt="Screenshot 2022-11-14 at 18 05 56" src="https://user-images.githubusercontent.com/48165439/201721819-6e4449ef-319d-4090-a811-04ba19b33bbe.png">

### Connecting TRON wallet

<img width="1276" alt="Screenshot 2022-11-14 at 18 06 39" src="https://user-images.githubusercontent.com/48165439/201722041-5e1da82e-14d3-4d7d-afe6-bca5e1b8a271.png">

