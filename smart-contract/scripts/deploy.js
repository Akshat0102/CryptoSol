const { ethers } = require("hardhat");

async function main(){

  const WhitelistContract = await ethers.getContractFactory("Whitelist");

  //here we deploy our contract with max number of whitelist account allowed initialized
  const deployedContract = await WhitelistContract.deploy(15);

  //wait for the contract to get deployed
  await deployedContract.deployed();

  //contract deployed to address = 0x6d7064eDB262B56d3F7d312a6D0A7e041B428e78
  console.log("Deployed the Whitelist Contract at address : ", deployedContract.address);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });