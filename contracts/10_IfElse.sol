// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

/// @title If , else if, else
/// @author syahir amali
/// @notice a look at if else in solidity
contract IfElse {

    /// @notice function to check for the value of x and return a specific value
    /// @dev if value is less than 10 return 0, if less than 20 return 1, else return 2
    /// @param x, a value to be entered by the user
    /// @return value based on the x
    function foo(uint x) public pure returns (uint) {
        if (x < 10) {
            return 0;
        } else if (x < 20) {
            return 1;
        } else {
            return 2;
        }
    }

    /// @notice a shorthanded method to using if else
    /// @notice if x is less than 10, return 1 , else return 2
    function ternary(uint _x) public pure returns (uint) {
        // if (_x < 10) {
        //     return 1;
        // }
        // return 2;

        // shorthand way to write if / else statement
        return _x < 10 ? 1 : 2;
    }
}