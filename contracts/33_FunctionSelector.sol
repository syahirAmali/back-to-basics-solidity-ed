// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

/// @title Solidity Function Selector
/// @author solidity by example
/// @notice when a function is called, the first 4 bytes of calldata specifies which function to call
/// @notice this 4 bytes is called a function selector
/// @notice ex. addr.call(abi.encodeWithSignature("transfer(address,uint256)", 0xSomeAddress, 123))
/// @notice the first 4 bytes returned from abi.encodeWithSignature(...) is the function selector
/// @notice it is possible to save gas if you precompute and inline the function selector from your code

contract FunctionSelector {
    /*
    "transfer(address,uint256)"
    0xa9059cbb
    "transferFrom(address,address,uint256)"
    0x23b872dd
    */
    function getSelector(string calldata _func) external pure returns (bytes4) {
        return bytes4(keccak256(bytes(_func)));
    }
}
