// we can add a code to verify our transaction so that we don't need to verify it manually

// we need to add the following function outside the main function of our deploy.js file

async function verify(contractAddress, args) {
  console.log("verifying contract...");
  
  try{
    await run("verify:verify", {
      address: contractAddress,
      constructorArguments: args,
    });
  } catch(e) {
    if(e.message.toLowerCase().includes("already verified")){
      console.log("already verified...");
    } else{
        console.log(e);
      }
  }
}
