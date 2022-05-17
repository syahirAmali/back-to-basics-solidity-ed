// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

/// @title Solidity immutable
/// @author solidity by example
/// @notice A look at immutable variables
contract Immutable {
    /// @notice are much like constants
    /// @notice immutable values can be set from the constructor
    /// @notice cannot be modified after initialised

    /// @notice how constants are used with uppercase
    address public immutable MY_ADDRESS;
    uint public immutable MY_UINT;

    constructor(uint _myUint) {
        MY_ADDRESS = msg.sender;
        MY_UINT = _myUint;
    }
}