// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract CheckOdd {
    uint256 private _check = 2;

    function check(uint256 _nb) public view returns (bool) {
        return _nb % _check != 0;
    }
}
