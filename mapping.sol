// SPDX-License-Identifier: Unlicensed


pragma solidity ^0.8.0;

contract Mappings {
    mapping(address => bool) public registered;
    mapping(address => uint) public favNum;

    function register(uint _favNum) public {
        // require(!registered[msg.sender], "Kullanici daha once kayit yapti.");
        require(!isRegistered(), "Kullanici daha once kayit yapti.");
        registered[msg.sender] = true;
        favNum[msg.sender] = _favNum;
    }

    function isRegistered() public view returns(bool) {
        return registered[msg.sender]; 
    }

    function deleteRegester() public {
        require(isRegistered(), "Lutfen once kayit olunuz.");
        delete(registered[msg.sender]);
        delete(favNum[msg.sender]);
    }
}


contract NeestedMapping {
    mapping(address => mapping(address => uint)) public debts ;

    function incDebt(address _borrower, uint _amount) public  {
        debts[msg.sender][_borrower] += _amount;
    }


    function decDebt(address _barrower, uint _amount) public {
        require(debts[msg.sender][_barrower] >= _amount, "Not enought debt.");
        debts[msg.sender][_barrower] -= _amount;
        
    }

    function getDebt(address _barrower) public view returns(uint) {
        return debts[msg.sender][_barrower];
    }
}