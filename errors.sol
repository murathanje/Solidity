// SPDX-License-Identifier: Unlicense


pragma solidity ^0.8.0;


contract Errors{
    uint public totalBalance;
    mapping(address => uint) public userBalances;

    error ExceedingAmount(address user, uint exceedingAmount);
    error Deny(string reason);

    receive() external payable {
        revert Deny("No direct paymnets.");

    }


    fallback() external payable {
        revert Deny("No direct paymnets.");

    }



    function pay() noZero(msg.value) external payable {
        require(msg.value == 1 ether, "Only paymrnts in 1 ether.");
        totalBalance += 1 ether;
        userBalances[msg.sender] += 1 ether;
    }

    function withDraw(uint _amount) noZero(_amount) external {
        uint initialBalance = totalBalance;

        if(userBalances[msg.sender] < 0){
            // revert("Insufficient balance");  
            revert ExceedingAmount(msg.sender, _amount-userBalances[msg.sender]);
        }

        totalBalance -= _amount;
        userBalances[msg.sender] -= _amount;
        payable(msg.sender).transfer(_amount);

        assert(totalBalance < initialBalance);
    } 


    modifier noZero(uint _amount) {
        require(_amount != 0, "You can't pay 0 ether");
        _;
    }
}