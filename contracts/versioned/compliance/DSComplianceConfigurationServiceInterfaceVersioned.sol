pragma solidity ^0.4.23;

import "../service/DSServiceConsumerInterfaceVersioned.sol";

contract DSComplianceConfigurationServiceInterfaceVersioned is DSServiceConsumerInterfaceVersioned {
  constructor() internal {
    VERSIONS.push(2);
  }

  function getCountryCompliance(string _country) view public returns (uint);
  function setCountryCompliance(string _country, uint _value) /*onlyIssuerOrAbove*/ public;
  function getTotalInvestorsLimit() public view returns (uint);
  function setTotalInvestorsLimit(uint _value) public /*onlyIssuerOrAbove*/;
  function getMinUsTokens() public view returns (uint);
  function setMinUsTokens(uint _value) public /*onlyIssuerOrAbove*/;
  function getMinEuTokens() public view returns (uint);
  function setMinEuTokens(uint _value) public /*onlyIssuerOrAbove*/;
  function getUsInvestorsLimit() public view returns (uint);
  function setUsInvestorsLimit(uint _value) public /*onlyIssuerOrAbove*/;
  function getUsAccreditedInvestorsLimit() public view returns (uint);
  function setUsAccreditedInvestorsLimit(uint _value) public /*onlyIssuerOrAbove*/;
  function getNonAccreditedInvestorsLimit() public view returns (uint);
  function setNonAccreditedInvestorsLimit(uint _value) public /*onlyIssuerOrAbove*/;
  function getMaxUsInvestorsPercentage() public view returns (uint);
  function setMaxUsInvestorsPercentage(uint _value) public /*onlyIssuerOrAbove*/;
  function getBlockFlowbackEndTime() public view returns (uint);
  function setBlockFlowbackEndTime(uint _value) public /*onlyIssuerOrAbove*/;
  function getNonUsLockPeriod() public view returns (uint);
  function setNonUsLockPeriod(uint _value) public /*onlyIssuerOrAbove*/;
  function getMinimumTotalInvestors() public view returns (uint);
  function setMinimumTotalInvestors(uint _value) public /*onlyIssuerOrAbove*/;
  function getMinimumHoldingsPerInvestor() public view returns (uint);
  function setMinimumHoldingsPerInvestor(uint _value) public /*onlyIssuerOrAbove*/;
  function getMaximumHoldingsPerInvestor() public view returns (uint);
  function setMaximumHoldingsPerInvestor(uint _value) public /*onlyIssuerOrAbove*/;
  function getEuRetailLimit() public view returns (uint);
  function setEuRetailLimit(uint _value) public /*onlyIssuerOrAbove*/;
  function getUsLockPeriod() public view returns (uint);
  function setUsLockPeriod(uint _value) public /*onlyIssuerOrAbove*/;
  function getForceFullTransfer() public view returns (bool);
  function setForceFullTransfer(bool _value) public /*onlyIssuerOrAbove*/;
  function getForceAccredited() public view returns (bool);
  function setForceAccredited(bool _value) public /*onlyIssuerOrAbove*/;
  function setAll(uint[] _uint_values, bool[] _bool_values) public /*onlyIssuerOrAbove*/;
}