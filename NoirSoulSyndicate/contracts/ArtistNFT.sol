// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract ArtistNFT is ERC721, Ownable {
    uint256 public constant TOTAL_SUPPLY = 500;
    uint256 public constant ROYALTY_SHARES = 5000;
    IERC20 public noirCoin;

    mapping(uint256 => uint256) public royalties; // Mapping to track royalties for each token

    constructor(string memory name, string memory symbol, address _noirCoin) ERC721(name, symbol) {
        noirCoin = IERC20(_noirCoin);
    }

    // Mint function
    function mint(address to, uint256 tokenId) external onlyOwner {
        require(totalSupply() < TOTAL_SUPPLY, "All tokens have been minted");
        _safeMint(to, tokenId);
        royalties[tokenId] = ROYALTY_SHARES / TOTAL_SUPPLY; // Assigning equal royalty shares to each token
    }

    // Mint with Noir Coin
    function mintWithNoirCoin(address to, uint256 tokenId, uint256 noirAmount) external {
        require(totalSupply() < TOTAL_SUPPLY, "All tokens have been minted");
        require(noirCoin.transferFrom(msg.sender, address(this), noirAmount), "Noir Coin transfer failed");
        _safeMint(to, tokenId);
        royalties[tokenId] = ROYALTY_SHARES / TOTAL_SUPPLY; // Assigning equal royalty shares to each token
        // Add special rewards logic here
    }

    // Distribute royalties
    function distributeRoyalties(uint256 tokenId, uint256 amount) external {
        require(ownerOf(tokenId) == msg.sender, "You are not the owner of this token");
        require(amount > 0, "Amount should be greater than zero");
        // Distribute royalties to token holders
        require(noirCoin.transfer(msg.sender, amount), "Royalties transfer failed");
    }
}
