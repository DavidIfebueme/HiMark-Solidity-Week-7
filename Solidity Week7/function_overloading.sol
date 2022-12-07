// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;


// Overloading a function simply means you can create a fuction that has the same name but different
// args and/or a different type
// Overloading also applies to inherited functions

contract sample {
   function getSum(uint a, uint b) public pure returns(uint){      
      return a + b;
   }
   function getSum(uint a, uint b, uint c) public pure returns(uint){      
      return a + b + c;
   }
   function callSumWithTwoArguments() public pure returns(uint){
      return getSum(4,9);
   }
   function callSumWithThreeArguments() public pure returns(uint){
      return getSum(1,4,7);
   }
}