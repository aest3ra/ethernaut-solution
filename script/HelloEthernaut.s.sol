// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "../src/HelloEthernaut.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";

contract HelloEthernautSolution is Script {

    HelloEthernaut public helloEthernaut = HelloEthernaut(0x6Ae0462A64663c37AE4A70d1C11bcBEC9cADDaB9);

    function run() external {
        string memory password = helloEthernaut.password();
        console.log("Password : ", password);

        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        helloEthernaut.authenticate(password);
        vm.stopBroadcast();
    }
}
