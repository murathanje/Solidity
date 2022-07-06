// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Constructor{

    string public tokenName;
    uint public totalSupply;
    address public immutable number1;

    constructor(string memory name, uint number){
        tokenName = name;
        totalSupply = number;
        number1=msg.sender;


    }

    function changeNumber(uint x) public{
        totalSupply = x;
    }
}