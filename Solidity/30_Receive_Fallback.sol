//receive() and fallback() are special functions in solidity
// we can directly send ETH to the contract without calling any function using receive and fallback function

//1) receive() function : 
// we can send ETH to the contract using receive function 
// but we cannot send any data or message in that particular transaction(while sending ETH)
// This means that we can send ETH to our contract as long as it doesn't have any message with it
// for eg :
// NOTE : we can use this function only one time in the whole contract
// we don't need to use the keyword function 

//SPDX-License-Identifier:MIT

pragma solidity ^0.8.4;


contract Example {
  uint256 public result;
  receive() external payable {
    result = 1;
  }
}

//if we normally see the value in result(by calling it), it would be 0 by default
// but if we send some ETH to the contract (without passing any message), then result's value will change to 1


//2) fallback() function :
// It is same as receive function the only difference is that we can send a message or data 

// for eg :
//SPDX-License-Identifier:MIT

pragma solidity ^0.8.4;


contract Example {
  uint256 public result;
  fallback() external payable {
    result = 2;
  }
}

//now if we sends ETH to the contract and we pass some message or data while sending that ETH, then our fallback() function will be called
// so now our result will change to 2
