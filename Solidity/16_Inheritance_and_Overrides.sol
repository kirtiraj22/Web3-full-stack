//we can basically inherit one contract to another contract by adding two lines of code : 
//suppose we need to inherit the contents of a contract named as SimpleStorage to the contract ExtraStorage
//to do this we need to use the following syntax : 
 
import "./SimpleStorage.sol";
contract ExtraStorage is SimpleStorage{

}

//Now our ExtraStorage contract is going to be the exact same as SimpleStorage contract and we can put additional functions
//in our ExtraStorage contract

//suppose we dont want a function named as store (in ExtraStorage contract) to perform in the same way as it performs in our SimpleStorage contract
//This can be done by overriding the function 
//we need to include 2 KEYWORDS named as OVERRIDE and VIRTUAL in the functions 
//Note : we need to make the store function of SimpleStorage contract as VIRTUAL
// and store function of ExtraStorage contract as OVERRIDE

//for eg : 
                                          //ExtraStorage.sol
//SPDX-License-Identifier:MIT

pragma solidity ^0.8.8;

import "./SimpleStorage.sol";


contract ExtraStorage is SimpleStorage {
    function store(uint256 _favoriteNumber) public override {         //here we are using OVERRIDE keyword
        favoriteNumber = _favoriteNumber + 5;
    }
}


                                              //SimpleStorage.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;  

contract SimpleStorage{
    uint256 public favoriteNumber;
    
    function store(uint256 _favoriteNumber) public virtual{           //here we are using VIRTUAL keyword
        favoriteNumber = _favoriteNumber;
    }
    function retrieve() public view returns(uint256){
        return favoriteNumber;
    }
}


                                              
