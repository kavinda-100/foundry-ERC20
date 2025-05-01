// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract OpenZeppelinToken is ERC20 {
    constructor(uint256 _initialSupply) ERC20("OpenZeppelinToken", "OZT") {
        _mint(msg.sender, _initialSupply);
    }
}
