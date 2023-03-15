//we can make our own data type by creating a struct

//syntax of a struct is :
struct structName {
  dataType variable1;
  dataType variable2;
  ....
}

//for eg : 
struct People{
 uint256 favoriteNumber;
 string name;
}

//making a variable of the data type that we made (without using array)

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;  

contract SimpleStorage{
    uint256 public favoriteNumber;
    People public person = People({favoriteNumber: 2, name:"kirtiraj"});    //here we are declaring a variable person of datatype People(which we made using struct)

    struct People{
        uint256 favoriteNumber;
        string name;
    }
}


//ARRAYS : It is a data structure that can store multiple data of the similar type,
//SYNTAX : 
dataType[] access_specifier arrayName;
eg : uint256 public names;

//Making a variable of the type People using array : 
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;  

contract SimpleStorage{
    uint256 public favoriteNumber;
    
    struct People{
        uint256 favoriteNumber;
        string name;
    }

    People[] public person;         //Here we are making an array named as person which will store data of the type People.

    function store(u int256 _favoriteNumber) public{
        favoriteNumber = _favoriteNumber;
    }
}

