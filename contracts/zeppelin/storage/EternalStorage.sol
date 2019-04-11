pragma solidity ^0.4.21;

import '../ownership/rbac/RBACWithAdmin.sol';

contract EternalStorage is RBACWithAdmin {
  struct Storage {
    mapping(bytes32 => bool) _bool;
    mapping(bytes32 => int) _int;
    mapping(bytes32 => uint256) _uint;
    mapping(bytes32 => string) _string;
    mapping(bytes32 => address) _address;
    mapping(bytes32 => bytes) _bytes;
  }

  Storage internal s;

  function setBoolean(bytes32 h, bool v) public onlyRole("write") {
    s._bool[h] = v;
  }

  function setInt(bytes32 h, int v) public onlyRole("write") {
    s._int[h] = v;
  }

  function setUint(bytes32 h, uint256 v) public onlyRole("write") {
    s._uint[h] = v;
  }

  function setAddress(bytes32 h, address v) public onlyRole("write") {
    s._address[h] = v;
  }

  function setString(bytes32 h, string v) public onlyRole("write") {
    s._string[h] = v;
  }

  function setBytes(bytes32 h, bytes v) public onlyRole("write") {
    s._bytes[h] = v;
  }

  function getBoolean(bytes32 h) public view returns (bool) {
    return s._bool[h];
  }

  function getInt(bytes32 h) public view returns (int) {
    return s._int[h];
  }

  function getUint(bytes32 h) public view returns (uint256) {
    return s._uint[h];
  }

  function getAddress(bytes32 h) public view returns (address) {
    return s._address[h];
  }

  function getString(bytes32 h) public view returns (string) {
    return s._string[h];
  }

  function getBytes(bytes32 h) public view returns (bytes) {
    return s._bytes[h];
  }
}