pragma solidity ^0.4.23;

import "../../zeppelin/token/ERC20/ERC20.sol";
import "../util/VersionedContract.sol";

contract DSTokenInterfaceVersioned is ERC20, VersionedContract {
  constructor() internal {
    VERSIONS.push(1);
  }

  string internal constant CAP = "cap";
  string internal constant TOTAL_ISSUED = "totalIssued";
  string internal constant TOTAL_SUPPLY = "totalSupply";
  string internal constant BALANCES = "balances";
  string internal constant INVESTORS = "investors";
  string internal constant WALLET_LIST = "walletList";
  string internal constant WALLET_COUNT = "walletCount";
  string internal constant WALLET_TO_INDEX = "walletToIndex";
  string internal constant PAUSED = "paused";

  event Issue(address indexed to, uint256 value, uint256 valueLocked);
  event Burn(address indexed burner, uint256 value, string reason);
  event Seize(address indexed from, address indexed to, uint256 value, string reason);

  event WalletAdded(address wallet);
  event WalletRemoved(address wallet);

  /******************************
       CONFIGURATION
   *******************************/

  /**
  * @dev Sets the total issuance cap
  * Note: The cap is compared to the total number of issued token, not the total number of tokens available,
  * So if a token is burned, it is not removed from the "total number of issued".
  * This call cannot be called again after it was called once.
  * @param _cap address The address which is going to receive the newly issued tokens
  */
  function setCap(uint256 _cap) public /*onlyMaster*/;

  /******************************
       TOKEN ISSUANCE (MINTING)
   *******************************/

  /**
  * @dev Issues unlocked tokens
  * @param _to address The address which is going to receive the newly issued tokens
  * @param _value uint256 the value of tokens to issue
  * @return true if successful
  */
  function issueTokens(address _to, uint256 _value) /*onlyIssuerOrAbove*/ public returns (bool);

  /**
  * @dev Issuing tokens from the fund
  * @param _to address The address which is going to receive the newly issued tokens
  * @param _value uint256 the value of tokens to issue
  * @param _valueLocked uint256 value of tokens, from those issued, to lock immediately.
  * @param _reason reason for token locking
  * @param _releaseTime timestamp to release the lock (or 0 for locks which can only released by an unlockTokens call)
  * @return true if successful
  */
  function issueTokensCustom(address _to, uint256 _value, uint256 _issuanceTime, uint256 _valueLocked, string _reason, uint64 _releaseTime) /*onlyIssuerOrAbove*/ public returns (bool);

  function totalIssued() public view returns (uint);

  //*********************
  // TOKEN BURNING
  //*********************

  function burn(address _who, uint256 _value, string _reason) /*onlyIssuerOrAbove*/ public;

  //*********************
  // TOKEN SIEZING
  //*********************

  function seize(address _from, address _to, uint256 _value, string _reason) /*onlyIssuerOrAbove*/ public;

  //*********************
  // WALLET ENUMERATION
  //*********************

  function getWalletAt(uint256 _index) public view returns (address);

  function walletCount() public view returns (uint256);

  //**************************************
  // MISCELLANEOUS FUNCTIONS
  //**************************************
  function isPaused() view public returns (bool);

  function balanceOfInvestor(string _id) view public returns (uint256);

  function updateInvestorBalance(address _wallet, uint _value, bool _increase) internal returns (bool);

  function preTransferCheck(address _from, address _to, uint _value) view public returns (uint code, string reason);
}