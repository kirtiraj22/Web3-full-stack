//we can add or rather insert values in our array using the push
//syntax : 
arrayName.push(data);

//for example : 

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;  

contract SimpleStorage{
    uint256 public favoriteNumber;
    
    struct People{
        uint256 favoriteNumber;
        string name;
    }

    People[] public person;

    function store(uint256 _favoriteNumber) public{
        favoriteNumber = _favoriteNumber;
    }
    
    function addPerson(string memory _name, uint256 _favoriteNumber) public{      //through this function we will add values to our array of type People
        person.push(People(_favoriteNumber, _name));
    }
}


//METHOD 2 : 
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;  

contract SimpleStorage{
    uint256 public favoriteNumber;
    
    struct People{
        uint256 favoriteNumber;
        string name;
    }

    People[] public person;

    function store(uint256 _favoriteNumber) public{
        favoriteNumber = _favoriteNumber;
    }
    
    function addPerson(string memory _name, uint256 _favoriteNumber) public{      //through this function we will add values to our array of type People
        People memory newPerson = People({favoriteNumber: _favoriteNumber, name: _name});
        //People memory newPerson = People({_favoriteNumber,_name});              //this is also valid
        person.push(newPerson);
    }
}
