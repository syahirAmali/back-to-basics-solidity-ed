// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

/// @title Solidity events
/// @author syahir amali
/// @notice a look at solidity events
/// @notice enables logging on to the ethereum chain
/// @notice can be used too listen to events and updates the user interface, cheap form of storage
contract Event {
    // Event declaration
    // Up to 3 parameters can be indexed.
    // Indexed parameters helps you filter the logs by the indexed parameter
    event Log(address indexed sender, string message);
    event AnotherLog();

    function test() public {
        emit Log(msg.sender, "Hello World!");
        emit Log(msg.sender, "Hello EVM!");
        emit AnotherLog();
    }
}
