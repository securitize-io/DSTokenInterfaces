pragma solidity ^0.4.23;

import "../service/DSServiceConsumerInterfaceVersioned.sol";

contract DSLockManagerInterfaceVersioned is DSServiceConsumerInterfaceVersioned {
  constructor() internal {
    VERSIONS.push(1);
  }

  string internal constant LOCKS_VALUE = "locks_value";
  string internal constant LOCKS_REASON = "locks_reason";
  string internal constant LOCKS_REASON_STRING = "locks_reasonString";
  string internal constant LOCKS_RELEASE_TIME = "locks_releaseTime";
  string internal constant LOCK_COUNT = "lockCount";

  event Locked(address indexed who, uint256 value, uint indexed reason, string reasonString, uint releaseTime);
  event Unlocked(address indexed who, uint256 value, uint indexed reason, string reasonString, uint releaseTime);

  /**
  * @dev creates a lock record
  * @param _to address to lock the tokens at
  * @param _valueLocked value of tokens to lock
  * @param _reason reason for lock
  * @param _releaseTime timestamp to release the lock (or 0 for locks which can only released by an unlockTokens call)
  * @return A unique id for the newly created lock.
  * Note: The user MAY have at a certain time more locked tokens than actual tokens
  */

  function addManualLockRecord(address _to, uint _valueLocked, string _reason, uint _releaseTime) /*issuerOrAboveOrToken*/ public;

  /**
   * @dev Releases a specific lock record
   * @param _to address to release the tokens for
   * @param _index the index of the lock to remove
   *
   * note - this may change the order of the locks on an address, so if iterating the iteration should be restarted.
   * @return true on success
   */
  function removeLockRecord(address _to, uint _index) /*issuerOrAbove*/ public returns (bool);

  /**
   * @dev Get number of locks currently associated with an address
   * @param _who address to get token lock for
   *
   * @return number of locks
   *
   * Note - a lock can be inactive (due to its time expired) but still exists for a specific address
   */
  function lockCount(address _who) public view returns (uint);

  /**
   * @dev Get details of a specific lock associated with an address
   * can be used to iterate through the locks of a user
   * @param _who address to get token lock for
   * @param _index the 0 based index of the lock.
   * @return id the unique lock id
   * @return type the lock type (manual or other)
   * @return reason the reason for the lock
   * @return value the value of tokens locked
   * @return autoReleaseTime the timestamp in which the lock will be inactive (or 0 if it's always active until removed)
   *
   * Note - a lock can be inactive (due to its time expired) but still exists for a specific address
   */
  function lockInfo(address _who, uint _index) public view returns (uint reasonCode, string reasonString, uint value, uint autoReleaseTime);

  /**
   * @dev get total number of transferable tokens for a user, at a certain time
   * @param _who address to get number of transferable tokens for
   * @param _time time to calculate for
   */
  function getTransferableTokens(address _who, uint64 _time) public view returns (uint);
}
