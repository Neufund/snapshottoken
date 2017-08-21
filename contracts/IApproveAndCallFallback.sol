pragma solidity ^0.4.13;

contract IApproveAndCallFallback {

    function receiveApproval(
        address from,
        uint256 _amount,
        address _token,
        bytes _data
    )
        public;
}
