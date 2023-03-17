//To set a minimum ETH value a user must send, 
//i.e if we want the user to send any amount above 1 ETH, we use :

require(msg.value > 1e18);

//here require is the keyword that checks if certain condition is fullfilled or not
//1e18 means 1 * 10^18 wei 
//as we know that 1 ETH = 1 * 10^18 wei
//NOTE : all the transactions occurs in terms of wei, so we need to modify the amount accordingly

//msg.value > 1e18 means that the amount the user is sending must be more than 1 ETH


//Now what if the user send some amount less that 1 ETH, for that we need to display an error message 
//this can be done by :

require(msg.value > 1e18 , "Didn't send amount greater than 1 ETH");

//so if the msg.value > 1e18 condition is false , the message part will be executed
