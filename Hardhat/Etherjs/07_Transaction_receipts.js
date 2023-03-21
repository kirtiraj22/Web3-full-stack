// suppose we want to wait for x block confirmations, for this we can use :
// cpnst deploymentReceipt = await contract.deployTransaction.wait(x);
//here x is the number of block we want to wait for
//x can be 1, 2 ,3 .......
//eg :

const deploymentReceipt = await contract.deployTransaction.wait(1);
