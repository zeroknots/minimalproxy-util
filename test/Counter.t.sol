// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Counter.sol";

import {Clones} from "@openzeppelin/contracts/proxy/Clones.sol";

import "../src/MinimalProxyUtil.sol";

contract ClonesTest is Test {
    using MinimalProxyUtil for address;

    Counter public counter;

    function setUp() public {
        counter = new Counter();
        counter.setNumber(0);
    }

    function testClone() public {
        address clone = Clones.clone(address(counter));
        console2.log("counter address", address(counter));
        console2.log("clone address", clone);

        assertEq(clone.getImplFromProxy(), address(counter));
    }
}
