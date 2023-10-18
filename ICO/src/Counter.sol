// contracts/GLDToken.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract QToken is ERC20 {
    constructor() ERC20("Qtoken", "Q") {
        _mint(msg.sender, 10000);
    }
}