# NFT Bridge

This repository demonstrates how to create NFTs based on ERC721 standards and how to bridge NFTs from Ethereum (ETH) to Polygon (Matic). The core contract is an ERC721A contract which is an extension of ERC721 smart contract named `SamToken` that allows you to mint NFTs on Ethereum and Polygon networks.

---

## Technologies Used

- **Solidity:** The smart contract language used to write the SamToken ERC721 contract.
- **Hardhat:** A development environment to compile, deploy, and test smart contracts.
- **IPFS:** A decentralized storage system used to host NFT images.
- **FxPortal:** A protocol that facilitates interoperability between different blockchain networks. It provides the infrastructure to bridge assets between Ethereum and Polygon.
- **DALL-E** DALL-E is a cutting-edge AI model developed by OpenAI that can generate images from textual descriptions. In this project, DALL-E was used to generate the NFT images hosted on IPFS.

---

## Steps to Mint and Bridge NFTs

0. Download or clone the project and run `npm install` to install all the required dependencies.

1. **Mint NFTs:** Deploy the SamToken contract to the Goerli Ethereum testnet
   using `npx hardhat run scripts/deploy.js --network goerli` and mint NFTs using the `npx hardhat run scripts/mint.js --network goerli` command. You can specify the number of NFTs that will be minted for an address by modifying the `noOfNFTs` variable inside "mint.js" script.

2. **Upload Images to IPFS:** You can use [Pinata](https://www.pinata.cloud/) to upload your folder containing NFT images to IPFS and get the _baseURI_ of your IPFS directory.

3. **Approve and Deposit:** Approve and deposit your NFTs to the Polygon network using the FxERC721RootTunnel contract. Use `npx hardhat run scripts/approveDeposit.js --network goerli` for this process.

4. **Wait for Completion:** Allow some time (approximately 20-30 minutes) for the tokens to appear on your Polygon account after depositing them.
   You can learn more about how fxportal works here : [how fx-portal works](https://wiki.polygon.technology/docs/pos/design/bridge/l1-l2-communication/fx-portal/#how-does-it-work)

5. **Check Balance:** To verify the successful bridging of NFTs, use `npx hardhat run scripts/getBalance.js --network mumbai` to check the number of NFTs associated with an address on Polygon.

---

## Accessing Image Descriptions

To explore the textual descriptions associated with each NFT image, you can utilize the `npx hardhat run scripts/prompt.js --network goerli` command after deploying the SamToken contract.

---

## Accessing NFT Details

After successfully minting the NFTs using the SamToken contract, you can easily access the details of each NFT using the `npx hardhat run scripts/nftDescription.js --network goerli` command.

The script will display the following details for each NFT:

- The unique identifier of the NFT.
- The textual prompt used to generate the corresponding NFT image using DALL-E.
- The address of the owner of the NFT.
- The URI associated with the NFT.
- The public URL where the NFT image can be viewed on IPFS.

Feel free to change the `tokenId` variable inside the `nftDescription.js` script to view the details of different NFTs.
