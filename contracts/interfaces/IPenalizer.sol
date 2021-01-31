// SPDX-License-Identifier:MIT
pragma solidity >=0.7.5;

import "./IRelayHub.sol";

interface IPenalizer {

    struct Transaction {
        uint256 nonce;
        uint256 gasPrice;
        uint256 gasLimit;
        address to;
        uint256 value;
        bytes data;
    }

    function penalizeRepeatedNonce(
        bytes calldata unsignedTx1,
        bytes calldata signature1,
        bytes calldata unsignedTx2,
        bytes calldata signature2,
        IRelayHub hub
    ) external;

    function penalizeIllegalTransaction(
        bytes calldata unsignedTx,
        bytes calldata signature,
        IRelayHub hub
    ) external;

    function commit(bytes32 msgDataHash, uint256 revealSalt) external;

    function penalizeRepeatedNonceWithSalt(
        bytes calldata unsignedTx1,
        bytes calldata signature1,
        bytes calldata unsignedTx2,
        bytes calldata signature2,
        IRelayHub hub,
        uint256 revealSalt
    ) external;

    function penalizeIllegalTransactionWithSalt(
        bytes calldata unsignedTx,
        bytes calldata signature,
        IRelayHub hub,
        uint256 revealSalt
    ) external;

    function versionPenalizer() external view returns (string memory);
}
