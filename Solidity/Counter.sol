// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// It is object oriented programming language
contract Counter {
    // Code goes here...

    // state variable that resides on blockchain itself
    // statically types therefore data type needs to be declared.
    uint public count = 0; // 1, 2, 3....

    // no need we initialize count above
    // // runs only once whenever contract is created.
    // constructor() public {
    //     count = 0;
    // }

    // no need when count declared public
    // // read function (free)
    // View function declares that no state will be changed. Pure function declares that no state variable will be changed or read.
    // function getCount() public view returns(uint) {
    //     return count;
    // }

    // write function (costs gas fees)
    function incrementCount() public {
        count++;
    }
}