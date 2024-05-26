const ArtistNFT = artifacts.require("ArtistNFT");

contract("ArtistNFT", (accounts) => {
  it("should mint an NFT", async () => {
    const instance = await ArtistNFT.deployed();
    await instance.mint(accounts[1], 1);
    const owner = await instance.ownerOf(1);
    assert.equal(
      owner,
      accounts[1],
      "The owner of token ID 1 should be account 1"
    );
  });

  it("should mint an NFT with Noir Coin", async () => {
    const noirCoin = await IERC20.new(); // Mock Noir Coin for testing
    const instance = await ArtistNFT.new(
      "Test Artist",
      "TANFT",
      noirCoin.address
    );
    await noirCoin.transfer(accounts[1], 1000);
    await noirCoin.approve(instance.address, 1000, { from: accounts[1] });
    await instance.mintWithNoirCoin(accounts[1], 2, 1000, {
      from: accounts[1],
    });
    const owner = await instance.ownerOf(2);
    assert.equal(
      owner,
      accounts[1],
      "The owner of token ID 2 should be account 1"
    );
  });
});
