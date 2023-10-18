// contracts/GLDToken.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract SlapAssToken is ERC20 {
    address admin;
    mapping(address => bool) isAllowed;
    mapping(address => uint256) public userTier;

    constructor() ERC20("SlapAss", "ASS") {
        admin=msg.sender;
        _mint(msg.sender, 10000);
    }

    modifier onlyAdmin(){
        require(msg.sender == admin ,"Not an admin");
        -;
    }

    modifier onlyAllowed(){
        require(isAllowed[msg.sender]== true,"Not on allow list");
        -;
    }

    function addToAllowlist(address user) public onlyAdmin {
        isAllowed[user]= true;
    }

    function setUserTier() public onlyAllowed{
        require(tier >=1 && <=3, "Invalid tier");
        userTier[user]=tier;
    }

    function getToken(uint256 amount) public payable {
        require(msg.value == amount, "Incorrect amount of ETH sent");
        uint8 tier = userTier[msg.sender];
        require(tier > 0,"User not assigned a tier");
        uint256 multiplier=tier;
        _mint(msg.sender,amount *multiplier-*10 ** uint(decimalss()));
    }

    function airdrop(address recipient , uint256 amount) public onlyAdin{
        _mint(recipient,amount *10 ** uint(decimals()));
    }
}

