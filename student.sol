// Write a program in solidity to create Student data. Use the following constructs:
// 1. Structures
// 2. Arrays
// Deploy this as smart contract on Ethereum and Observe the transaction fee and Gas values.

// SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0;

contract student
{
    struct Student
    {
        uint id;
        string name;
        string dept;
    }

    uint total = 0;
    Student[] students;

    function add(uint id, string memory name, string memory dept) public 
    {
        Student memory s = Student(id, name, dept);
        students.push(s);
        total++;
    }

    function get(uint get_id) public view returns(string memory, string memory)
    {
        for(uint i = 0; i < students.length; i++)
        {
            Student memory s = students[i];
            if(s.id == get_id)
            {
                return (s.name, s.dept);
            }
        }
        return ("NA", "NA");
    }

    function getTotal() public view returns (uint)
    {
        return total;
    }

}