// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {Test} from "forge-std/Test.sol";
import {DeployToken} from "../script/DeployToken.s.sol";

contract TokenTest is Test {
    // Define the initial supply of the token (1 million tokens with 18 decimals)
    // 1 million tokens = 1,000,000 * 10^18 = 1,000,000 * 1 ether
    uint256 constant INITIAL_SUPPLY = 1000000 ether; // 1 million tokens

    function setUp() public {
        // This function is called before each test function in the contract.
        // You can use it to set up any state or variables needed for your tests.
    }
}
