// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;  

//functions in solidity 
// functions or methods are small piece of code that will be executed when we make a function call

contract SimpleStorage{
    uint256 public favoriteNumber;
    //syntax of function : 
    function store(uint256 _favoriteNumber) public{
        favoriteNumber = _favoriteNumber;
    }
}

//we defined a public function store that takes uint256 _favoriteNumber as a parameter 
//then the function sets the favoriteNumber variable to the whatever number we pass to the funciton
