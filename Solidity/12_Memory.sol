//There are 6 places where we can store data in solidity : 
//1) Stack
//2) Memory
//3) Storage
//4) Calldata
//5) Code
//6) Logs


//Calldata and memory mean that the variable is only going to exist temporarily.
//storage holds data between function calls. each  execution of the Smart contract has access to the data previously stored on the storage area.

//memory consumes less gas then the storage, therefore it is always better to use memory for intermediate calculations and store final result in storage
//NOTE : state and local variables of structs, arrays are always stored in storage by default.
//calldata can't be modified but memory is mutable(can be modified)

//we need to specify these data locations only to array, struct and mapping. 
//but since string is nothing but array of bytes, we use data locations for strings to. 

//for eg : 
 function addPerson(string memory _name, uint256 _favoriteNumber) public{     //we use data location(memory) as _name is a string
        People memory newPerson = People({_favoriteNumber,_name});            //we use data location(memory) as People is a struct
        person.push(newPerson);
}
