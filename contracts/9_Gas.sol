// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

/// @title Solidity gas
/// @author solidity by example
/// @notice A look at how gas works for solidity
/// @notice user pays in ether based on
/// @notice gas spent * gas price
/// @notice gas, is a unit of computation
/// @notice gas spent, is the total amount of gas used in a transction, higher gas spending means tougher computation
/// @notice gas price, how much youre willing to pay per gas
contract Gas {
    /// @notice transactions with higher gas prices will have a higher priority to be included in the block
    /// @notice unspent gas will be refunded

    /// @notice gas limit, there are 2 upper bounds to the amount of gas you can spend
    /// @notice gas limit, the amount of gas youre willing to use for your transaction, set by the user
    /// @notice block gas limit, max amount of gas allowed in a block, this is decided by the network

    uint public i = 0;

    // Using up all of the gas that you send causes your transaction to fail.
    // State changes are undone.
    // Gas spent are not refunded.
    function forever() public {
        // Here we run a loop until all of the gas are spent
        // and the transaction fails
        while (true) {
            i += 1;
        }
    }
}