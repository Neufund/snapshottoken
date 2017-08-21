pragma solidity ^0.4.13;

contract MixinAllowance {

////////////////
// Abstract functions
////////////////

    function mixinAllowanceTransfer(
        address from,
        address to,
        uint256 amount
    )
        internal
        returns (bool);

}
