// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "@account-abstraction/contracts/core/BaseAccount.sol";
import "@account-abstraction/contracts/interfaces/IEntryPoint.sol";
import "@openzeppelin/contracts/utils/cryptography/ECDSA.sol";

contract AgentWallet is BaseAccount {
    using ECDSA for bytes32;

    address public owner;
    IEntryPoint private immutable _entryPoint;

    struct Session {
        uint256 limit;
        uint256 spent;
        uint48 deadline;
    }

    mapping(address => Session) public sessions;

    constructor(IEntryPoint entryPoint_, address owner_) {
        _entryPoint = entryPoint_;
        owner = owner_;
    }

    function entryPoint() public view override returns (IEntryPoint) {
        return _entryPoint;
    }

    function _validateSignature(UserOperation calldata userOp, bytes32 userOpHash)
        internal view override returns (uint256 validationData) {
        bytes32 hash = userOpHash.toEthSignedMessageHash();
        if (owner != hash.recover(userOp.signature)) {
            return SIG_VALIDATION_FAILED;
        }
        return 0;
    }

    function execute(address dest, uint256 value, bytes calldata func) external {
        _requireFromEntryPoint();
        (bool success,) = dest.call{value: value}(func);
        require(success, "Agent execution failed");
    }

    function setSession(address agent, uint256 limit, uint48 duration) external {
        require(msg.sender == owner, "Only owner can authorize agents");
        sessions[agent] = Session(limit, 0, uint48(block.timestamp) + duration);
    }
}
