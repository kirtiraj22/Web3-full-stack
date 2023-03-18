// Get funds from the users
// Withdraw the funds 
// Set a minimum funding value in USD

//SPDX-License-Identifier:MIT

pragma solidity ^0.8.8;

import "./PriceConverter.sol";

contract FundMe{
    using PriceConverter for uint256;

    //setting a minimum amount in USD
    uint256 minimumUsd = 50 * 1e18;

    //array that keeps track of people who send money to this contract 
    address[] public funders;
    //mapping the amount of ETH sent from a particular address
    mapping(address => uint256) public addressToAmountFunded;

    //function to get funds from users
    //anybody can call this function, so it will be public
    function fund() public payable{
        //setting a minimum fund amount in USD
        msg.value.getConversionRate();      //same as getConversionRate(msg.value);
        //msg.value is considered as the first parameter of any of these library functions
        //just because our getConversionRate() is in a library called as PriceConverter.sol,
        //msg.value will be treated as a parameter that will be passed in getConversionRate() function
        // require(getConversionRate(msg.value) >= minimumUsd, "Didn't send enough!");
        require(msg.value.getConversionRate() >= minimumUsd, "Didn't send enough");
        funders.push(msg.sender);           //msg.sender is the address that calls fund() function
        addressToAmountFunded[msg.sender] = msg.value;      //this will map the senders address to the amount he sends
    }


    // function withdraw(){}
}
