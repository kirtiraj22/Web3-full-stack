//SPDX-License-Identifier: MIT
pragma solidity ^0.8.16;

contract Practice{
    function searchNum(uint256[5] calldata _arr, uint256 _num) public pure returns(bool){
        for(uint256 i = 0; i < 5; i++){
            if(_arr[i] == _num){
                return true;
            }
        }
        return false;
    }
    
}   

// write a program to search for a number in array


// => calldata Arrays:
// - Usage: calldata arrays are used when you want to pass array data as function arguments, typically from an external contract or an external function call.
// - Storage: calldata arrays are read-only and represent the input data provided to a function. 
// - They are stored in the transaction's input data and are meant to be accessed for reading purposes only
