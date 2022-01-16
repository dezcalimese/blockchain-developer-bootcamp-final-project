# Smart Contract Security Measures

## SWC-100 (Function Defualt Visibility)
- All functions are specified with a visibility type and are not of default visibility.

## SWC-102 (Outdated Compiler Version)
- A recent compiler version was used.

## Use Modifiers Only for Validation
- All modifiers only validate data with `require` statements.
  
## Proper Use of Require, Assert, and Revert
- `require` statements are made in the `approveTransfer` function to ensure that transfers have not already been sent and cannot be approved twice.