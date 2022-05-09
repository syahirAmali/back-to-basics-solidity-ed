// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

/// @title Solidity structs
/// @author syahir amali
/// @notice Structs are essentially solidity types
/// @notice is useful for grouping related data
/// @notice can be imported from outside of the contract
contract Todos {
    struct Todo {
        string text;
        bool completed;
    }

    // An array of 'Todo' structs
    Todo[] public todos;

    /// @notice creates a todo item with text and completed status
    /// @param _text is for the task on todo
    function create(string memory _text) public {
        // 3 ways to initialize a struct
        // - calling it like a function
        todos.push(Todo(_text, false));

        // key value mapping
        todos.push(Todo({text: _text, completed: false}));

        // initialize an empty struct and then update it
        Todo memory todo;
        todo.text = _text;
        // todo.completed initialized to false

        todos.push(todo);
    }

    /// @notice Solidity automatically created a getter for 'todos' so you don't actually need this function.
    function get(uint _index) public view returns (string memory text, bool completed) {
        Todo storage todo = todos[_index];
        return (todo.text, todo.completed);
    }

    /// @notice updates the text according the index entered
    function update(uint _index, string memory _text) public {
        Todo storage todo = todos[_index];
        todo.text = _text;
    }

    /// @notice update completed based on the index
    function toggleCompleted(uint _index) public {
        Todo storage todo = todos[_index];
        todo.completed = !todo.completed;
    }
}

contract TodoStruct {
    struct Todo {
        string text;
        bool completed;
    }
}

contract TodosExample is TodoStruct{
    // An array of 'Todo' structs
    Todo[] public todos;
}