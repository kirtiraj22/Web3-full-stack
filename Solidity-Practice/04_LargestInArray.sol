//SPDX-License-Identifier: MIT
pragma solidity ^0.8.16;

contract Practice{
    function largest(uint256[5] calldata _arr) public pure returns(uint256){
        uint answer = _arr[0];
        for(uint256 i = 0; i < 5; i++){
            if(_arr[i] >= answer){
                answer = _arr[i];
            }
        }
        return answer;
    }
    
}   

// Q4) write a program to find largest number in an array
