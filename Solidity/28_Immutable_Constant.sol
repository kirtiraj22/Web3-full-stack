//There are two keywords which we can use to make a variable constant throughout our contract
//1) constant
//2) immutable


//1) constant : we can use the keyword constant for our variable
//the value has to be constant at the compile time
//it has to be assigned where the variable is declared 
//Naming convention : it is advised to use capital letters with an underscore
//for eg : 

uint256 public constant MINIMUM_USD = 50 * 1e18;

//this can help to save some gas while deploying 


//2) immutable
//it is also same as constant keyword
//values of immutable variables can be set inside the constructor but cannot be modified afterwards
//these variables are declared first and later initialized inside the constructor
//Naming convention : it is advised to use i_ before the name of the variable(to differentiate it with constant variable)
//i.e i_variableName;
//for eg :

address public immutable i_owner;
constructor(){
  i_owner = msg.sender;
}
