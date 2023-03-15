// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;  

contract SimpleStorage{
    uint256 public favoriteNumber;
    
    function store(uint256 _favoriteNumber) public{
        favoriteNumber = _favoriteNumber;
    }
}

//Note that we are using an underscore as a prefix to the name of the parameter(i.e _favoriteNumber)
//This is a style used to differentiate between fumction arguments and global variables
//in the above example, our global variable is favoriteNumber
//so the underscore differentiates between the global variable named as favoriteNumber and the function parameter _favoriteNumber
