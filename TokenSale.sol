// SPDX-License-Identifier: MIT

pragma solidity ^0.8.16;

abstract contract ERC20{
    function transferFrom(address _from, address _to, uint256 _value) public virtual returns (bool success);
    function decimals() public virtual view returns (uint8);
}

contract TokenSale {
    uint public TokenPriceinWei = 1 ether;

    ERC20 public token;
    address public TokenOwner;

    constructor(address _token){
        TokenOwner = msg.sender;
        token = ERC20(_token);
    }

    function purchaseAkaINU() public payable {
        require(msg.value >= TokenPriceinWei, "Not enough money sent");
        uint tokensToTransfer = msg.value / TokenPriceinWei;
        uint remainder = msg.value - tokensToTransfer * TokenPriceinWei;
        token.transferFrom(TokenOwner, msg.sender, tokensToTransfer * 10 ** token.decimals());
        payable(msg.sender).transfer(remainder);
    }
}
