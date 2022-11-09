// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./ERC1155.sol";

contract NFT_TOKEN is ERC1155 {
    address public owner;
    bool initialized;
    // Token name
    string private _name;

    // Token symbol 
    string private _symbol;

    uint256 private tokenId;    
 
    constructor()  ERC1155("https://oneto11.mypinata.cloud/ipfs/QmPx6kh1rKYt1WwSgimEEjL8gd4DeHvyqo59ytNVAifTid/") {}

    function mint(address to, uint256 amount, bytes memory data) public {
        require(msg.sender==owner);       
        tokenId++;     
        _mint(to, tokenId, amount, data);
    }

    function mintBatch(address to,  uint256[] memory _tokenId, uint256[] memory amount, bytes memory data) public {
        require(msg.sender==owner);
        _mintBatch(to, _tokenId, amount, data);
    }

    function setURI(string memory newuri) public {
        require(msg.sender==owner);
        _setURI(newuri); 
    }

    function initialize(string memory name_, string memory symbol_) public {
        require(!initialized,"Already Initialized!");
        initialized=true;
        _name   = name_;
        _symbol = symbol_;
        owner   = msg.sender;
    }

    /**
     * @dev See {IERC1155-name}
     */

    function name() public view returns(string memory) {
    return _name;
   }

   /**
     * @dev See {IERC1155-symbol}
     */

    function symbol() public view returns(string memory) {
    return _symbol;
   }

   /**
     * @dev See {IERC1155-totalSupply}
     */

    function totalSupply() public view returns(uint256){
        return tokenId;
    }

    /**
     * @dev See {IERC1155-burn token}
     */

    function burn(uint256 id, uint256 amount) public {
        _burn(msg.sender, id, amount);
    }

    /**
     * @dev See {IERC1155-burn token in batch}
     */

    function burn(uint256[] memory ids, uint256[] memory amounts) public {
        _burnBatch(msg.sender, ids, amounts);
    }

}