// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;
//Withdrawal from contracts
// The recommended method of sending funds is using the withdrawal pattern as opposed to the direct 
// send call, because it could lead to critical vulns and security risks.
// kingoftheether.com (withdrawal eg)

contract WithdrawalContract {
    address public richest;
    uint public mostSent;

    mapping (address => uint) pendingWithdrawals;

    function withdrawalContract() public payable {
        richest = msg.sender;
        mostSent = msg.value;
    }

    function becomeRichest() public payable returns (bool) {
        if (msg.value > mostSent) {
            pendingWithdrawals[richest] += msg.value;
            richest = msg.sender;
            mostSent = msg.value;
            return true;
        } else {
            return false;
        }
    }

    function withdraw() public {
        uint amount = pendingWithdrawals[msg.sender];
        // Remember to zero the pending refund before
        // sending to prevent re-entrancy attacks
        pendingWithdrawals[msg.sender] = 0;
        msg.sender.transfer(amount);
    }
}

//AS OPPOSED TO SENDING DIRECTLY THUS:

contract SendContract {
    address public richest;
    uint public mostSent;

    function sendContract() public payable {
        richest = msg.sender;
        mostSent = msg.value;
    }

    function becomeRichest() public payable returns (bool) {
        if (msg.value > mostSent) {
            // This line can cause problems (explained below).
            richest.transfer(msg.value);
            richest = msg.sender;
            mostSent = msg.value;
            return true;
        } else {
            return false;
        }
    }
}

// Notice that, in this example, an attacker could trap the contract into an unusable state by 
//causing richest to be the address of a contract that has a fallback function which fails 
//(e.g. by using revert() or by just consuming more than the 2300 gas stipend). That way, 
//whenever transfer is called to deliver funds to the “poisoned” contract, it will fail and 
//thus also becomeRichest will fail, with the contract being stuck forever.


//RESTRICTING ACCESS
// You cannot restrict any human or bot/system/ai from reading the contents of your contract via the
// blockchain, but you can make it a bit harder using encryption.

// function modifiers also makes this possible while making the restrictions highly readable

contract Restriction{
    address public owner = msg.sender;
    uint public importantTime = now;

    modifier onlyBy(address _account) {
        require (
            msg.sender == _account, 
            "This sender is not authorized"
        );
    }

// create function example for modifier (changeownership)

}