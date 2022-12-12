// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HotelRoom {

    // vacant or occupied
    enum Statuses {
        Vacant, 
        Occupied
    }
    Statuses public currentStatus;

    // events to get alert if required conditon happens
    event Occupy(address _occupant, uint _value);

    // payable -> modifier that allows owner to accept ether
    // address of the owner
    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
        currentStatus = Statuses.Vacant;
    }

    // function book() payable {
    //     // Check price
    //     require(msg.value >= 2 ether, "Not enough ether provided.");
    //     // Checks status

    //     // require function to check if something is true provided by solidity.
    //     // if true then only further lines of code will run
    //     // second argument will be shown to user if room is occupied.
    //     require(currentStatus == Statuses.Vacant, "Currently occupied!");
    //     currentStatus = Statuses.Occupied;
    //     // msg.value gives amount of crytocurrency sent with transaction
    //     owner.transfer(msg.value);
    // } 

    // or you can use modifier like this

    modifier onlyWhileVacant {
        // Check status
        require(currentStatus == Statuses.Vacant, "Currently occupied!");
        // it means carry on function from where it is called if require returns true
        _;
    }

    modifier costs(uint _amount) {
        // Check price
        require(msg.value >= _amount, "Not enough ether provided.");
        _;
    }
    
    function book() public payable onlyWhileVacant costs(2 ether) {
        currentStatus = Statuses.Occupied;
        // msg.value gives amount of crytocurrency sent with transaction
        // owner.transfer(msg.value); or more preferred
        (bool sent, bytes memory data) = owner.call{value: msg.value}("");
        require(true);

        emit Occupy(msg.sender, msg.value);
    } 

    


} 