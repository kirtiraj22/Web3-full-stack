//SPDX-License-Identifier:MIT

pragma solidity ^0.8.8;

import "./PriceConverter.sol";

//making a custom error
error NotOwner();

contract FundMe {
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
    constructor() {
        i_owner = msg.sender;
    }

    function fund() public payable {
        require(
            msg.value.getConversionRate() >= MINIMUM_USD,
            "Didn't send enough"
        );
        funders.push(msg.sender); //msg.sender is the address that calls fund() function
        addressToAmountFunded[msg.sender] += msg.value; //this will map the senders address to the amount he sends
    }

    function withdraw() public onlyOwner {
        for (
            uint256 funderIndex = 0;
            funderIndex < funders.length;
            funderIndex++
        ) {
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }
        funders = new address[](0);

        (bool callSuccess, ) = payable(msg.sender).call{
            value: address(this).balance
        }("");
        require(callSuccess, "Call failed");
    }

    modifier onlyOwner() {
        if (msg.sender != i_owner) revert NotOwner();
        _;
    }

    receive() external payable {
        fund();
    }

    fallback() external payable {
        fund();
    }
}
