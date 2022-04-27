//SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

/// @title Solidity variable types
/// @author Syahir Amali
/// @notice A look at the variable types of solidity
contract Variables {

    /// @notice Local - declared inside a function, not stored on the blockchain.
    /// @notice state - declared outside a function, stored on the blockchain.
    /// @notice global - provides information about the blockchain

    /// @notice State variables are stored on the blockchain
    string public text = "Hello world";
    uint public num = 123;

    /// @notice an example of a local variable within a function
    function whatever() public view{
        // local variables are not saved on the blockchain
        uint i = 456;

        // global variable examples
        uint timestamp = block.timestamp; // current blocktimestamp
        address sender = msg.sender; // address of the caller
    }
}