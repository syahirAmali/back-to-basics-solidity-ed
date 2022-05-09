// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

/// @title Sending Ether (transfer, send, call)
/// @author syahir amali
/// @notice ether can be sent with, transfer (2300 gas, throws error), send (2300 gas, returns bool), call (forwards all gas or set gas, returns bool)
/// @notice ether can be reiceved with receive() external payable, fallback() external payables
/// @notice receive() is called if msg.data is empty, otherwise fallback() is called.
/// @notice a call in combination with re-entrancy guard is the reccomended method to use afte december 2019
/// @notice guard against reentrancy by - making all state changes before calling other contracts, use a reentrancy guard modifier

contract ReceiveEther {
    /*
    Which function is called, fallback() or receive()?

           send Ether
               |
         msg.data is empty?
              / \
            yes  no
            /     \
receive() exists?  fallback()
         /   \
        yes   no
        /      \
    receive()   fallback()
    */

    // Function to receive Ether. msg.data must be empty
    receive() external payable {}

    // Fallback function is called when msg.data is not empty
    fallback() external payable {}

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}

contract SendEther {
    function sendViaTransfer(address payable _to) public payable {
        // This function is no longer recommended for sending Ether.
        _to.transfer(msg.value);
    }

    function sendViaSend(address payable _to) public payable {
        // Send returns a boolean value indicating success or failure.
        // This function is not recommended for sending Ether.
        bool sent = _to.send(msg.value);
        require(sent, "Failed to send Ether");
    }

    function sendViaCall(address payable _to) public payable {
        // Call returns a boolean value indicating success or failure.
        // This is the current recommended method to use.
        (bool sent,) = _to.call{value: msg.value}("");
        require(sent, "Failed to send Ether");
    }
}
