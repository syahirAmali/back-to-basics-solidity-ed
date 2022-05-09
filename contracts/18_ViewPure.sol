// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

/// @title Solidity View and Pure Fucntions
/// @author syahir Amali
/// @notice getters can be either view or pure
/// @notice view - no state will be changed
/// @notice pure - no state variable will be read or changed
contract ViewAndPure {
    uint public x = 1;

    /// @notice Promise not to modify the state.
    function addToX(uint y) public view returns (uint) {
        return x + y;
    }

    /// @notice Promise not to modify or read from the state.
    function add(uint i, uint j) public pure returns (uint) {
        return i + j;
    }
}