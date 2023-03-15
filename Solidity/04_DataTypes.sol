// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;  

//there are 5 most basic data types 
// uint , boolean , int, address, bytes
//uint : means unsigned integer (we can define the bits from 8 to 256 eg uint256 can have 256 bits)
//boolean : means true or false
//int : means integer(can be a positive or negative whole number)
//address : This specifies the address(for eg our metamask address)
//bytes : they are dynamically sized byte array

contract SimpleStorage{
    bool hasCar = true;
    uint totalCars = 1;     //if we dont specify the no. of bits, then it will automatically assume it as uint256
    string carName = "BMW";  //strings represents words (we need to use them inside quotes)
    int256 favoriteInt = -23;  //we can take negative values in int
    address myAddress = 0x5BB1f33f5eB0Ad8e07FE6A32CeBDf4B6328F3594; //any address starts with 0x
    bytes32 favoriteBytes = "Cat";  //cat gets automatically converted to bytes 
}

//for uint and int the range is from 8 to 256 bits
//for bytes the range is from bytes1 to bytes32 (bytes1 represents 1 byte and bytes32 represents 32 bytes)
