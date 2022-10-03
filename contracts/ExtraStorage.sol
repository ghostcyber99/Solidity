// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./SimpleStorage.sol";

//to inherit another contract you import and use the is function 
// to use function fro other contract we have to override those functions by using the override expression 
contract ExtraStorage is SimpleStorage {

    function store(uint256 _favouriteNumber) public override {
        favoriteNumber = _favouriteNumber + 5;
    }

}