// Get funds from the users
// Withdraw the funds 
// Set a minimum funding value in USD

//SPDX-License-Identifier:MIT

pragma solidity ^0.8.8;

//importing aggregatirV3 interface from chainlink's github repository to get price feeds
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract FundMe{

    //setting a minimum amount in USD
    uint256 minimumUsd = 50 * 1e18;

    //function to get funds from users
    //anybody can call this function, so it will be public
    function fund() public payable{
        //setting a minimum fund amount in USD
        require(getConversionRate(msg.value) >= minimumUsd, "Didn't send enough!");
    }

    //function to get the prices of ethereum, avalanche, or any other layer one blockchain(in USD)
    //using chainlink data feeds
    function getPrice() public view returns(uint256){
        // we need ABI and address of the contract(the contract that contains price feeds)
        // Address : 0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e

        //initializing an interface object named priceFeed that uses AggregatorV3Interface
        //and connects specifically to a proxy aggregator contract that is already deployed at
        //0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e
        //The interface allows our contract to run functions on that deployed aggregator contract.
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e);
        // (uint80 roundId, int price, uint startedAt, uint timeStamp, uint80 answeredInRound) = priceFeed.latestRoundData();
        (,int256 price,,,) = priceFeed.latestRoundData();          //we only need price
        //price of ETH in terms of USD
        
        return uint256(price * 1e10);        
        
        //because price will have 8 decimal places and msg.value have 18 decimal places
        //so making our price and msg.value's decimal place equal
    }

    function getConversionRate(uint256 ethAmount) public view returns (uint256) {
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18;

        return ethAmountInUsd;
    }

    // function withdraw(){}
}
