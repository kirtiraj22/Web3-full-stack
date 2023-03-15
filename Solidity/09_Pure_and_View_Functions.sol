//When we normally call any function in solidity, we are supposed to spend some gas as a transaction fee
//but if we call PURE or VIEW function , gas isn't spent

//VIEW function : a view function means that we can just read something from the function
//view and pure function disallow any modification of state. so we can't update the blockchain at all with the view function
//PURE fumctions additionally disallow the users to read from the blockchain state.

//NOTE : There is a CONDITION when VIEW and PURE function COSTS gas : this happens when a gas calling function calls a view or pure fumction for eg : 

//example 1 : 

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;  

contract SimpleStorage{
    uint256 public favoriteNumber;

    function retrieve() public view returns(uint256){
        return favoriteNumber;
    }
}


//Example 2 : 

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;  

contract SimpleStorage{
    uint256 public favoriteNumber;
    
    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
        retrieve();                                 //calling a view function from a gas calling function
    }
    
    function retrieve() public view returns(uint256){
        return favoriteNumber;
    }
}


//In the above two examples, retrieve function in EXAMPLE 1 won't cost transaction fees
//but in EXAMPLE 2 , the retrieve() function will do cost some transaction fee because it is been called from a gas calling function
