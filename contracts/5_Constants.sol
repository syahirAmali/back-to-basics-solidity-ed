// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

/// @title solidity Constants
/// @author solidity by example
/// @notice a look at solidity constants
contract Constant {
    /// @notice constant variables cannot be modified
    /// @notice this hard code method can save on gas costs

    /// @notice how constants are used with uppercase
    address public constant MY_ADDRESS = 0x777788889999AaAAbBbbCcccddDdeeeEfFFfCcCc;
    uint public constant MY_UINT = 123;
}