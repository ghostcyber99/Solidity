// SPDX-License-Identifier: MIT 
// functions in a library are internal 


pragma solidity ^0.8.0;

contract SafeMathTester {
    uint8 public bigNumber = 255;

    function add() public {
       unchecked{ //unchecked using less gas when complieing 
           bigNumber = bigNumber + 1;
       } 
    }
}