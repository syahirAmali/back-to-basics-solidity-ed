// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

/// @title Write to any slot
/// @author solidity by example
/// @notice Solidity storage is like an array of length 2^256. Each slot in the array can store 32 bytes.
///         State variables define which slots will be used to store data.      
///         However using assembly, you can write to any slot.      

contract Storage {
    struct MyStruct {
        uint value;
    }

    // struct stored at slot 0
    MyStruct public s0 = MyStruct(123);
    // struct stored at slot 1
    MyStruct public s1 = MyStruct(456);
    // struct stored at slot 2
    MyStruct public s2 = MyStruct(789);

    function _get(uint i) internal pure returns (MyStruct storage s) {
        // get struct stored at slot i
        assembly {
            s.slot := i
        }
    }

    /*
    get(0) returns 123
    get(1) returns 456
    get(2) returns 789
    */
    function get(uint i) external view returns (uint) {
        // get value inside MyStruct stored at slot i
        return _get(i).value;
    }

    /*
    We can save data to any slot including slot 999 which is normally unaccessble.

    set(999) = 888 
    */
    function set(uint i, uint x) external {
        // set value of MyStruct to x and store it at slot i
        _get(i).value = x;
    }
}
