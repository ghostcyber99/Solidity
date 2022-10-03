// SPDX-License-Identifier: MIT
// a simple solidity file can hold mupltiple contracts 

pragma solidity ^0.8.0;

import "./SimpleStorage.sol";

contract StorageFactory{
    //create an array so we can have diffrient simpleStorage smart contracts 
    SimpleStorage[] public simpleStorageArray;


    //create a new contract 
    function creatSimpleStorageContract() public {
        
        //calling the SimpleStorage smart contract
        SimpleStorage simpleStorage = new SimpleStorage();
        simpleStorageArray.push(simpleStorage);
    }

    //saving the contract 
    function sfStore(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber) public  {
        // in order to interact with any contract you would need two things 1. the address and 2.the ABI(applcation Binary Interface)
        simpleStorageArray[_simpleStorageIndex].store(_simpleStorageNumber);
        
    }

    //retriving the contract
    function sfGet(uint256 _simpleStorageIndex) public view returns(uint256 ) {
        return simpleStorageArray[_simpleStorageIndex].retrieve();
        
    }

}