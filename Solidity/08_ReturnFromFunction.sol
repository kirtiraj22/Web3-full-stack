//The syntax to return something from the function in solidity is as follows : 
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;  

contract SimpleStorage{
  uint256 public favoriteNumber;
  
  function retrieve() public view returns(uint256){
    return favoriteNumber;
  } 
}


//in the above example we have made a function named as retrieve() which will return a uint256 
//we have also mentioned a term view. a view function means that we will just be able to read something from the function.
