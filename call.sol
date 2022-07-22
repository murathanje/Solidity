// SPDX-License-Identifier: MIT


pragma solidity ^0.8.0;

contract Test {
    uint256 public total;
    string public incrementer;
    uint256 public fallbackCalled;

    fallback () external payable {
            fallbackCalled += 1;
    }

    function inc(uint256 _amount, string memory _incrementer) external returns(uint256) {
        total += _amount;
        incrementer = _incrementer;
        return total;
    }
}



contract Caller {

    function testCall(address _contract, uint256 _amount, string memory _incrementer) external returns(bool, uint256){
      (bool err, bytes memory res) =  _contract.call(abi.encodeWithSignature("inc(uint256, string)",_amount, _incrementer));
      uint256 _total = abi.decode(res,(uint256));
      return (err, _total);
    }


    function paytoFallBack(address _contract) external payable {
        (bool err,) =  _contract.call{value:msg.value}("");

    } 
}