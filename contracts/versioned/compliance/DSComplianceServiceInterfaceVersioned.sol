pragma solidity ^0.4.23;

import "../service/DSServiceConsumerInterfaceVersioned.sol";
import "../../zeppelin/token/ERC20/ERC20.sol";

contract DSComplianceServiceInterfaceVersioned is DSServiceConsumerInterfaceVersioned {
  constructor() internal {
    VERSIONS.push(2);
  }

  uint internal constant NONE = 0;
  uint internal constant US = 1;
  uint internal constant EU = 2;
  uint internal constant FORBIDDEN = 4;
  string internal constant TOKEN_PAUSED = "Token Paused";
  string internal constant NOT_ENOUGH_TOKENS = "Not Enough Tokens";
  string internal constant TOKENS_LOCKED = "Tokens Locked";
  string internal constant WALLET_NOT_IN_REGISTRY_SERVICE = "Wallet not in registry Service";
  string internal constant DESTINATION_RESTRICTED = "Destination restricted";
  string internal constant VALID = "Valid";
  string internal constant TOTAL_INVESTORS = "totalInvestors";
  string internal constant US_INVESTORS_COUNT = "usInvestorsCount";
  string internal constant US_ACCREDITED_INVESTORS_COUNT = "usAccreditedInvestorsCount";
  string internal constant ACCREDITED_INVESTORS_COUNT = "accreditedInvestorsCount";
  string internal constant EU_RETAIL_INVESTORS_COUNT = "euRetailInvestorsCount";
  string internal constant ISSUANCES_COUNT = "issuancesCount";
  string internal constant ISSUANCE_VALUE = "issuanceValue";
  string internal constant ISSUANCE_TIMESTAMP = "issuanceTimestamp";
  string internal constant HOLD_UP = "Hold-up";
  string internal constant HOLD_UP_1Y = "Hold-up 1y";
  string internal constant ONLY_FULL_TRANSFER = "Only Full Transfer";
  string internal constant FLOWBACK = "Flowback";
  string internal constant MAX_INVESTORS_IN_CATEGORY = "Max Investors in category";
  string internal constant AMOUNT_OF_TOKENS_UNDER_MIN = "Amount of tokens under min";
  string internal constant AMOUNT_OF_TOKENS_ABOVE_MAX = "Amount of tokens above max";
  string internal constant ONLY_ACCREDITED = "Only accredited";
  string internal constant NOT_ENOUGH_INVESTORS = "Not enough investors";

  //*****************************************
  // TOKEN ACTION VALIDATIONS
  //*****************************************

  function validateIssuance(address _to, uint _value, uint _issuanceTime) /*onlyToken*/ public returns (bool);

  function validateBurn(address _who, uint _value) /*onlyToken*/ public returns (bool);

  function validateSeize(address _from, address _to, uint _value) /*onlyToken*/ public returns (bool);

  function validate(address _from, address _to, uint _value) /*onlyToken*/ public returns (bool);

  function preIssuanceCheck(address _to, uint _value) view public returns (uint code, string reason);

  function preTransferCheck(address _from, address _to, uint _value) view public returns (uint code, string reason);
}