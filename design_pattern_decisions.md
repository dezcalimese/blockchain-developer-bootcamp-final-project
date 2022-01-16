# Design Patterns 

## Interface and Interfaces
- `Wallet` contract inherits the OpenZeppelin `Ownable` contract to restrict transfers to the caller of the contract.
  
## Access Control Design Patterns
- `Ownable` design used in the `createTransfer` function to prevent unauthorized transfers.