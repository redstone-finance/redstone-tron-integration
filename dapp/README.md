# Sample dApp integrated with Tron blockchain

## Deploying contract on tron Nile testnet

- Create `.env` file with the corresponding private keys configuration (check [tronbox.js](tronbox.js) to learn more)
- Run `npx tronbox compile`
- Run `npx tronbox migrate --network nile` (add `--reset` param to redeploy)

## Running tests

- Launch local tron node in a separate terminal tab (`docker run -it --rm -p 9090:9090 --name tron trontools/quickstart`)
- Run tests (`npx tronbox test`)
