// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {Script} from "forge-std/Script.sol";
import {OpenZeppelinToken} from "../src/OpenZeppelinToken.sol";

contract DeployToken is Script {
    // Define the initial supply of the token (1 million tokens with 18 decimals)
    // 1 million tokens = 1,000,000 * 10^18 = 1,000,000 * 1 ether
    uint256 constant INITIAL_SUPPLY = 1000000 ether; // 1 million tokens

    function run() external {
        vm.startBroadcast();
        // Deploy the OpenZeppelinToken contract with an initial supply of 1 million tokens
        new OpenZeppelinToken(INITIAL_SUPPLY);
        vm.stopBroadcast();
    }
}
