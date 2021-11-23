// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

import "./IERC20.sol";

contract PERI is IERC20 {
    
    uint public override totalSupply = 100000000;
    
    mapping(address => uint) public override balanceOf;
    mapping(address => mapping(address => uint)) public override allowance;
    
    string public name = "PERIHELION TOKEN";
    string public symbol = "PERI";
    uint8 public decimals = 18;

    constructor() {
        
        balanceOf[msg.sender] = totalSupply;
        
    }

    function transfer(address recipient, uint amount) external override returns (bool) {
        
        balanceOf[msg.sender] -= amount;
        balanceOf[recipient] += amount;
        emit Transfer(msg.sender, recipient, amount);
        return true;
        
    }

    function approve(address spender, uint amount) external override returns (bool) {
        
        allowance[msg.sender][spender] = amount;
        emit Approval(msg.sender, spender, amount);
        return true;
        
    }

    function transferFrom(
        address sender,
        address recipient,
        uint amount
    ) external override returns (bool) {
        
        allowance[sender][msg.sender] -= amount;
        balanceOf[sender] -= amount;
        balanceOf[recipient] += amount;
        
        emit Transfer(sender, recipient, amount);
        return true;
        
    }
    
}