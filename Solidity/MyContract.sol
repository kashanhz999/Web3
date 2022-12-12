// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyContract {

    // Variables
    // State Variables
    // This variable get stored in the blockchain
    int256 public myInt = -1;
    uint public myUint = 1;
    // 256 bytes stored in no.
    // 256 is default so uint is short for uint256
    uint256 public myUint256 = 1;
    uint8 public myUint8 = 1;

    string public myString = "Hello, world!";
    // bytes32 treats string as an array and gives special functionality
    bytes32 public myBytes32 = "Hello, world!";

    // any address like smart contract address or wallet address
    address public myAddress = 0xD7ACd2a9FD159E69Bb102A1ca21C9a3e3A5F771B;

    // custom data type with struct
    struct MyStruct {
        uint256 myUint256;
        string myString;
    }
    MyStruct public myStruct = MyStruct(1, "Hello, world!");

    // Local Variables (declared, assigned and used only inside function)
    // pure because it doesn't modify blockchain in any way just return a local variable
    // View function declares that no state will be changed. Pure function declares that no state variable will be changed or read.
    function getValue() public pure returns(uint) {
        uint value = 1;
        value = value + 1;
        return value;
    }



    // Arrays
    uint[] public uintArray = [1,2,3];
    string[] public stringArray = ["apple", "banana", "carrot"];
    string[] public values;

    // add value in array
    function addValue(string memory _value) public {
        values.push(_value);
    }

    // return length of array
    function valueCount() public view returns(uint) {
        return values.length;
    }

    // 2D arrays
    uint256[][] public array2D = [[1,2,3], [4,5,6]];



    // Mappings that allows to store as key value pairs
    mapping(uint => string) public names;

    // constructor() {
    //     names[1] = "Adam";
    //     names[2] = "Bruce";
    //     names[3] = "Carl";
    // }

    struct Book {
        string title;
        string author;
    }

    mapping(uint => Book) public books;

    function addBook(
        uint _id, 
        string memory _title, 
        string memory _author
    ) public {
        books[_id] = Book(_title, _author);
    }

    // nested mapping
    mapping(address => mapping(uint => Book)) public myBooks; 

    // msg is a global variable exposed by solidity in every smart contract
    // sender is a property of msg who tells who deployed this smart contract
    function addMyBook (
        uint _id, 
        string memory _title,
        string memory _author
    ) public {
        myBooks[msg.sender][_id] = Book(_title, _author);
    }



    // Conditionals
    // Loops

    // IF (some condition)
    // THEN (do some action)
    // ELSE (do some other action)


    address public owner;
    constructor() {
        owner = msg.sender;
    }

    uint[] public numbers = [1,2,3,4,5,6,7,8,9,10];

    function countEvenNumbers() public view returns(uint) {
        uint count = 0;

        for (uint i = 0; i < numbers.length; i++) {
            if (isEvenNumber(numbers[i])) {
                count++;
            }
        }

        return count;
    }

    function isEvenNumber(uint _number) public view returns(bool) {
        if (_number % 2 == 0) {
            return true;
        } else {
            return false;
        }
    }

    function isOwner() public view returns(bool) {
        return (msg.sender == owner);
    }

}