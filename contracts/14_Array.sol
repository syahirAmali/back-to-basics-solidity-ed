// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

/// @title solidity arrays
/// @author solidity by example
/// @notice a look at solidity arrays
contract Array {
    /// @notice Several ways to initialize an array
    uint[] public arr;
    uint[] public arr2 = [1, 2, 3];
    /// @notice Fixed sized array, all elements initialize to 0
    uint[10] public myFixedSizeArr;

    /// @notice getting the array value based on the index
    function get(uint i) public view returns (uint) {
        return arr[i];
    }

    /// @notice method to get the entire array
    /// @notice Solidity can return the entire array.
    /// @notice But this function should be avoided for arrays that can grow indefinitely in length.
    function getArr() public view returns (uint[] memory) {
        return arr;
    }

    /// @notice adds to array, and increases the length
    function push(uint i) public {
        // Append to array
        // This will increase the array length by 1.
        arr.push(i);
    }

    /// @notice removes the last element on the array
    function pop() public {
        // Remove last element from array
        // This will decrease the array length by 1
        arr.pop();
    }

    /// @notice gets the length of an array
    function getLength() public view returns (uint) {
        return arr.length;
    }

    /// @notice does not change the arra length
    /// @notice resets the value of the index position in the array
    function remove(uint index) public {
        // Delete does not change the array length.
        // It resets the value at index to it's default value,
        // in this case 0
        delete arr[index];
    }

    /// @notice creates an array in mem but is a fixed size
    function examples() external {
        // create array in memory, only fixed size can be created
        uint[] memory a = new uint[](5);
    }
}

/// @notice removes an element in the array by shifting
contract ArrayRemoveByShifting {
    // [1, 2, 3] -- remove(1) --> [1, 3, 3] --> [1, 3]
    // [1, 2, 3, 4, 5, 6] -- remove(2) --> [1, 2, 4, 5, 6, 6] --> [1, 2, 4, 5, 6]
    // [1, 2, 3, 4, 5, 6] -- remove(0) --> [2, 3, 4, 5, 6, 6] --> [2, 3, 4, 5, 6]
    // [1] -- remove(0) --> [1] --> []

    uint[] public arr;

    function remove(uint _index) public {
        require(_index < arr.length, "index out of bound");

        for (uint i = _index; i < arr.length - 1; i++) {
            arr[i] = arr[i + 1];
        }
        arr.pop();
    }

    function test() external {
        arr = [1, 2, 3, 4, 5];
        remove(2);
        // [1, 2, 4, 5]
        assert(arr[0] == 1);
        assert(arr[1] == 2);
        assert(arr[2] == 4);
        assert(arr[3] == 5);
        assert(arr.length == 4);

        arr = [1];
        remove(0);
        // []
        assert(arr.length == 0);
    }
}

/// @notice replaces the last array with the value being removed
contract ArrayReplaceFromEnd {
    uint[] public arr;

    // Deleting an element creates a gap in the array.
    // One trick to keep the array compact is to
    // move the last element into the place to delete.
    function remove(uint index) public {
        // Move the last element into the place to delete
        arr[index] = arr[arr.length - 1];
        // Remove the last element
        arr.pop();
    }

    function test() public {
        arr = [1, 2, 3, 4];

        remove(1);
        // [1, 4, 3]
        assert(arr.length == 3);
        assert(arr[0] == 1);
        assert(arr[1] == 4);
        assert(arr[2] == 3);

        remove(2);
        // [1, 4]
        assert(arr.length == 2);
        assert(arr[0] == 1);
        assert(arr[1] == 4);
    }
}