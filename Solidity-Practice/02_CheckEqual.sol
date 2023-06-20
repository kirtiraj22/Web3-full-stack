//SPDX-License-Identifier: MIT
pragma solidity ^0.8.16;

contract Practice{
    function checkEqual(bytes memory str1, bytes memory str2) public pure returns(bool){
        if(keccak256(abi.encodePacked(str1)) == keccak256(abi.encodePacked(str2))){
            return true;
        }
        return false;
    }
    
}   

//Q2) check whether 2 strings are equal or not. if equal return true

//The expression keccak256(abi.encodePacked(str1)) performs a cryptographic hash function called Keccak-256 on the packed representation of str1.

//The abi.encodePacked function takes the value of str1 and converts it into a tightly packed byte array.
//This means it takes the characters or bytes of str1 and puts them together in a specific order without adding any extra space or information.

//keccak256(...): This is the Keccak-256 hash function. Keccak-256 is a cryptographic hash algorithm that takes an input and produces a fixed-size (256-bit or 32-byte) hash output. 
//It is commonly used in blockchain applications for various purposes, such as generating unique identifiers or creating secure checksums.
