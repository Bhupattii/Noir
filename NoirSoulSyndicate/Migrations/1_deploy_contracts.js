const ArtistNFT = artifacts.require("ArtistNFT");
const VelvetDreamsNFT = artifacts.require("VelvetDreamsNFT");
const MidnightMelodiesNFT = artifacts.require("MidnightMelodiesNFT");

module.exports = function (deployer) {
  const noirCoinAddress = "0xYourNoirCoinContractAddress"; // Replace with actual Noir Coin contract address

  deployer.deploy(ArtistNFT, "Phoenix Flow®", "PFNFT", noirCoinAddress);
  deployer.deploy(ArtistNFT, "Aria Harmony®", "AHNFT", noirCoinAddress);
  deployer.deploy(ArtistNFT, "Ava Rain®", "ARNFT", noirCoinAddress);

  deployer.deploy(VelvetDreamsNFT, noirCoinAddress);
  deployer.deploy(MidnightMelodiesNFT, noirCoinAddress);
};
