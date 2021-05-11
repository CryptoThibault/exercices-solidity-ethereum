// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract TheOne {
    uint256 private _nb = 1;

    function one() public view returns (uint256) {
        return _nb;
    }
}
