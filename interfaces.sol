// SPDX-License-Identifier: Unlicensed



pragma solidity ^0.8.0;

/*

    Interfaces (Arayüz) : OOP' deki Polymorphism konseptinin uygulama biçimlerinden birisidir.


    Parent a
    Child ab    Child ac    Child ad

    Araç
    Kamyon Otomobil Motorsiklet

    fn tekerlekSayisi(Araç a) retruns(uint256) {
        return a.tekerlekSayisi;
    }
 

    Sınıflar arasında etkileşim için bir standart oluşturur
    Solidity'de sınıflar => kontratlar


*/

contract ETHsender {
    function _send(address payable to, uint256 _amount) private {
        to.transfer(_amount);
    }

    function sendWithStrategy(address StrategyAddress) external{
        // (bool success, bytes memory data) = StrategyAddress.call(abi.encodeWithSignature("getAddressAndAmount()"));
        (address payable to, uint256 _amount) = I Strategy(StrategyAddress).getAddressAndAmount();
        _send(to,_amount);
    }  

    // from, data, to, nonce, hash

    receive () external payable {}

}

abstract contract Strategy {

    function getAddressAndAmount() external virtual view returns (address payable, uint256);
}


interface IStrategy {
    function getAddressAndAmount() external  view returns (address payable, uint256);
}

contract AddressStrategy1 {
    uint256 constant ETHER_AMOUNT = 1 ether;
    
    function getAddressAndAmount() external pure returns(address payable, uint256) {
        return(payable(0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2), ETHER_AMOUNT);
    }
}

contract AddressStrategy2 {
    uint256 constant ETHER_AMOUNT = 1 ether;
    
    function getAddressAndAmount() external pure returns(address payable, uint256) {
        uint256 amount = ETHER_AMOUNT * 5;
        return(payable(0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2), amount);
    }
}


contract AddressStrategy3 is Strategy{


    uint256 constant ETHER_AMOUNT = 1 ether;
    function getAddressAndAmount() external override pure returns (address payable, uint256){
        uint256 amount = ETHER_AMOUNT * 5;
        return(payable(0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2), amount);
    }

}



