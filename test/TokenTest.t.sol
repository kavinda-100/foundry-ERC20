// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {Test} from "forge-std/Test.sol";
import {DeployToken} from "../script/DeployToken.s.sol";
import {OpenZeppelinToken} from "../src/OpenZeppelinToken.sol";

contract TokenTest is Test {
    // Define the initial supply of the token (1 million tokens with 18 decimals)
    // 1 million tokens = 1,000,000 * 10^18 = 1,000,000 * 1 ether
    uint256 constant INITIAL_SUPPLY = 1000000 ether; // 1 million tokens
    OpenZeppelinToken public token; // The token contract instance
    address bob = makeAddr("bob"); // Test account 1
    address alice = makeAddr("alice"); // Test account 2
    uint256 constant STARTING_BALANCE = 100 ether; // Initial balance for bob
    uint256 constant TRANSFER_AMOUNT = 10 ether; // Amount to transfer for bob and alice

    function setUp() public {
        DeployToken deployer = new DeployToken();
        token = deployer.run();

        // Set up the test accounts
        vm.prank(msg.sender); // Set the sender to the deployer
        // Transfer some tokens to the test accounts
        token.transfer(bob, STARTING_BALANCE); // Transfer 100 tokens from me to bob
    }

    /**
     * @dev Test the initial supply of the token.
     */
    function testInitialSupply() public view {
        // Check the initial supply of the token
        assertEq(
            token.totalSupply(),
            INITIAL_SUPPLY,
            "Initial supply should be 1 million tokens"
        );
    }

    /**
     * @dev Test the transfer of tokens from one account to another.
     */
    function testBobBalance() public view {
        // Check bob's balance
        assertEq(
            token.balanceOf(bob),
            STARTING_BALANCE,
            "Bob's balance should be 100 tokens/ethers"
        );
    }

    /**
     * @dev Test the transfer of tokens from bob to alice.
     */
    function testTransferFromBobYoAlice() public {
        // Transfer tokens from bob to alice
        vm.startPrank(bob); // Set the sender to bob
        token.transfer(alice, TRANSFER_AMOUNT); // Transfer 10 tokens from bob to alice
        vm.stopPrank(); // Stop the prank

        assertEq(
            token.balanceOf(alice),
            TRANSFER_AMOUNT,
            "Alice's balance should be 10 tokens"
        );
        assertEq(
            token.balanceOf(bob),
            STARTING_BALANCE - TRANSFER_AMOUNT,
            "Bob's balance should be 90 tokens"
        );
    }

    /**
     * @dev Test the Allowance and approval of tokens.
     */
    function testAllowanceWork() public {
        // Set up the allowance for bob to spend tokens on behalf of alice
        vm.startPrank(bob); // Set the sender to bob
        token.approve(alice, TRANSFER_AMOUNT); // Approve alice to spend 10 tokens on behalf of bob

        uint256 aliceTransferAmount = 5 ether; // Amount to transfer from bob to alice
        vm.startPrank(alice); // Set the sender to alice
        token.transferFrom(bob, alice, aliceTransferAmount); // Transfer 10 tokens from bob to alice

        vm.stopPrank(); // Stop the prank

        // Check the allowance for bob to spend tokens on behalf of alice
        assertEq(
            token.balanceOf(alice),
            aliceTransferAmount,
            "Alice's balance should be 5 tokens"
        );
        assertEq(
            token.balanceOf(bob),
            STARTING_BALANCE - aliceTransferAmount,
            "Bob's balance should be 95 tokens"
        );
    }
}
