// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

/// @title A cimple contract to increment and decrement a count store on the contract
/// @author Syahir Amali
/// @notice A contract for practice and getting back to the basics
contract Counter {
    uint public count;

    /// @notice Fucntion to get the current count
    /// @dev returns a uint
    /// @return Count , the value of count is returned
    function getCount() public view returns (uint) {
        return count;
    }

    /// @notice A fucntion to increment the count by 1
    /// @dev can be made to increment according to the value given
    function increment() public {
        count += 1;
    }

    /// @notice A function to decrement the count by 1
    /// @dev can be made to decrement according to the value given, function will also fail if the count = 0
    function decrement() public {
        count-= 1;
    }
}