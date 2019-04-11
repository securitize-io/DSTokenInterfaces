pragma solidity ^0.4.23;

import "../service/DSServiceConsumerInterfaceVersioned.sol";

contract DSIssuanceInformationManagerInterfaceVersioned is DSServiceConsumerInterfaceVersioned {
  constructor() internal {
    VERSIONS.push(1);
  }

  string internal constant INVESTORS = "investors";
  string internal constant COMPLIANCE = "compliance";

  /**
  * @dev should be emitted when investor information is set.
  */
  event DSIssuanceInformationManagerInvestorInformationSet(string _id, uint8 _informationId, string _hash, address _sender);
  /**
   * @dev should be emitted when compliance information is set.
   */
  event DSIssuanceInformationManagerComplianceInformationSet(uint8 _informationId, string _value, address _sender);

  /**
   * @dev Sets information about an investor.
   * @param _id The investor identifier.
   * @param _informationId The type of information needed to be set.
   * @param _hash The value to be set.
   * @return A boolean that indicates if the operation was successful.
   */
  function setInvestorInformation(string _id, uint8 _informationId, string _hash) public /*onlyExchangeOrAbove*/ returns (bool);
  /**
   * @dev Gets information about an investor.
   * @param _id The investor identifier.
   * @param _informationId The type of information needed to be fetched.
   * @return The value.
   */
  function getInvestorInformation(string _id, uint8 _informationId) public view returns (string);
  /**
   * @dev Sets compliance information.
   * @param _informationId The type of information needed to be fetched.
   * @param _value The value to be set.
   * @return A boolean that indicates if the operation was successful.
   */
  function setComplianceInformation(uint8 _informationId, string _value) public /*onlyIssuerOrAbove*/ returns (bool);
  /**
   * @dev Gets compliance information.
   * @param _informationId The type of information needed to be fetched.
   * @return The value.
   */
  function getComplianceInformation(uint8 _informationId) public view returns (string);
}