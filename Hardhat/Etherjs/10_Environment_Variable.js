// we aren't suppossed to share our private key with anyone
// but if we want to use our private key in our code, we can use it without revealing it
// this can be done using environment variables

// step 1) install dotenv package using : yarn add dotenv
// step 2) make a file named as .env
// step 3) add your private key in .env file :
PRIVATE_KEY = 53945.........

//step 4) include the private key using the following code in your etherjs file:
require('dotenv').config();
// NOTE : we need to use process.env.PRIVATE_KEY to access our private key in our etherjs file,
const wallet = new ethers.Wallet(process.env.PRIVATE_KEY, provider);
