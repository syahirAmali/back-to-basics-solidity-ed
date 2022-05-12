// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

/// @title Basic Ether Wallet Contract
/// @author syahir amali
/// @notice - anyone can send Eth, only the owner can withdraw
contract EtherWallet {
    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
    }

    receive() external payable {}

    function withdraw(uint _amount) external {
        require(msg.sender == owner, "caller is not owner");
        payable(msg.sender).transfer(_amount);
    }

    function getBalance() external view returns (uint) {
        return address(this).balance;
    }
}
