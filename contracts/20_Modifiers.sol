// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

/// @title Functions modifier
/// @author syahir amali
/// @notice can be made to run before/after a function call
/// @notice can be used to - restrict access, validate iputs, guard against reentrancy hacks
contract FunctionModifier {
    // We will use these variables to demonstrate how to use
    // modifiers.
    address public owner;
    uint public x = 10;
    bool public locked;

    constructor() {
        // Set the transaction sender as the owner of the contract.
        owner = msg.sender;
    }

    // Modifier to check that the caller is the owner of
    // the contract.
    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        // Underscore is a special character only used inside
        // a function modifier and it tells Solidity to
        // execute the rest of the code.
        _;
    }

    // Modifiers can take inputs. This modifier checks that the
    // address passed in is not the zero address.
    modifier validAddress(address _addr) {
        require(_addr != address(0), "Not valid address");
        _;
    }

    function changeOwner(address _newOwner) public onlyOwner validAddress(_newOwner) {
        owner = _newOwner;
    }

    // Modifiers can be called before and / or after a function.
    // This modifier prevents a function from being called while
    // it is still executing.
    // The symbol _; is called a merge wildcard. It merges the function code with the modifier code where the _; is placed.
    // In other terms, the body of the function (to which the modifier is attached to) will be inserted where the special symbol _; appears in the modifier’s definition.
    // Using the terms of the Solidity docs, it “returns the flow of execution to the original function code”.

    modifier noReentrancy() {
        require(!locked, "No reentrancy");

        locked = true;
        _; // the function goes here
        locked = false;
    }

    // sushiswaps version of ensuring EOA (users), to perform a function
    modifier onlyEOA() {
        require(msg.sender == tx.origin, "Must use EOA");
        _;    
    }

    // complements the above function, this checks the caller address to ensure that no code is present
    modifier onlyHuman {
        uint size;
        address addr = msg.sender;
        assembly { size := extcodesize(addr) }
        require(size == 0, "only humans allowed! (code present at caller address)");
        _;
    }

    function decrement(uint i) public noReentrancy {
        x -= i;

        if (i > 1) {
            decrement(i - 1);
        }
    }
}

// Using modifiers for state changes
// This code has not been professionally audited, therefore I cannot make any promises about
// safety or correctness. Use at own risk.
contract StateMachine {
    
    enum Stages {
        AcceptingBlindBids,
        RevealBids,
        WinnerDetermined,
        Finished
    }

    Stages public stage = Stages.AcceptingBlindBids;

    uint public creationTime = block.timestamp;

    modifier atStage(Stages _stage) {
        require(stage == _stage);
        _;
    }
    
    modifier transitionAfter() {
        _;
        nextStage();
    }
    
    modifier timedTransitions() {
        if (stage == Stages.AcceptingBlindBids && block.timestamp >= creationTime + 6 days) {
            nextStage();
        }
        if (stage == Stages.RevealBids && block.timestamp >= creationTime + 10 days) {
            nextStage();
        }
        _;
    }

    function bid() public payable timedTransitions atStage(Stages.AcceptingBlindBids) {
        // Implement biding here
    }

    function reveal() public timedTransitions atStage(Stages.RevealBids) {
        // Implement reveal of bids here
    }

    function claimGoods() public timedTransitions atStage(Stages.WinnerDetermined) transitionAfter {
        // Implement handling of goods here
    }

    function cleanup() public atStage(Stages.Finished) {
        // Implement cleanup of auction here
    }
    
    function nextStage() internal {
        stage = Stages(uint(stage) + 1);
    }
}