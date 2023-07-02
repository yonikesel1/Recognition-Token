// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {DeployToken} from "../script/DeployToken.s.sol";
import {RecognitionToken} from "../src/RecognitionToken.sol";
import {Test, console} from "forge-std/Test.sol";

contract RecognitionTokenTest is Test {

    RecognitionToken public recognitionToken;
    DeployToken public deployer;

    address public user1 = makeAddr("user1");
    address public user2 = makeAddr("user2");

    uint256 public constant STARTING_BALANCE = 100 ether;

    function setUp() external {
        deployer = new DeployToken();
        recognitionToken = deployer.run();

        vm.prank(msg.sender);
        recognitionToken.transfer(user1, STARTING_BALANCE);
    }

    function testUser1StartingBalance() external {
        assertEq(recognitionToken.balanceOf(user1), STARTING_BALANCE);
    }

    function testAllowencesWorks() external {
        uint256 initialAllownce = 1000;

        vm.prank(user1);
        recognitionToken.approve(user2, initialAllownce);

        uint256 transferAmount = 500;

        vm.prank(user2);
        recognitionToken.transferFrom(user1, user2, transferAmount);

        assertEq(recognitionToken.balanceOf(user2), transferAmount);
    }
}
