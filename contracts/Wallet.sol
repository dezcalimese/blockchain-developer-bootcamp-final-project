// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

import "@openzeppelin/contracts/access/Ownable.sol";

contract Wallet is Ownable {
    address[] public approvers;
    uint public quorum;
    struct Transfer {
        uint id;
        uint amount;
        address payable to;
        uint approvals;
        bool sent;
    }
    Transfer[] public transfers;
    mapping(address => mapping(uint => bool)) public approvals;
    
    constructor(address[] memory _approvers, uint _quorum) {
        approvers = _approvers;
        quorum = _quorum;
    }
    
    /// @notice This returns the list of addresses that can approve transfers
    function getApprovers() external view returns(address[] memory) {
        return approvers;
    }
    
    /// @notice This returns the list of transfers
    function getTransfers() external view returns(Transfer[] memory) {
        return transfers;
    }

    /// @notice This creates a transfer of an amount to a certain address and adds to the list
    /// @param amount an amount in Wei
    /// @param to an address that accepts ether
    function createTransfer(uint amount, address payable to) external onlyOwner {
        transfers.push(Transfer(
            transfers.length,
            amount,
            to,
            0,
            false
        ));
    }
    
    /// @notice This allows an address from the approvals list to approve a transfer
    /// @param id number of approvals
    function approveTransfer(uint id) external onlyApprover() {
        require(transfers[id].sent == false, 'transfer has already been sent');
        require(approvals[msg.sender][id] == false, 'cannot approve transfer twice');
        
        approvals[msg.sender][id] = true;
        transfers[id].approvals++;
        
        if(transfers[id].approvals >= quorum) {
            transfers[id].sent = true;
            address payable to = transfers[id].to;
            uint amount = transfers[id].amount;
            to.transfer(amount);
        }
    }
    
    /// @notice This allows the address of this smart contract to receive ether
    receive() external payable {}
    
    
    modifier onlyApprover() {
        bool allowed = false;
        for(uint i = 0; i < approvers.length; i++) {
            if(approvers[i] == msg.sender) {
                allowed = true;
            }
        }
        require(allowed == true, 'only approver allowed');
        _;
    }
}