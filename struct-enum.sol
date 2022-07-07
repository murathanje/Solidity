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
    uint public txCount;




    function createOrder(string memory _zipCode, uint[] memory _products)incTx checkOrder(_products)  external returns(uint) {
        // require(_products.length > 0, "No products");

        /*Order memory order;
        order.customer  = msg.sender;
        order.zipCode   = _zipCode;
        order.products  = _products;
        order.status    = Status.Taken;                  Struct oluşturmanın 1. Yolu
        orders.push(order);


        orders.push(
            Order({
                customer:   msg.sender,
                zipCode:    _zipCode,                    Struct oluşturmanın 2. Yolu
                products:   _products,
                status:     Status.Taken 
            })
        );*/


        orders.push(Order(msg.sender, _zipCode, _products, Status.Taken)); //Struct oluşturmanın 3. Yolu

        return orders.length-1;
    }

    address public owner;

    constructor(){
        owner = msg.sender;
    }

    function advenceOrder(uint _orderId) onlyOwner() checkOrderId(_orderId) external {
        // require(owner == msg.sender, "You are not a authorized.");
        // require(_orderId < orders.length, "Not a valid order Id");
        
        Order storage order = orders[_orderId];
        require(order.status != Status.Shipped, "Order is already shipped.");
        
        if (order.status == Status.Taken) {
            order.status = Status.Preparing;
        } else if (order.status == Status. Preparing) {
            order.status = Status.Boxed;
        } else if (order.status == Status.Boxed) {
            order.status = Status.Shipped;
        }
    }


    function getOrder(uint _orderId) checkOrderId(_orderId) external view returns(Order memory) {
        // require(_orderId < orders.length, "Not a valid order Id");
        /*
        Order memory order = orders[_orderId];
        return order;
        */
        return orders[_orderId];
    }

    function updateZip(uint _orderId, string memory _zip)onlyCustomer(_orderId) incTx checkOrderId(_orderId) external{
        // require(_orderId < orders.length, "Not a valid order Id");
        Order storage order = orders[_orderId];
        // require(order.customer == msg.sender, "You are not the owner of the order.");
        order.zipCode = _zip; 
    }

    modifier checkOrder(uint[] memory _products) {
        require(_products.length > 0, "No products");
        _;
    }

    modifier checkOrderId(uint _orderId) {
        require(_orderId < orders.length, "Not a valid order Id");
        _;
    }

    modifier incTx {
        _;
        txCount++;
    }

    modifier onlyOwner() {
        require(owner == msg.sender, "You are not a authorized.");
        _;
    }

    modifier onlyCustomer(uint _orderId) {
        require(orders[_orderId].customer == msg.sender, "You are not the owner of the order.");
        _;

    }
}