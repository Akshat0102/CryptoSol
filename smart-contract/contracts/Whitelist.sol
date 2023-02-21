// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Whitelist {
    //var to define maximum white listed addresses allowed
    uint8 public maxWhiteListedAddresses;

    //var to track number of addresses whitelisted
    uint8 public numAddressesWhitelisted;

    //mapping to mark true for the whitelisted addresses and a check that no-one whitelist his address again
    mapping(address => bool) public whitelistedAddresses;

    //constructor to initialise the defined variable upon creation of object
    constructor(uint8 _maxWhiteListedAddresses) {
        maxWhiteListedAddresses = _maxWhiteListedAddresses;
    }

    //function to add the address of sender/user to whitelist
    function addAddresstoWhitelist() public {
        //check to ensure if the current user is not already whitelisted
        require(
            !whitelistedAddresses[msg.sender],
            "User has already been whitelisted!"
        );

        //check to ensure if the number of whitelisted address is less than maximum allowed
        require(
            numAddressesWhitelisted < maxWhiteListedAddresses,
            "Maximum number of whitelisted address reached!"
        );

        //entering the address of sender to whitelisted address
        whitelistedAddresses[msg.sender] = true;

        //incrementing number of whitelisted address
        numAddressesWhitelisted += 1;
    }
}
