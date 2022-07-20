// SPDX-License-Identifier: MIT


pragma solidity ^0.8.0;

contract A {
    uint256 public x;
    uint256 public y;


    function a(uint256 _x) virtual external {
        x = _x;    
    
    }
    


    function b(uint256 _y) external {
        y= _y;
    }
}



contract B is A{

    
    function a(uint256 _x) override external {
        x = _x;    
    
    }


}