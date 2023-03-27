//to call the main function in hardhat, we need to run the following code :

main()
  .then(() => process.exit(0))
  .catch((error) => {
      console.log(error);
      process.exit(1);
  })
