pragma solidity ^0.4.23;

import "../service/DSServiceConsumerInterfaceVersioned.sol";

contract DSWalletManagerInterfaceVersioned is DSServiceConsumerInterfaceVersioned {
  constructor() internal {
    VERSIONS.push(1);
  }

  // Special wallets constants
  uint8 public constant NONE = 0;
  uint8 public constant ISSUER = 1;
  uint8 public constant PLATFORM = 2;
  uint8 public constant EXCHANGE = 4;
  string internal constant WALLETS = "wallets";
  string internal constant SLOTS = "slots";
  string internal constant TYPE = "type";

  /**
   * @dev should be emitted when a special wallet is added.
   */
  event DSWalletManagerSpecialWalletAdded(address _wallet, uint8 _type, address _sender);
  /**
   * @dev should be emitted when a special wallet is removed.
   */
  event DSWalletManagerSpecialWalletRemoved(address _wallet, uint8 _type, address _sender);
  /**
   * @dev should be emitted when the number of reserved slots is set for a wallet.
   */
  event DSWalletManagerReservedSlotsSet(address _wallet, string _country, uint8 _accreditationStatus, uint _slots, address _sender);

  /**
   * @dev Sets a wallet to be an special wallet. (internal)
   * @param _wallet The address of the wallet.
   * @param _type The type of the wallet.
   * @return A boolean that indicates if the operation was successful.
   */
  function setSpecialWallet(address _wallet, uint8 _type) internal returns (bool);
  /**
  * @dev gets a wallet type
  * @param _wallet the address of the wallet to check.
  */
  function getWalletType(address _wallet) public view returns (uint8);
  /**
   * @dev Sets a wallet to be an issuer wallet.
   * @param _wallet The address of the wallet.
   * @return A boolean that indicates if the operation was successful.
   */
  function addIssuerWallet(address _wallet) public /*onlyIssuerOrAbove*/ returns (bool);
  /**
   * @dev Sets a wallet to be a platform wallet.
   * @param _wallet The address of the wallet.
   * @return A boolean that indicates if the operation was successful.
   */
  function addPlatformWallet(address _wallet) public /*onlyIssuerOrAbove*/ returns (bool);
  /**
   * @dev Sets a wallet to be an exchange wallet.
   * @param _wallet The address of the wallet.
   * @param _owner The address of the owner.
   * @return A boolean that indicates if the operation was successful.
   */
  function addExchangeWallet(address _wallet, address _owner) public /*onlyIssuerOrAbove*/ returns (bool);
  /**
   * @dev Removes a special wallet.
   * @param _wallet The address of the wallet.
   * @return A boolean that indicates if the operation was successful.
   */
  function removeSpecialWallet(address _wallet) public /*onlyIssuerOrAbove*/ returns (bool);
  /**
   * @dev Sets the amount of reserved slots for a wallet based on country and accreditation status.
   * @param _wallet The address of the wallet.
   * @param _country The investors' country.
   * @param _accreditationStatus the investors' accrediation status.
   * @param _slots number of reserved slots.
   * @return A boolean that indicates if the operation was successful.
   */
  function setReservedSlots(address _wallet, string _country, uint8 _accreditationStatus, uint _slots) public /*onlyIssuerOrAbove*/ returns (bool);
  /**
   * @dev Gets the amount of reserved slots for a wallet based on country and accreditation status.
   * @param _wallet The address of the wallet.
   * @param _country The investors' country.
   * @param _accreditationStatus the investors' accrediation status.
   * @return The number of reserved slots.
   */
  function getReservedSlots(address _wallet, string _country, uint8 _accreditationStatus) public view returns (uint);
}