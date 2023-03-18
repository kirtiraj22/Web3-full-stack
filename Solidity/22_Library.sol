//Libraries are similar to contracts, but we can't declare any state variable and we can't send ethers 
//NOTE : all functions in library are internal

//SYNTAX : 
library LibraryName {
  //content 
}

//for example : 
//SPDX-License-Identifier:MIT

pragma solidity ^0.8.0;

//importing aggregatirV3 interface from chainlink's github repository to get price feeds
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

library PriceConverter {          //creating a library named as PriceConverter
      //function to get the prices of ethereum, avalanche, or any other layer one blockchain(in USD)
    //using chainlink data feeds
    function getPrice() internal view returns(uint256){
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

    function getVersion() internal view returns (uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e);
        return priceFeed.version();
    }

    function getConversionRate(uint256 ethAmount) internal view returns (uint256) {
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18;

        return ethAmountInUsd;
    }
}

//NOTE : all functions in this library are internal

//we can import this library in our other contracts by using :
import "./PriceConverter.sol"
//then inside our contract, we also need to mention this line :
using PriceConverter for uint256;
