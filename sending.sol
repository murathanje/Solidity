//SPDX-License-Identifier: Unlicensec

pragma solidity ^0.8.0;


contract Bank {

    mapping(address => uint) balances;


    function sendEThertoContract() payable external {

        balances[msg.sender] = msg.value;
    }

    function shoeBalance() view external returns(uint) {
        return balances[msg.sender]; 
    }

    function withDraw(address payable to, uint _amount) external {
        // require(balances[msg.sender] >= _amount, "You dont have any Wei");
        to.transfer(_amount);
        balances[msg.sender] -= _amount;
    }


    /* Trasnfer()                                                                                 **AUTO REVERT**
    

      function withDraw(address payable to, uint _amount) external returns(bool) {
            require(balances[msg.sender] > _orderId, "You dont have any Wei");                        **SEND**
            bool ok = to.send(_amount);                                                               TRUE, FALSE
            balances[msg.sender] -= _amount;
            return ok;
         }
    


      function withDraw(address payable to, uint _amount) external returns(bool) {
            require(balances[msg.sender] > _orderId, "You dont have any Wei");                        **CALL**
            (bool sent, bytes memory data) = to.call{value: _amount}("");                                                        TRUE, FALSE, GAS, MESSAGE
            balances[msg.sender] -= _amount;
            return sent;
         }
    */

    uint public receiveCount = 0; 
    uint public fallbackCount = 0;
    receive()external payable {

        receiveCount += 1;

    }

    fallback() external payable {
 
        fallbackCount += 1;

    }
    
}