# Final Project - Multisig Wallet

## Project Description
- A multisig wallet which let's one account create transfers and also lets accounts listed on the approvers list able to approve them.

## Simple Workflow
1. Login with Metamask
2. Create a transfer amount and send to an address
3. Approve the transfer

## Directory Structure
- `client`: React frontend
- `contracts`: Smart contracts deployed on Rinkeby testnet
- `migrations`: Migration files for deploying contracts in `contracts` directory.
- `test`: Smart contract tests

## How to Run a Local Project
### Prerequisites
- Node.js >= 13.14
- Truffle
- Ganache
- Yarn

### Contracts
- Run `npm i` to install Truffle build and smart contract dependencies
- Run `truffle develop` in root project to generate addresses
- Run `migrate --reset --network development` to run it on localhost at port `9545` with Ganache
- To run tests, open another terminal tab and in the root folder run `truffle test`

### Frontend
- `cd client`
- `yarn install` or `npm i`
- `yarn start`
- Open `http://localhost:3000`

## Deployed Version URL
https://reverent-goldstine-416b6d.netlify.app/

## Screencast Link
https://www.loom.com/share/fd25e0b67b87465f99befdd1b9f9f64e

## Public Ethereum wallet for certification:
benzobryant.eth
