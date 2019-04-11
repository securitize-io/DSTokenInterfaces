pragma solidity ^0.4.21;

import "../../zeppelin/storage/EternalStorage.sol";
import "../util/VersionedContract.sol";

contract DSEternalStorageVersioned is EternalStorage, VersionedContract {
  constructor() public {
    VERSIONS.push(1);
  }

  string internal constant WRITE = "write";

  function deleteBoolean(bytes32 h) public onlyRole(WRITE) {
    delete(s._bool[h]);
  }

  function deleteInt(bytes32 h) public onlyRole(WRITE) {
    delete(s._int[h]);
  }

  function deleteUint(bytes32 h) public onlyRole(WRITE) {
    delete(s._uint[h]);
  }

  function deleteAddress(bytes32 h) public onlyRole(WRITE) {
    delete(s._address[h]);
  }

  function deleteString(bytes32 h) public onlyRole(WRITE) {
    delete(s._string[h]);
  }

  function deleteBytes(bytes32 h) public onlyRole(WRITE) {
    delete(s._bytes[h]);
  }
}