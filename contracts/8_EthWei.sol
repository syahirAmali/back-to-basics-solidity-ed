// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

/// @title either and wei
/// @author solidity by example
/// @notice a simple look at either and wei
contract EtherUnits {
    /// @notice transactions are paid in ether or the chain native token, this is usually done in wei
    /// @notice one ether is equal to 1018 wei. like how 1 dollar is equal to 100 cents

    uint public oneWei = 1 wei;

    /// @notice 1 wei is equal to 1
    bool public isOneWei = 1 wei == 1;

    uint public oneEther = 1 ether;
    /// @notice 1 ether is equal to 10^18 wei
    bool public isOneEther = 1 ether == 1e18;
}