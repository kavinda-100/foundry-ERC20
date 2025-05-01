# Foundry ERC20 Token

## About

This project demonstrates the implementation of an ERC20 token using Solidity and the Foundry development framework. It includes a custom token contract built on OpenZeppelin's ERC20 standard, along with comprehensive tests written in Foundry's Forge testing framework.

The project is to understand and experiment with ERC20 token functionality, including minting, transferring, and managing allowances. It also showcases best practices for smart contract development, testing, and deployment using Foundry's powerful tools.

Key features:

- **Custom ERC20 Token**: Built using OpenZeppelin's secure and battle-tested contracts.
- **Foundry Integration**: Leverages Foundry's Forge for testing and Anvil for local blockchain simulation.
- **Deployment Scripts**: Ready-to-use scripts for deploying the token to Ethereum-compatible networks.

## Foundry

**Foundry is a blazing fast, portable and modular toolkit for Ethereum application development written in Rust.**

Foundry consists of:

- **Forge**: Ethereum testing framework (like Truffle, Hardhat and DappTools).
- **Cast**: Swiss army knife for interacting with EVM smart contracts, sending transactions and getting chain data.
- **Anvil**: Local Ethereum node, akin to Ganache, Hardhat Network.
- **Chisel**: Fast, utilitarian, and verbose solidity REPL.

## Documentation

<https://book.getfoundry.sh/>

## Usage

### Build

```shell
forge build
```

### Test

```shell
forge test
```

### Format

```shell
forge fmt
```

### Gas Snapshots

```shell
forge snapshot
```

### Anvil

```shell
anvil
```

### Deploy

```shell
forge script script/Counter.s.sol:CounterScript --rpc-url <your_rpc_url> --private-key <your_private_key>
```

### Cast

```shell
cast <subcommand>
```

### Help

```shell
forge --help
anvil --help
cast --help
```
