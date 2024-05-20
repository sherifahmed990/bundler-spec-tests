// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.12;

import "../utils/RIP7560Utils.sol";

contract GasWastePaymaster {
    uint256 public pmCounter = 0;

    function validatePaymasterTransaction(
        uint256 version,
        bytes32 txHash,
        bytes calldata transaction)
    external
    returns (
        bytes memory validationData
    ){
        do {
            pmCounter++;
        } while (gasleft() > 3000);
        return RIP7560Utils.paymasterAcceptTransaction("", block.timestamp, block.timestamp + 1000);
    }

    function postPaymasterTransaction(
        bool success,
        uint256 actualGasCost,
        bytes calldata context
    ) external {
        do {
            pmCounter++;
        } while (gasleft() > 100);
    }

    receive() external payable {
    }
}
