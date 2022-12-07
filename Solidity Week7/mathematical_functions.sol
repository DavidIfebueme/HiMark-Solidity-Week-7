// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

//Mathematical functions
//"external" lets the function to be called when we deploy the contract
//"pure" makes the function read only, does not write anything to the blockchain


//EXAMPLES:
//write an add functions
//write a subtract function


contract MathFunc {
    function add(uint x, uint y) external pure returns (uint){
        return x + y;
    }

}