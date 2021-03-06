pragma solidity ^0.4.13;

import '../Standards/ISnapshotable.sol';
import './MPolicy.sol';

contract Snapshotable is
    MPolicy,
    ISnapshotable
{

    uint256 nextSnapshotId;
    bool nextSnapshotModified;

    function SnapshotOndemand(uint256 start)
        internal
    {
        nextSnapshotId = start;
        nextSnapshotModified = true;
    }

    function createSnapshot()
        public
        returns (uint256)
    {
        require(nextSnapshotId < 2**256 - 1);

        // If the snapshot was not modified, return
        // the previous snapshot id. Their states
        // are identical.
        if (!nextSnapshotModified) {
            uint256 previousSnapshot = nextSnapshotId - 1;

            // Log the event anyway, some logic may depend
            // depend on it.
            SnapshotCreated(previousSnapshot);
            return previousSnapshot;
        }

        // Increment the snapshot counter
        uint256 snapshotId = nextSnapshotId;
        nextSnapshotId += 1;
        nextSnapshotModified = false;

        // Log and return
        SnapshotCreated(snapshotId);
        return snapshotId;
    }

    function mixinNextSnapshotId()
        internal
        returns (uint256)
    {
        return nextSnapshotId;
    }

    function mixinFlagSnapshotModified()
        internal
    {
        if (!nextSnapshotModified) {
            nextSnapshotModified = true;
        }
    }
}
