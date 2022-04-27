// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

/// @title Loops, for, while, and do while
/// @author syahir amali
/// @notice a look at loops in solidity
/// @notice dont write unbounded loops, this can cause you to hit your gas limit, and have the transaction fail
/// @notice because of this while, and do while loops are rarely used
contract Loop {

    /// @notice a simple for and while loop demo
    function loop() public {
        // for loop
        for (uint i = 0; i < 10; i++) {
            if (i == 3) {
                // Skip to next iteration with continue
                continue;
            }
            if (i == 5) {
                // Exit loop with break
                break;
            }
        }

        // while loop
        uint j;
        while (j < 10) {
            j++;
        }
    }
}