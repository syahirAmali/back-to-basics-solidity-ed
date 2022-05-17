// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

/// @title Solidity Errors
/// @author solidity by example
/// @notice an error can be thrown with, require, revert, and assert
/// @notice require - used to validate inputs and conditions before execution
/// @notice revert - similar to require
/// @notice asserts ensures that the code check is true, and should never be false, failing assertion prob means there a bug
/// @notice custom errors can be used to save gas
contract Error {
    /// @notice a basic require test that checks i > 10, if it is less, then the error is thrown
    function testRequire(uint _i) public pure {
        // Require should be used to validate conditions such as:
        // - inputs
        // - conditions before execution
        // - return values from calls to other functions
        require(_i > 10, "Input must be greater than 10");
    }

    /// @notice does the exact same thing as above
    function testRevert(uint _i) public pure {
        // Revert is useful when the condition to check is complex.
        // This code does the exact same thing as the example above
        if (_i <= 10) {
            revert("Input must be greater than 10");
        }
    }

    uint public num;

    /// @notice the default value of num is 0, and it can not be changed, so assert ensures that it is 0 and will throw an error if not
    function testAssert() public view {
        // Assert should only be used to test for internal errors,
        // and to check invariants.

        // Here we assert that num is always equal to 0
        // since it is impossible to update the value of num
        assert(num == 0);
    }

    /// @notice an example of a custom error
    error InsufficientBalance(uint balance, uint withdrawAmount);

    function testCustomError(uint _withdrawAmount) public view {
        uint bal = address(this).balance;
        if (bal < _withdrawAmount) {
            revert InsufficientBalance({balance: bal, withdrawAmount: _withdrawAmount});
        }
    }
}

contract Account {
    uint public balance;
    uint public constant MAX_UINT = 2**256 - 1;

    function deposit(uint _amount) public {
        uint oldBalance = balance;
        uint newBalance = balance + _amount;

        /// @notice the require statment ensures that the there is no overflow
        /// @dev balance + _amount does not overflow if balance + _amount >= balance
        require(newBalance >= oldBalance, "Overflow");

        balance = newBalance;

        assert(balance >= oldBalance);
    }

    function withdraw(uint _amount) public {
        uint oldBalance = balance;

        /// @notice the require statment ensures that the there is no underflow
        /// @dev balance - _amount does not underflow if balance >= _amount
        require(balance >= _amount, "Underflow");

        if (balance < _amount) {
            revert("Underflow");
        }

        balance -= _amount;

        assert(balance <= oldBalance);
    }
}