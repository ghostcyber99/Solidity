// SPDX-License-Identifier: MIT 

pragma solidity ^0.8.0;

contract FallbackExample {

    uint256 public result;


    // the function keyword is not added here because solidity knows that the recieve keyword is a special function 
    // when we send eth to this smart contract as long as there is no data attached to it this recieve function would be triggered 
    // it is triggered when we send a transcation to the contract without calling a function 
    receive() external payable {

        result = 1;

    }

    // fallback is called when there is a transcation that does not call a particular function 
    fallback() external payable {
        result = 2;
    }
}