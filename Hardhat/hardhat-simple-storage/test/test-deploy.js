//basic test for simpleStorage contract
const { ethers } = require("hardhat");
const { expect, assert } = require("chai");
//describe is a keyword that hardhat and mocha(javascript test framework) wil recognize
//describe function takes 2 parameters : string and a function
// inside our describe function, we will have a beforeEach() and a bunch of it()
// beforeEach() will tell us what to do before every it()
// it() will contain the code for running our tests
// we can also have describe() inside the describe() [nested describe]

describe("SimpleStorage", () => {
  let simpleStorageFactory, simpleStorage;
  beforeEach(async function () {
    //this code will run before every it() present in this file
    simpleStorageFactory = await ethers.getContractFactory("SimpleStorage");
    simpleStorage = await simpleStorageFactory.deploy();
  });

  it("Should start with a favorite number of 0", async function () {
    const currentValue = await simpleStorage.retrieve();
    const expectedValue = "0";
    // check whether the currentValue is equal to the expectedValue
    // to do this we can use either assert keyword or expect keyword
    // to use them we need to import a package called "Chai"
    assert.equal(currentValue.toString(), expectedValue);

    //if we want to use expect, we can use it using :
    // expect(currentValue.toString()).to.equal(expectedValue);
  });

  it("should update when we call store", async function () {
    const expectedValue = "7";
    const transactionResponse = await simpleStorage.store(expectedValue);
    await transactionResponse.wait(1);

    const currentValue = await simpleStorage.retrieve();
    assert.equal(currentValue.toString(), expectedValue);
  });
});
