// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

/// @title Read and writing to a state variable
/// @author solidity by example
/// @notice a look at how read and write is done
contract SimpleStorage {
    /// @notice to write and update a state on the blockchain a transaction is required
    /// @notice to simply read, it is free without any need for a transaction
    
    /// @notice State variable to store a number
    uint public num;

    /// @notice You need to send a transaction to write to a state variable.
    function set(uint _num) public {
        num = _num;
    }

    /// @notice You can read from a state variable without sending a transaction.
    function get() public view returns (uint) {
        return num;
    }
}