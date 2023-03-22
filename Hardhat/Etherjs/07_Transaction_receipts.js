// suppose we want to wait for x block confirmations, for this we can use :
// cpnst deploymentReceipt = await contract.deployTransaction.wait(x);
//here x is the number of block we want to wait for
//x can be 1, 2 ,3 .......
//eg :

const deploymentReceipt = await contract.deployTransaction.wait(1);


//NOTE : we only get transaction receipt if we wait for the block confirmation otherwise we get contract object which
//has the deployTransaction with it 

//i.e :

contract.deployTransaction  // it will give the contract object (transaction response and not receipt)

contract.deployTransaction.wait(1)  //this will give transaction receipt
