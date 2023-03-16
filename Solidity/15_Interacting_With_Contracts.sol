//To interact with a contract, we need two things : 
//1) Address of the contract
//2) ABI of the contract  (ABI stands for Application Binary Interface) 
//eg : 

//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;

import "./SimpleStorage.sol";

contract StorageFactory{
    SimpleStorage[] public simpleStorageArray;

    function createSimpleStorageContract() public {
        SimpleStorage simpleStorage = new SimpleStorage();
        simpleStorageArray.push(simpleStorage);
    }

    function sfStore(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber) public{
        //creating variable simpleStorage which will store an instance of SimpleStorage having a particular address
        //the simpleStorageArray[_simpleStorageIndex] will give an address of a particular index
        //i.e it will store a SimpleStorage contract of a particular address
        SimpleStorage simpleStorage = SimpleStorage(simpleStorageArray[_simpleStorageIndex]);  
    }
}


//or we can simply modify the line 23 to : 

//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;

import "./SimpleStorage.sol";

contract StorageFactory{
    SimpleStorage[] public simpleStorageArray;

    function createSimpleStorageContract() public {
        SimpleStorage simpleStorage = new SimpleStorage();
        simpleStorageArray.push(simpleStorage);
    }

    function sfStore(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber) public{
        //here we are saving the contract object's address(present in the array) in the simpleStorage variable
        SimpleStorage simpleStorage = simpleStorageArray[_simpleStorageIndex];      //simpleStorage contract object
        //calling the store function on the simpleStorage contract
        simpleStorage.store(_simpleStorageNumber);  //storing the number
        
        //same as simpleStorageArray[_simpleStorageIndex].store(_simpleStorageNumber);
    }
    //this function will get the number that is stored at a particular index using sfStore
    //NOTE : sfStore means SimpleFactory store and sfGet means SimpleFactory get
    
    function sfGet(uint256 _simpleStorageIndex) public view returns(uint256){           //takes an index and returns an uint256 present at that index
        SimpleStorage simpleStorage = simpleStorageArray[_simpleStorageIndex];
        return simpleStorage.retrieve();                                        //calling the retrieve function present in SimpleStorage.sol
        //same as return simpleStorageArray[_simpleStorageIndex].retrieve();
    }
}




                                //SimpleStorage.sol 
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;  

contract SimpleStorage{
    uint256 public favoriteNumber;
    
    function store(uint256 _favoriteNumber) public{
        favoriteNumber = _favoriteNumber;
    }
    function retrieve() public view returns(uint256){
        return favoriteNumber;
    }
}


                                
