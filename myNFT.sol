// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract MyNFT is ERC721 {
    using Strings for uint256;
    string public baseURI = "https://github.com/HoLamBaoKhuyen/nft-demo/blob/main/";

    constructor() ERC721("NFT Demo", "NFTD") {

    }

    // https://github.com/HoLamBaoKhuyen/nft-demo/blob/main/1.json
    function tokenURI(uint256 tokenId) public view virtual override returns (string memory) {
        require(_exists(tokenId), "ERC721Metadata: URI query for nonexistent token");

        string memory buri = baseURI;
        return bytes(buri).length > 0
            ? string(abi.encodePacked(buri, tokenId.toString(), ".json"))
            : '';
    }

    function mint(address to, uint256 tokenId)  external {
        _mint(to, tokenId);
    }

}