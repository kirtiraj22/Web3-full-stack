//we have a total of 4 visibility specifiers that a variable or a function can have and these are : public, private, external and internal
//public : The variables or functions declared as public are visible externally and internally. 
//NOTE : when we make a variable public then that variable behaves as a function that returns its value for eg : 
    //uint256 public favoriteNumber = 5;
    //This variable favoriteNumber can be considered as a function which will return its value(i.e 5 in this case)

//private : the variables or functions specified as private are only visible in the current contract(i.e only the specific contract can call that function)
//external : they are only visible externally i.e these functions can only be used or called outside the contract by other contracts
//internal : they can only be called internally within the contract or by the child contracts of the current contract

//solidity code : 

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;  

contract SimpleStorage{
  uint256 public favoriteNumber; 
  
  function store(uint256 _favoriteNumber) public {
      favoriteNumber = _favoriteNumber;
  }
}


//NOTE : if we dont specify the visibility of the function or variable then it will be specified as "internal" by default
