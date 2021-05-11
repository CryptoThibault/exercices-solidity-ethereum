// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract PayableCalculator {
    uint256 private _price = 0.0001 ether;
    address public _owner;
    uint256 private _gain;
    uint256 public _count;

    constructor() {
        _owner = msg.sender;
    }

    function calc(
        int256 _nb1,
        uint256 _op,
        int256 _nb2
    ) public payable returns (int256) {
        require(msg.value == _price, "PayableCalculator: not the exact price");
        require(
            _op != 0 && _op <= 5,
            "PayableCalculator: not a valid opperator"
        );
        _gain += msg.value;
        if (_op == 1) return _nb1 + _nb2;
        else if (_op == 2) return _nb1 - _nb2;
        else if (_op == 3) return _nb1 * _nb2;
        else if (_op == 4) return _nb1 / _nb2;
        else if (_op == 5) return _nb1 % _nb2;
        _count++;
    }

    function cashOut() public {
        require(
            msg.sender == _owner,
            "PayableCalculator: only author can withdraw gain"
        );
        payable(msg.sender).transfer(_gain);
        _gain == 0;
    }
}
