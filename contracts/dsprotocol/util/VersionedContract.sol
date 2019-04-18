pragma solidity ^0.4.23;

contract VersionedContract {
  uint[] internal VERSIONS = [1];

  function getVersion() public view returns (uint[]) {
      return VERSIONS;
  }
}