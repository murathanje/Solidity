// SPDX-License-Identifier: Unlicensed


pragma solidity ^0.8.0;

contract Interact {


    address public caller;
    mapping(address => uint) public counts;

    function callThis() external {
        caller = msg.sender;
        counts[caller]++;
    }
}





contract Pay {

        mapping(address => uint) public  userBalances;

        function payEther(address _payer) external payable {
            userBalances[_payer] += msg.value;
        }
}



// msg.sender => A => B



contract Caller {

    Interact interact;

    constructor(address _interactContract) {
        interact = Interact(_interactContract);         
    }


    function callInt() external {
        interact.callThis();
    }


    function readCaller() external view returns(address){
        return interact.caller();
    }

    function readCount() external view returns(uint256) {
        return interact.counts(msg.sender);
    }

    function payTopay(address _payAddress) public payable {
        
        Pay pay = Pay(_payAddress); 
        pay.payEther{value: msg.value}(msg.sender);     

        // Pay(_payAddress).pay.payEther{value: msg.value}(msg.sender);
    }

    function sendEthBytransfer() public payable {
        payable(address (interact)).transfer(msg.value);
    }




 
}