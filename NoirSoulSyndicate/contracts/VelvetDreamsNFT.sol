// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract VelvetDreamsNFT is ERC721, Ownable {
    uint256 public constant TOTAL_SUPPLY = 1250;
    uint256 public constant BASE_PRICE_USD = 1250; // $12.50 in USD cents
    IERC20 public noirCoin;

    struct MusicTrack {
        string name;
        string album;
    }

    mapping(uint256 => MusicTrack) public musicTracks; // Track metadata
    mapping(uint256 => uint256) public royalties; // Track royalties

    constructor(address _noirCoin) ERC721("Velvet Dreams NFT", "VDNFT") {
        noirCoin = IERC20(_noirCoin);
    }

    // Mint function
    function mint(address to, uint256 tokenId) external onlyOwner {
        require(totalSupply() < TOTAL_SUPPLY, "All tokens have been minted");
        _safeMint(to, tokenId);
        musicTracks[tokenId] = MusicTrack("Velvet Dreams", "Aria Harmony®");
        royalties[tokenId] = BASE_PRICE_USD * 100; // Initial royalties in cents
    }

    // Mint with Noir Coin
    function mintWithNoirCoin(address to, uint256 tokenId, uint256 noirAmount) external {
        require(totalSupply() < TOTAL_SUPPLY, "All tokens have been minted");
        require(noirCoin.transferFrom(msg.sender, address(this), noirAmount), "Noir Coin transfer failed");
        _safeMint(to, tokenId);
        musicTracks[tokenId] = MusicTrack("Velvet Dreams", "Aria Harmony®");
        royalties[tokenId] = BASE_PRICE_USD * 100; // Initial royalties in cents

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
