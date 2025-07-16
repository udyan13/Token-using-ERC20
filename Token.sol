// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0

pragma solidity ^0.8.27;

import {AccessControl} from "@openzeppelin/contracts/access/AccessControl.sol";
import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract AkaINU is ERC20, AccessControl {
    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");

    event AkaINUpurchased(address indexed receiver, address indexed buyer);

    constructor() ERC20("AkaINU", "AIN") {
        _grantRole(DEFAULT_ADMIN_ROLE, msg.sender);
        _grantRole(MINTER_ROLE, msg.sender);
    }

    function mint(address to, uint256 amount) public onlyRole(MINTER_ROLE) {
        _mint(to, amount * 10 ** decimals());
    }

    function BuyaAkaINU() public {
        _burn(_msgSender(), 1 * 10 ** decimals());
        emit AkaINUpurchased(_msgSender(),_msgSender());
    }

    function BuyAkaINUFrom(address account) public {
        _spendAllowance(account, _msgSender(), 1 * 10 ** decimals());
        _burn(account, 1 * 10 ** decimals());
        emit AkaINUpurchased(_msgSender(),account);
    }
    function increaseAllowance(address spender, uint256 addedValue) public returns (bool) {
        address owner = _msgSender();
        _approve(owner, spender, allowance(owner, spender) + addedValue);
        return true;
    }

    function decreaseAllowance(address spender, uint256 subtractedValue) public returns (bool) {
        address owner = _msgSender();
        uint256 currentAllowance = allowance(owner, spender);
        require(currentAllowance >= subtractedValue, "ERC20: decreased allowance below zero");
        _approve(owner, spender, currentAllowance - subtractedValue);
        return true;
    }

}

