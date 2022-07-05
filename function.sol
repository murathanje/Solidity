// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

contract variables{

    uint public ilk = 9;

    function bir() public view returns(uint){
        return(ilk+block.timestamp);
    }

    function iki() public pure returns(string memory){
        return "iki fonksiyonu";
    }

    function uc() public pure returns(string memory) {
        return iki();
    }

    function dort() private pure returns(string memory) {
        return "gizli fonksiyon";
    }

    function bes() public pure returns(string memory) {
        return alti();
    }
 
    function alti() internal pure returns(string memory) {
        return "internal fonksiyon";
    }



    function yedi() external pure returns(string memory) {
        return "external fonksiyon";
    }
}