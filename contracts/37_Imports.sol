/// ├── Import.sol
/// └── Foo.sol

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

/// @title Imports
/// @author syahir amali
/// @notice ways to import in solidity
/// @notice files can be imported locally and externally in solidity

struct Point {
    uint x;
    uint y;
}

error Unauthorized(address caller);

function add(uint x, uint y) pure returns (uint) {
    return x + y;
}

contract Foo {
    string public name = "Foo";
}

// import Foo.sol from current directory
//import "./Foo.sol";

// import {symbol1 as alias, symbol2} from "filename";
// import {Unauthorized, add as func, Point} from "./Foo.sol";

contract Import {
    // Initialize Foo.sol
    Foo public foo = new Foo();

    // Test Foo.sol by getting it's name.
    function getFooName() public view returns (string memory) {
        return foo.name();
    }
}

/// @notice You can also import from GitHub by simply copying the url

// https://github.com/owner/repo/blob/branch/path/to/Contract.sol
// import "https://github.com/owner/repo/blob/branch/path/to/Contract.sol";

// Example import ECDSA.sol from openzeppelin-contract repo, release-v4.5 branch
// https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v4.5/contracts/utils/cryptography/ECDSA.sol
// import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v4.5/contracts/utils/cryptography/ECDSA.sol";
