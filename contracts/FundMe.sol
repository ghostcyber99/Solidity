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

   
    function withdraw() public {
        for(uint256 funderIndex = 0; funderIndex < funders.length; funderIndex ++) {
        // code 
        //looping through the funders array 
        address funder = funders[funderIndex];
        //reset the mapping 
        addressToAmountFunded[funder] = 0;
        }
        // reset the array 
        funders = new address[](0);

        //withdrawing - there are 3 ways to send eth 1.transfer 2.send 3.call
        //in solidity we can only send native blockchain token like ethereum with payable addresses 
        //payable(msg.sender) = payable address
        //msg.sender = address
        //transfer menthod
        //payable(msg.sender).transfer(address(this).balance); // this is capped at 2300 gas and if this contracts uses more gas or fails it would throw an error - tranfer method 
        //send is also capped at 2300 gas and if it fails it would return a boolean
        //send
        //bool sendSuccess = payable(msg.sender).send(address(this).balance);
        //require(sendSuccess, "Send failed");
        //call - this is the recomended way to send eth or your token of chioce 
        // this method can be used to call any function in all of eth without even having the ABI
        (bool callSucess, ) = payable(msg.sender).call{value: address(this).balance}("");
        require(callSucess, "call failed");
    }
     
}

// libraries are similar to contracts but you cant send eth and you cant declear state variables 
