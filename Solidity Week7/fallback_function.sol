// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

//Fallback Function

//USES: to send ether and "fallback" eg when an unidentified function is called 

//Features:
// has no name
// only one per smart contract
// no args allowed
// external is only visibility allowed

//Discuss:
//how to send some data(msg.data)
//reject incoming calls (revert(''))
//reject ether transfers(!payable)

//EXAMPLES:
// send ether
// function that does not exist

contract Marketplace{
    fallback() external payable {        

    }
}

