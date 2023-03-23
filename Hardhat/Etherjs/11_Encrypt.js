//we can improve the security of our private key further by encrypting our private key 
//i.e we can make a file named as encryptKey.js 
// if we use encryptKey.js, we dont need to store any sensitive information in our .env file
//we need exact same setup that we used in the deploy.js file 

                      encrypt.js

const ethers = require("ethers");
const fs = require("fs-extra");
require("dotenv").config();

async function main() {
  const wallet = new ethers.Wallet(process.env.PRIVATE_KEY);
  //creating an encrypted key using our password and private key
  const encryptedJsonKey = await wallet.encrypt(
    process.env.PRIVATE_KEY_PASSWORD,
    process.env.PRIVATE_KEY
  );
  console.log(encryptedJsonKey);
  //to save the file to a new file called .encryptedKey.json and passing the encrypted key that we made
  fs.writeFileSync("./.encryptedKey.json", encryptedJsonKey);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.log(error);
    process.exit(1);
  });



// now we need to run this code and we will get a file named as .encryptedKey.json
// and we can remove the private key and password from the .env file after running this code for the first time

//NOTE : we need to make some changes to the deploy.js file 
// because now we will be getting the private key from the .encrypted.json file instead of the .env file 
// so we need to add these lines :
                                      deploy.js
//this line will read the data from the .encryptedKey.json
const encryptedJson = fs.readFileSync("./.encryptedKey.json", "utf8");
let wallet = new ethers.Wallet.fromEncryptedJsonSync(
    encryptedJson,
    process.env.PRIVATE_KEY_PASSWORD
  )



// NOTE : to run deploy.js, we need to use the following command :
PRIVATE_KEY_PASSWORD=passwordofprivatekey node deploy.js
