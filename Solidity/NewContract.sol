// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Inheritance
contract Ownable {
    address owner;

    modifier onlyOwner() {
        require (msg.sender == owner, "must be owner");
        _;
    }

    constructor() {
        owner = msg.sender;
    }
}

contract SecretVault {
    string secret;

    constructor(string memory _secret) {
        secret = _secret;
    }

    function getSecret() public view returns(string memory) {
        return secret;
    }
}

contract NewContract is Ownable{
    // Inheritance
    // Factories
    // Interaction    

    address secretVault;

    constructor(string memory _secret) {
        SecretVault _secretVault = new SecretVault(_secret); 
        secretVault = address(_secretVault);
        super; // calls constructor from parent contract
    }

    function getSecret() public view onlyOwner returns(string memory) {
        // call other smart contract from within a smart contract
        return SecretVault(secretVault).getSecret();
    }
}