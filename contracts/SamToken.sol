// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "erc721a/contracts/ERC721A.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract SamToken is ERC721A, Ownable {
    constructor() Ownable(msg.sender) ERC721A("SamToken", "STN") {}

    uint256 private limit = 5;
    string[] private descriptions = [
        "Cheetah as iron man, cartoon, art",
        "Lion as captain america, digital art",
        "Bear holding thor's hammer, cartoon",
        "Full robotic body with wolf head on Ultron, digital art, city background",
        "Panther potrayed as Black Panther of Avengers, digital art"
    ];
    mapping(uint256 => string) private _tokenURIs;

    function _baseURI() internal pure override returns (string memory) {
        return "QmXXctBGz25FbKUuPDXaZLSkdnrcDuA66rLFz9vE4WZRaF";
    }

    function tokenURI(
        uint256 tokenId
    ) public view virtual override returns (string memory) {
        if (!_exists(tokenId)) revert("No Token Exists");

        string memory baseURI = _baseURI();
        string memory tokenIdStr = _toString(tokenId);
        string memory extension = ".jpg";
        return
            bytes(baseURI).length != 0
                ? string(abi.encodePacked(baseURI, "/", tokenIdStr, extension))
                : "";
    }

    function mint(address reciever, uint256 quantity) external onlyOwner {
        require(reciever != address(0), "Invalid Address");
        require(totalSupply() < limit, "Maximum NFT Minted");
        _safeMint(reciever, quantity);
    }

    function prompt(uint256 tokenId) public view returns (string memory) {
        return descriptions[tokenId];
    }
}
