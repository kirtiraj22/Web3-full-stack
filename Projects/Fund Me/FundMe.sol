// Get funds from the users
// Withdraw the funds 
// Set a minimum funding value in USD

//SPDX-License-Identifier:MIT

pragma solidity ^0.8.8;

import "./PriceConverter.sol";

//making a custom error
error NotOwner();

contract FundMe{
    using PriceConverter for uint256;

    //setting a minimum amount in USD
    uint256 public constant MINIMUM_USD = 50 * 1e18;

    //array that keeps track of people who send money to this contract 
    address[] public funders;
    //mapping the amount of ETH sent from a particular address
    mapping(address => uint256) public addressToAmountFunded;

    //address of the owner of the contract
    address public immutable i_owner;

    //constructor 
    constructor(){
        //making the deployer as the owner of the contract 
        //this will run as soon as the contract is deployed
        i_owner = msg.sender;
    }


    //function to get funds from users
    //anybody can call this function, so it will be public
    function fund() public payable{
        //setting a minimum fund amount in USD
        // msg.value.getConversionRate();      //same as getConversionRate(msg.value);
        //msg.value is considered as the first parameter of any of these library functions
        //just because our getConversionRate() is in a library called as PriceConverter.sol,
        //msg.value will be treated as a parameter that will be passed in getConversionRate() function
        // require(getConversionRate(msg.value) >= MINIMUM_USD, "Didn't send enough!");
        require(msg.value.getConversionRate() >= MINIMUM_USD, "Didn't send enough");
        funders.push(msg.sender);           //msg.sender is the address that calls fund() function
        addressToAmountFunded[msg.sender] += msg.value;      //this will map the senders address to the amount he sends
    }

    function withdraw() public onlyOwner{ 
        for(uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++){
            //getting address of each funders in the funders array
            address funder = funders[funderIndex];
            //setting the balance at the address(funder) in funders array as 0
            //as we will withdraw the amount by doing : 
            addressToAmountFunded[funder] = 0; 
        }
        //resetting an array
        funders = new address[](0);

        //transfer ETH
        (bool callSuccess, ) = payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess, "Call failed");
    }

    modifier onlyOwner {
        // require(msg.sender == i_owner, "sender is not owner!");
        //using custom error NotOwner 
        if(msg.sender != i_owner)
            revert NotOwner();
        _;
    }


    //if someone accidentally sends money without using the fund function(by using low level transactions)
    //it will automatically call the fund() function
    //if the user don't pass any data then receive() will be executed
    //if the user passes any data or message, fallback() will be executed
    //ultimately fund() function will be executed
    receive() external payable{
        fund();
    }

    fallback() external payable{
        fund();
    }
}
