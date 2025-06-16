// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract ToDoList {
    
    struct Task {
        uint id; // unique identifier for the task
        // TODO:
        // - description: task details
        // - completedBy: dynamic array to store addresses of users who completed the task
    }
    
    Task[] private tasks; // Array to store all tasks
    uint private nextId = 1; // Counter to assign unique IDs to tasks

    function addTask(string memory description) public {
        // TODO:
        // - Create a new Task struct with:
        //   * id set to nextId
        //   * description set to the input param
        //   * completedBy initialized as empty array
        // - Append the new Task to tasks array
        // - Increment nextId for the next task
    }
    
    function getTasks() public view returns (Task[] memory) {
        // TODO:
        // - Return the entire tasks array
    }
    
    function completeTask(uint id) public {
        // TODO:
        // - Search tasks array for the task with matching id
        // - Check if msg.sender has already completed this task (avoid duplicates)
        // - If not completed yet, add msg.sender to completedBy array of that task
        // - Revert if no matching task found
    }
    
    function getCompletedBy(uint id) public view returns (address[] memory) {
        // TODO:
        // - Find the task with the matching id
        // - Return the completedBy array for that task
        // - Revert if no matching task found
    }
}