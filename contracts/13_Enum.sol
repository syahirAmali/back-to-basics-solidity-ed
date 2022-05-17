// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

/// @title Solidity enums
/// @author solidity by example
/// @notice Enums are used to model choice, and keep track of state
/// @notice can be declared outside of a contract
contract Enum {
    // Enum representing shipping status
    enum Status {
        Pending,
        Shipped,
        Accepted,
        Rejected,
        Canceled
    }

    // Default value is the first element listed in
    // definition of the type, in this case "Pending"
    Status public status;

    // Returns uint
    // Pending  - 0
    // Shipped  - 1
    // Accepted - 2
    // Rejected - 3
    // Canceled - 4
    /// @notice a method to get the current status, it returns the uint value
    function get() public view returns (Status) {
        return status;
    }

    // Update status by passing uint into input
    /// @notice sets the new status/state of the enum, value entered can be done in int or the state
    function set(Status _status) public {
        status = _status;
    }

    // You can update to a specific enum like this
    /// @notice how the status of an enum can be set with the state
    function cancel() public {
        status = Status.Canceled;
    }

    // delete resets the enum to its first value, 0
    function reset() public {
        delete status;
    }
}

/// @notice enums can be imported/inherited from another contract
contract EnumDeclaration {
    enum Status {
        Pending,
        Shipped,
        Accepted,
        Rejected,
        Canceled
    }
}

contract EnumExampleWithInheritence is EnumDeclaration {
    Status public status;
}