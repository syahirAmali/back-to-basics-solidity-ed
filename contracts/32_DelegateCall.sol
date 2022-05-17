// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

/// @title DelegateCall
/// @author solidity by example
/// @notice delegatecall is a low level function similar to call
/// @notice When contract A executes delegatecall to contract B, B's code is executed
/// @notice with contract A's storage, msg.sender and msg.value.
/// @notice data storage is done on the contract with delegatecall

// NOTE: Deploy this contract first
contract B {
    // NOTE: storage layout must be the same as contract A
    uint public num;
    address public sender;
    uint public value;

    function setVars(uint _num) public payable {
        num = _num;
        sender = msg.sender;
        value = msg.value;
    }
}

contract A {
    uint public num;
    address public sender;
    uint public value;

    function setVars(address _contract, uint _num) public payable {
        // A's storage is set, B is not modified.
        (bool success, bytes memory data) = _contract.delegatecall(
            abi.encodeWithSignature("setVars(uint256)", _num)
        );
    }
}
