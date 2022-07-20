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



contract Human {
    function sayHello() public pure virtual returns(string memory) {
        return "merhabalar, lutfen kayit olunuz.";
    }
}



contract SuperHuman is Human{
        function sayHello() public pure override returns(string memory) {
            return "nasilsin?";
        }

        function welcome(bool isMember) public pure returns(string memory) {
            return isMember ? sayHello(): Human.sayHello();  //super.sayHello()
        }
}



// import "https//::...         şeklinde de kontrat bağlanabilir."