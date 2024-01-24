// Write a smart contract on a test network, for Bank account of a customer for following operations:
// 1. Deposit money 
// 2. Withdraw Money
// 3. Show balance

//SPDX-License-Identifier:MIT
pragma solidity >= 0.7.0;

contract Bank
{
    mapping (address => uint) account;
    mapping (address => bool) user;

    function create() public payable returns(string memory)
    {
        require(user[msg.sender] == false, "ACCOUNT ALREADY EXISTS");
        account[msg.sender] = msg.value;
        user[msg.sender] = true;
        return "ACCOUNT CREATED SUCCESSFULLY";
    }

    function deposit(uint amount) public payable returns(string memory)
    {
        require(user[msg.sender] == true, "ACCOUNT DOESN'T EXIST");
        require(amount > 0, "AMOUNT SHOULD BE GREATER THAN 0");
        account[msg.sender] += amount;
        return "AMOUNT ADDED SUCCESSFULLY";
    }

    function withdraw(uint amount) public payable returns(string memory)
    {
        require(user[msg.sender] == true, "ACCOUNT DOESN'T EXIST");
        require(amount > 0, "AMOUNT SHOULD BE GREATER THAN 0");
        require(account[msg.sender] > amount, "NO BALANCE");
        account[msg.sender] -= amount;
        return "AMOUNT WITHDRAWN SUCCESSFULLY";
    }

    function balance() public view returns(uint)
    {
        return account[msg.sender];
    }

    function user_exist() public view returns(bool)
    {
        return user[msg.sender];
    }
}