//SPDX-License-Identifier: MIT
pragma solidity ^0.8.16;

contract Practice{
    function concatenation(bytes memory _str1, bytes memory _str2) public pure returns(string memory){
        bytes memory answer = bytes.concat(_str1,_str2);    //will return bytes
        return string(answer);
    }
    
}   

