// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract ManualToken {
    mapping(address => uint256) private s_balances;

    constructor() {}

    function name() public pure returns (string memory) {
        return "ManualToken";
    }

    function symbol() public pure returns (string memory) {
        return "MTK";
    }

    function decimals() public pure returns (uint8) {
        return 18;
    }

    function totalSupply() public pure returns (uint256) {
        return 1000 ether; // 1000 tokens with 18 decimals
    }

    function balanceOf(address _owner) public view returns (uint256) {
        return s_balances[_owner];
    }

    function transfer(address _to, uint256 _value) public returns (bool) {
        require(_to != address(0), "Invalid address");
        require(s_balances[msg.sender] >= _value, "Insufficient balance");

        s_balances[msg.sender] -= _value;
        s_balances[_to] += _value;

        return true;
    }
}
