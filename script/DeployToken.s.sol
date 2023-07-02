// SPDX-License-Identifier: MIT

import {Script} from "forge-std/Script.sol";
import {RecognitionToken} from "../src/RecognitionToken.sol";

pragma solidity ^0.8.18;

contract DeployToken is Script {
    uint256 public constant INITIAL_SUPPLY = 1000000 ether;
    function run() external returns (RecognitionToken) {

        vm.startBroadcast();
        RecognitionToken recToken = new RecognitionToken(INITIAL_SUPPLY);
        vm.stopBroadcast();

        return recToken;
    }
}
