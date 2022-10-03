// SPDX-License-Identifier: MIT 
//Get funds from users
//withdraw funds 
// the current moden of the chainlink nodes, a network of these chainlink nodes each reaches out and gets the imformation about an assert(like current convertion rate of usd to eth) and signs the data with their own private key 
// in a transcation would deliver the data with all the diffrient signature to the refrence contract if that node does not deliever the data, anothernode would deliver it 
//Set a miminum funding value in USD
//whenever a node operator delivers on a smart contract he is paid for the transcation fee just like gas fee 
//Blockchain oracles is anydevice that interacts with the off-chain world to provide external data or computation to smart contracts  
//chainlink is decentralized network used for bringing information into the smart contract so these are hybrid sm 
//chainlink nodes can make API requests  
//chainlink keeper these are decentralized event driven excution, they are registration nodes that listen to a registration contract for diffrient events that you specify to fire, like every 10mins do something.
//chainlink vrf(verifiable randomness function) is a way to get randomness into the function, oracles are used to do that - Protocols like pulltogether  use gaming and loteries 


pragma solidity ^0.8.0;


import "./PriceConverter.sol";

contract fundMe {
    using PriceConverter for uint256;

    uint256 public miminumUsd = 50 * 1e18;

    //saving the funders 
    address[] public funders;
    //mapping the ammount funded to the funder 
    mapping(address => uint256) public addressToAmountFunded;

    //contract  can hold funds like wallets can hold funds 
    function fund() public payable {
    //the requier keyword means that, that is the minimum amount someone can send to this contract
    //msg.value is the value funded into the contract
    //msg.sender is the address of whoever is sending money into the contract
    //1e18 is the value of wei == 1eth
    //reverting is where the contract revert any gas because the contract value was not met.
    // gas was spent in the initail computation but every else would be reverted
    require(msg.value.getConversationRate() >= miminumUsd, "Not enough");
    funders.push(msg.sender); 
    addressToAmountFunded[msg.sender] = msg.value;
    }

   
    //function withdraw(){}
     
}

// libraries are similar to contracts but you cant send eth and you cant declear state variables 
