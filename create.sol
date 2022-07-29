//SPDX-License-Identifier: Unlicensed


pragma solidity ^0.8.0;


contract VaultFActory {
    
    
    mapping(address => Vault[]) public userVaults;




    function createVault() external {
        Vault vault = new Vault(msg.sender);

        userVaults[msg.sender].push(vault);
    }

    function createVaultwithPayment() external payable {
        Vault vault = (new Vault){value: msg.value}(msg.sender);
        userVaults[msg.sender].push(vault);

    }


}

contract Vault {


    uint256 private balance;
    address public owner;

    constructor (address _owner) payable{
        owner = _owner;
        balance += msg.value;
    }


    fallback() external payable {
        balance += msg.value;
    }

    receive() external payable {
        balance += msg.value;
    }


    function getBalance() external view returns(uint256) {
        return balance;
    }

    function deposit() external payable {
        balance += msg.value;
    }


    function withDraw(uint256 _amount) external {
        require(owner == msg.sender, "You are not authorized");
        balance -= _amount;
        payable(owner).transfer(_amount);
    } 


}