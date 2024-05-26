Noir Soul Syndicate NFT Smart Contracts
This repository contains the ERC721 smart contracts for the Noir Soul Syndicate. The contracts are designed for three music artists: Phoenix Flow®, Aria Harmony®, and Ava Rain®, as well as for two singles by Aria Harmony®: Velvet Dreams and Midnight Melodies. The NFTs will be minted on the Polygon Blockchain and have a unique feature where individuals receive special rewards if they purchase the NFTs with Noir Coin® (NOIR).

Folder Structure
NoirSoulSyndicate/
├── contracts/
│ ├── ArtistNFT.sol
│ ├── VelvetDreamsNFT.sol
│ └── MidnightMelodiesNFT.sol
├── migrations/
│ └── 1_deploy_contracts.js
├── test/
│ └── test_artist_nft.js
├── truffle-config.js
└── package.json

Getting Started
Prerequisites
Node.js
Truffle
Ganache (for local testing)
Polygon wallet and Noir Coin (NOIR) contract address

Step-by-Step Guide

Step 1: Initialize Truffle Project

1.Create Project Directory:

mkdir NoirSoulSyndicate
cd NoirSoulSyndicate

2.Initialize Truffle:
truffle init

Step 2: Install OpenZeppelin Contracts
npm install @openzeppelin/contracts

after that change the code as your requirement
the last step is:
Deploy the Contracts
Deploy the contracts to the Polygon network:
truffle migrate --network polygon
