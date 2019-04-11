pragma solidity ^0.4.23;

import '../util/VersionedContract.sol';

/**
 * @title DSTrustServiceInterface
 * @dev An interface for a trust service which allows role-based access control for other contracts.
 */
contract DSTrustServiceInterfaceVersioned is VersionedContract {
  constructor() internal {
    VERSIONS.push(1);
  }
  /**
   * @dev Should be emitted when a role is set for a user.
   */
  event DSTrustServiceRoleAdded(address _address, uint8 _role, address _sender);
  /**
   * @dev Should be emitted when a role is removed for a user.
   */
  event DSTrustServiceRoleRemoved(address _address, uint8 _role, address _sender);


  // Role constants
  uint8 public constant NONE = 0;
  uint8 public constant MASTER = 1;
  uint8 public constant ISSUER = 2;
  uint8 public constant EXCHANGE = 4;
  string internal constant OWNER = "owner";
  string internal constant ROLES = "roles";

  /**
   * @dev Allow invoking of functions only by the user who has the MASTER role.
   */
  modifier onlyMaster() {
    assert(false);
    _;
  }

  /**
   * @dev Allow invoking of functions only by the users who have the MASTER role or the ISSUER role.
   */
  modifier onlyMasterOrIssuer() {
    assert(false);
    _;
  }

  /**
   * @dev Sets or removes a role for a wallet. (internal)
   * @param _address The wallet whose role needs to be set or removed.
   * @param _role The role to be set. NONE (0) indicates role removal.
   * @return A boolean that indicates if the operation was successful.
   */
  function setRoleImpl(address _address, uint8 _role) internal returns (bool);
  /**
   * @dev Transfers the ownership (MASTER role) of the contract.
   * @param _address The address which the ownership needs to be transferred to.
   * @return A boolean that indicates if the operation was successful.
   */
  function setOwner(address _address) public /*onlyMaster*/ returns (bool);
  /**
   * @dev Sets a role for a wallet.
   * @dev Should not be used for setting MASTER (use setOwner) or role removal (use removeRole).
   * @param _address The wallet whose role needs to be set.
   * @param _role The role to be set.
   * @return A boolean that indicates if the operation was successful.
   */
  function setRole(address _address, uint8 _role) public /*onlyMasterOrIssuer*/ returns (bool);
  /**
   * @dev Removes the role for a wallet.
   * @dev Should not be used to remove MASTER (use setOwner).
   * @param _address The wallet whose role needs to be removed.
   * @return A boolean that indicates if the operation was successful.
   */
  function removeRole(address _address) public /*onlyMasterOrIssuer*/ returns (bool);
  /**
   * @dev Gets the role for a wallet.
   * @param _address The wallet whose role needs to be fetched.
   * @return A boolean that indicates if the operation was successful.
   */
  function getRole(address _address) public view returns (uint8);
}