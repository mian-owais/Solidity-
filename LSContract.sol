// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/**
 * @title SimpleLiquidStaking
 * @dev A simplified version of Lido's liquid staking mechanism for educational purposes
 * This contract allows users to stake ETH and receive liquid staking tokens (stETH)
 */
contract SimpleLiquidStaking is ERC20, ReentrancyGuard, Ownable {
    
    // Events
    event Submitted(address indexed sender, uint256 amount, address referral);
    event Withdrawal(address indexed recipient, uint256 amount);
    
    // State variables
    uint256 public totalPooledEther;
    uint256 public totalShares;
    
    // Mapping to track individual balances
    mapping(address => uint256) private shares;
    
    // Validator management (simplified)
    address[] public validators;
    mapping(address => bool) public isValidator;
    
    constructor() ERC20("Liquid Staked Ether", "stETH") Ownable(msg.sender) {
        totalPooledEther = 0;
        totalShares = 0;
    }
    
    /**
     * @dev Stake ETH and receive stETH tokens
     * @param _referral referral address (can be zero address)
     * @return shares amount of shares minted
     */
    function submit(address _referral) external payable nonReentrant returns (uint256) {
        return _submit(msg.sender, msg.value, _referral);
    }
    
    /**
     * @dev Get the amount of shares by pooled ETH amount
     * @param _ethAmount amount of ETH
     * @return shares amount
     */
    function getSharesByPooledEth(uint256 _ethAmount) public view returns (uint256) {
        if (totalPooledEther == 0) {
            return _ethAmount;
        }
        return (_ethAmount * totalShares) / totalPooledEther;
    }
    
    /**
     * @dev Get the amount of pooled ETH by shares amount
     * @param _sharesAmount amount of shares
     * @return ETH amount
     */
    function getPooledEthByShares(uint256 _sharesAmount) public view returns (uint256) {
        if (totalShares == 0) {
            return 0;
        }
        return (_sharesAmount * totalPooledEther) / totalShares;
    }
    
    /**
     * @dev Get balance of stETH for an account
     * @param _account account address
     * @return balance in stETH
     */
    function balanceOf(address _account) public view override returns (uint256) {
        return getPooledEthByShares(shares[_account]);
    }
    
    /**
     * @dev Get shares amount for an account
     * @param _account account address
     * @return shares amount
     */
    function sharesOf(address _account) public view returns (uint256) {
        return shares[_account];
    }
    
    /**
     * @dev Total supply of stETH tokens
     * @return total supply
     */
    function totalSupply() public view override returns (uint256) {
        return totalPooledEther;
    }
    
    /**
     * @dev Add validator (only owner)
     * @param _validator validator address
     */
    function addValidator(address _validator) external onlyOwner {
        require(!isValidator[_validator], "VALIDATOR_EXISTS");
        validators.push(_validator);
        isValidator[_validator] = true;
    }
    
    /**
     * @dev Remove validator (only owner)
     * @param _validator validator address
     */
    function removeValidator(address _validator) external onlyOwner {
        require(isValidator[_validator], "VALIDATOR_NOT_EXISTS");
        isValidator[_validator] = false;
        
        // Remove from array
        for (uint i = 0; i < validators.length; i++) {
            if (validators[i] == _validator) {
                validators[i] = validators[validators.length - 1];
                validators.pop();
                break;
            }
        }
    }
    
    /**
     * @dev Simulate staking rewards (in real Lido, this comes from Ethereum 2.0 rewards)
     * @param _rewardAmount amount of rewards to add
     */
    function addRewards(uint256 _rewardAmount) external onlyOwner {
        require(_rewardAmount > 0, "ZERO_REWARDS");
        totalPooledEther += _rewardAmount;
        // Note: totalShares stays the same, making each share more valuable
    }
    
    /**
     * @dev Emergency withdrawal (simplified - in real Lido this is more complex)
     * @param _amount amount to withdraw in stETH
     */
    function withdraw(uint256 _amount) external nonReentrant {
        require(_amount > 0, "ZERO_WITHDRAWAL");
        require(balanceOf(msg.sender) >= _amount, "INSUFFICIENT_BALANCE");
        
        uint256 sharesToBurn = getSharesByPooledEth(_amount);
        require(sharesToBurn > 0, "ZERO_SHARES_TO_BURN");
        
        // Update state
        shares[msg.sender] -= sharesToBurn;
        totalShares -= sharesToBurn;
        totalPooledEther -= _amount;
        
        // Burn tokens
        _burn(msg.sender, sharesToBurn);
        
        // Transfer ETH (in real Lido, this would be queued)
        (bool success, ) = msg.sender.call{value: _amount}("");
        require(success, "TRANSFER_FAILED");
        
        emit Withdrawal(msg.sender, _amount);
    }
    
    /**
     * @dev Get validator count
     * @return number of validators
     */
    function getValidatorCount() external view returns (uint256) {
        return validators.length;
    }
    
    /**
     * @dev Fallback function to receive ETH
     */
    receive() external payable {
        // Automatically stake received ETH
        _submit(msg.sender, msg.value, address(0));
    }
    
    /**
     * @dev Internal submit function
     */
    function _submit(address _sender, uint256 _value, address _referral) internal returns (uint256) {
        require(_value > 0, "ZERO_DEPOSIT");
        
        uint256 sharesAmount = getSharesByPooledEth(_value);
        
        if (sharesAmount == 0) {
            // Handle first deposit
            sharesAmount = _value;
        }
        
        // Update state
        totalPooledEther += _value;
        totalShares += sharesAmount;
        shares[_sender] += sharesAmount;
        
        // Mint tokens to represent the stake
        _mint(_sender, sharesAmount);
        
        emit Submitted(_sender, _value, _referral);
        
        return sharesAmount;
    }
}

/**
 * @title TestLidoDeployment
 * @dev Helper contract for testing deployment and basic functionality
 */
contract TestLidoDeployment {
    SimpleLiquidStaking public lido;
    
    event LidoDeployed(address indexed lidoAddress);
    event DepositMade(address indexed user, uint256 amount, uint256 shares);
    
    constructor() {
        lido = new SimpleLiquidStaking();
        emit LidoDeployed(address(lido));
    }
    
    /**
     * @dev Test deposit function
     */
    function testDeposit() external payable {
        require(msg.value > 0, "SEND_ETH_TO_TEST");
        
        uint256 shares = lido.submit{value: msg.value}(address(0));
        
        emit DepositMade(msg.sender, msg.value, shares);
    }
    
    /**
     * @dev Get Lido contract address
     * @return address of deployed Lido contract
     */
    function getLidoAddress() external view returns (address) {
        return address(lido);
    }
    
    /**
     * @dev Check user's stETH balance
     * @param user user address
     * @return balance stETH balance
     * @return shares shares amount
     */
    function checkBalance(address user) external view returns (uint256 balance, uint256 shares) {
        balance = lido.balanceOf(user);
        shares = lido.sharesOf(user);
    }
}