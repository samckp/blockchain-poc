//SPDX-License-Identifier: UNLICENSED

pragma solidity >=0.5.0 <0.9.0;

contract Token{
    string public name="HardHat Token";
    string public symbol="HHT";
    uint public totalSupply = 10000;

    address public owner;

    mapping(address=>uint256) balances;

    constructor(){
        balances[msg.sender]=totalSupply;
        owner=msg.sender;
    }

    function transfer(address to, uint amount) external{

        require(balances[msg.sender]>=amount, "Not enough tokens");
        balances[msg.sender]-=amount;
        balances[to]+=amount;
    }

    function balancesOf(address account) external view returns(uint) {

        return balances[account];
    }

}