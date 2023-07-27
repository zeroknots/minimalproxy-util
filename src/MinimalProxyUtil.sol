// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "./Bytecode.sol";

library MinimalProxyUtil {
    function getImplFromProxy(address proxy) internal view returns (address) {
        bytes memory proxyCode = Bytecode.codeAt(proxy, 10, 30);
        address impl;
        assembly {
            impl := mload(add(proxyCode, 0x14))
        }
        return impl;
    }
}
