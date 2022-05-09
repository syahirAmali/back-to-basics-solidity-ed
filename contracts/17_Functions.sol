// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

/// @title Solidity functions
/// @author syahir amali
/// @notice a look at solidity functions
/// @notice several ways to return outputs
/// @notice public functions cannot accept certain data types as inputs or outputs
contract Function {

    /// @notice Functions can return multiple values.
    function returnMany()
        public
        pure
        returns (
            uint,
            bool,
            uint
        )
    {
        return (1, true, 2);
    }

    /// @notice Return values can be named.
    function named()
        public
        pure
        returns (
            uint x,
            bool b,
            uint y
        )
    {
        return (1, true, 2);
    }

    /// @notice Return values can be assigned to their name.
    /// @notice In this case the return statement can be omitted.
    function assigned()
        public
        pure
        returns (
            uint x,
            bool b,
            uint y
        )
    {
        x = 1;
        b = true;
        y = 2;
    }

    /// @notice Use destructuring assignment when calling another function that returns multiple values.
    function destructuringAssignments()
        public
        pure
        returns (
            uint,
            bool,
            uint,
            uint,
            uint
        )
    {
        // destructuring assignment
        (uint i, bool b, uint j) = returnMany();

        // Values can be left out.
        (uint x, , uint y) = (4, 5, 6);

        return (i, b, j, x, y);
    }

    /// @notice Cannot use map for either input or output

    // Can use array for input
    function arrayInput(uint[] memory _arr) public {}

    // Can use array for output
    uint[] public arr;

    function arrayOutput() public view returns (uint[] memory) {
        return arr;
    }
}