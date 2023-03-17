//we can directly import files from github or npm package to our contract

//for example if the user wants to import the files that shows price feeds (provided by Chainlink),
//we can directly import it using its github path
//for example :

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

//the above line imports the interface named as AggregatorV3Interface from the github repo or npm 
