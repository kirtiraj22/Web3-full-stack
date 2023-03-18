//there are three different ways to send any native crypto currencies
//1)Transfer
//2)send
//3)call

//1) transfer : 

payable(msg.sender).transfer(address(this).balance);

//NOTE : msg.sender is of type address
//whereas payable(msg.sender) is of type payable address
//the ethereum will be transfered to the msg.sender address from the smart contracts address
//PROBLEM with TRANSFER : if the payment fails, it will throw an error and revert the transaction


//2) send : 

bool sendSuccess = payable(msg.sender).send(address(this).balance);
require(sendSuccess, "Send Failed");

//so the send method will return a boolean and it will be stored in sendSuccess variable
//later we can check if the variable's value is true or false using require
//and if it is false then the "Send Failed" will be shown 

//3) call : 
//call is a low level function which call also be used to interact with other contracts without getting their ABI

(bool callSuccess, bytes dataReturned) = payable(msg.sender).call{value: address(this).balance}("");
require(callSuccess, "Call failed");

//NOTE : call function returns two variables (a boolean and a bytes object)
//since call allows us to call other functions and if the function returns some data or some value,that data will be stored in variable dataReturned of type bytes
//it also returns a boolean (it will be stored in callSuccess), it will return true if the function is successfully called else it will return false
//later the callSuccess will be checked it is is true or false using require
