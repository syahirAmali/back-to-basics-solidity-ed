// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

/// @title solidity mapping
/// @author syahir amali
/// @notice created with the syntax mapping(keyType => valueType);
/// @notice the keyType can be any built-in value type, bytes, string, or any contract
/// @notice valueType can be any type including another mapping or an array
/// @notice mappings are not iterable
contract Mapping {
    /// @notice Mapping from address to uint
    /// @notice maps the address to uint values
    mapping(address => uint) public myMap;

    /// @notice gets the value of a mapping based on the address
    /// @param _addr, is used to get the value of mapped address in myMap
    /// @return uint, value returned from the mapping
    function get(address _addr) public view returns (uint) {
        // Mapping always returns a value.
        // If the value was never set, it will return the default value.
        return myMap[_addr];
    }

    /// @notice sets the value of the address entered
    /// @param _addr, is used at the mapping, _i is the new value being entered
    function set(address _addr, uint _i) public {
        // Update the value at this address
        myMap[_addr] = _i;
    }

    /// @notice removes a mapping
    /// @dev it simply resets the mapped value to the default value
    /// @param _addr, the address to have the mappin removed
    function remove(address _addr) public {
        // Reset the value to the default value.
        delete myMap[_addr];
    }
}

/// @notice created with the syntax mapping(keyType => mapping);
contract NestedMapping {
    // Nested mapping (mapping from address to another mapping)
    mapping(address => mapping(uint => bool)) public nested;

    /// @notice gets value from nested mapping
    function get(address _addr1, uint _i) public view returns (bool) {
        // You can get values from a nested mapping
        // even when it is not initialized
        return nested[_addr1][_i];
    }

    /// @notice sets value for nested mapping
    function set(
        address _addr1,
        uint _i,
        bool _boo
    ) public {
        nested[_addr1][_i] = _boo;
    }

    /// @notice removes nested mapping value
    function remove(address _addr1, uint _i) public {
        delete nested[_addr1][_i];
    }
}