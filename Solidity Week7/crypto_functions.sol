// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

//A Cryptographic Hash Function (CHF) is a mathematical algorithm that maps data of an arbitrary size 
// to a bit array of a fixed size called hash eg size of an eth addr is 160byted (uint 160)


// EG of inbuilt crypto graphic functions in solidity
//keccak256(bytes memory) returns (bytes32)
//sha256(bytes memory) returns (bytes32)
//ripemd160(bytes memory) returns (bytes20)

contract Test{
    function func() public pure returns (bytes32){
        return keccak256("David");

    }
}
