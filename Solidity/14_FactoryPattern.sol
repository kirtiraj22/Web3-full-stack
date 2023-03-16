//suppose we have two different contracts in two different files : 

                                  //SimpleStorage.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;  

contract SimpleStorage{
    uint256 public favoriteNumber;
    
    mapping(string => uint256) public nameToFavoriteNumber;

    struct People{
        uint256 favoriteNumber;
        string name;
    }

    People[] public person;

    function store(uint256 _favoriteNumber) public{
        favoriteNumber = _favoriteNumber;
    }
    function retrieve() public view returns(uint256){
        return favoriteNumber;
    }

    function addPerson(string memory _name, uint256 _favoriteNumber) public{
        // People memory newPerson = People({_favoriteNumber,_name});
        // person.push(newPerson);
        person.push(People(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }
}



                                          //StorageFactory.sol
//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;

//we can import simpleStorage.sol to this file using : 
import "./SimpleStorage.sol";

contract StorageFactory{
    SimpleStorage public simpleStorage;                    //making a variable simpleStorage of the type SimpleStorage(that we made in SimpleStorage.sol file)

    //function to deploy simpleStorage contract : 
    function createSimpleStorageContract() public {
        //A contract can create other contracts using the new keyword
        simpleStorage = new SimpleStorage();
    }
}

//if we have our contracts in two different files, then we can have different versions of solidity for both of them
//eg : StorageFactory.sol has version ^0.8.0 while SimpleStorage.sol has version ^0.8.8
//NOTE : if StorageFactory has a version of ^0.7.0 then we will get error while compiling


//CODE EXPLANATION OF StorageFactory.sol 
//so the function createSimpleStorage will create a new instance of SimpleStorage contract and store it in the variable simpleStorage 
//Note SimpleStorage and simpleStorage both are different (SimpleStorage is a file consisting of a contract and simpleStorage is a variable  which will contain an instance of SimpleStorage contract(

//here everytime we call the function createSimpleStorageContract(), it will overwrite the simpleStorage variable to create a new contract
//so instead we can create an array of contracts using SimpleStorage[] public simpleStorageArray;  (in line 44)
//so simpleStorageArray will have a list of all our deployed SimpleStorage contracts

//so our code will look like : 
//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;

import "./SimpleStorage.sol";

contract StorageFactory{  
    SimpleStorage[] public simpleStorageArray;      //creating an array simpleStorageArray of type SimpleStorage
    function createSimpleStorageContract() public {
        SimpleStorage simpleStorage = new SimpleStorage();    //creating a variable simpleStorage that will have an instance of SimpleStorage contract
        simpleStorageArray.push(simpleStorage);             //finally pushing the instance to the simpleStorageArray
    }
}



