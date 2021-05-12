// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract PayableCalculator {
    uint256 private _price = 0.001 ether;
    address public _owner;
    uint256 private _gain;
    uint256 public _count;

    event Calc(int256 nb1, int256 nb2, uint256 op, int256 res);

    constructor() {
        _owner = msg.sender;
    }

    function calc(
        int256 _nb1,
        int256 _nb2,
        uint256 _op
    ) public payable returns (int256 _res) {
        require(msg.value == _price, "PayableCalculator: not the exact price");
        require(
            _op != 0 && _op <= 5,
            "PayableCalculator: not a valid opperator"
        );
        emit Calc(_nb1, _nb2, _op, _res);
        _gain += msg.value;
        if (_op == 1) _res = _nb1 + _nb2;
        else if (_op == 2) _res = _nb1 - _nb2;
        else if (_op == 3) _res = _nb1 * _nb2;
        else if (_op == 4) _res = _nb1 / _nb2;
        else if (_op == 5) _res = _nb1 % _nb2;
        _count++;
        return _res;
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
