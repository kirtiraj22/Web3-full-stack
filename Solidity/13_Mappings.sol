//mapping is a data structure where a key is "mapped" to a single value (same as dictionaries in python, map in C++, object in javascript)
//in simple terms, mapping means to assign some key values to corresponding data 
//Keys should be unique 
//syntax : 
mapping(dataType1 => dataType2) public nameOfVariable;


//eg : 

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;  

contract SimpleStorage{
    uint256 public favoriteNumber;
    
    mapping(string => uint256) public nameToFavoriteNumber;         //mapping a string to a uint and naming it as nameTofavoriteNumber
    
    //so we can consider nameToFavoriteNumber as a dictionary which will have key as a string and value as uint256

    struct People{
        uint256 favoriteNumber;
        string name;
    }

    People[] public person;

    function store(uint256 _favoriteNumber) public{
        favoriteNumber = _favoriteNumber;
    }

    function addPerson(string memory _name, uint256 _favoriteNumber) public{
        person.push(People(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;              //key-value pair is added to the dictionary
    
    
    //for eg : if function receives "kirtiraj" as _name and 12 as _favoriteNumber then the dictionary nameToFavoriteNumber would be : 
    // "kirtiraj" : 12      (here string "kirtiraj" is mapped to a uint256 i.e 12)
    }
}


