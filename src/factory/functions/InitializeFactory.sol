// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "../storage/Schema.sol";
import "../storage/Storage.sol";

contract InitializeFactory {

    function initialize(address poolDictionary, address gaugeDictionary) external {
        Schema.$FactoryState storage state = Storage.FactoryState();

        // Ensure that this function is called only once
        require(!state.initialized, "initialize: ALREADY_INITIALIZED");

        state.poolDictionary = poolDictionary;
        state.gaugeDictionary = gaugeDictionary;
        
        // Mark the factory as initialized to prevent re-initialization
        state.initialized = true;
    }
}