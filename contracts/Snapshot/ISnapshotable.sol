pragma solidity ^0.4.13;

contract ISnapshotable {

////////////////
// Events
////////////////

    event SnapshotCreated(uint256 snapshot);

////////////////
// Public functions
////////////////

    function createSnapshot()
        public
        returns (uint256);

}
