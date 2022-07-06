// SPDX-License-Identifier: Unlicensed


pragma solidity ^0.8.0;

contract Struct {

    enum Status {
        Taken,          //0
        Preparing,      //1
        Boxed,          //2
        Shipped         //3
    }

    struct Order {
        address customer;
        string zipCode;
        uint[] products;
        Status status;
    }

    Order[] public orders;


    mapping(address => uint) public users;

    function createOrder(string memory _zipCode, uint[] memory _products) public returns(uint) {
        require(_products.length > 0, "No products");

        // Order memory order;
        // order.customer  = msg.sender;
        // order.zipCode   = _zipCode;
        // order.products  = _products;
        // order.status    = Status.Taken;                  Struct oluşturmanın 1. Yolu
        // orders.push(order);


        // orders.push(
        //     Order({
        //         customer:   msg.sender,
        //         zipCode:    _zipCode,                    Struct oluşturmanın 2. Yolu
        //         products:   _products,
        //         status:     Status.Taken 
        //     })
        // );


        orders.push(Order(msg.sender, _zipCode, _products, Status.Taken)); //Struct oluşturmanın 3. Yolu

        return orders.length-1;
    }
}