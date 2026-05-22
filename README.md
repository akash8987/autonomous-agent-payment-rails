# Autonomous Agent Payment Rails (2026)

This repository provides an expert-level framework for the most dominant narrative of 2026: **Agentic Commerce**. As AI agents move from simple chatbots to autonomous entities, they require native on-chain identities and programmable wallets to transact without human intervention.

### Core Features
* **ERC-4337 Smart Accounts:** Agents use account abstraction to enable biometric signing, sponsored gas (via Paymasters), and session keys.
* **Session Policies:** Developers can define "Spending Windows" and "Allowed Contract" lists, ensuring agents can only spend specific amounts for specific tasks (e.g., $5/day for GPU compute).
* **Stablecoin Native:** Optimized for high-throughput, low-fee L2s (Base, Arbitrum, Optimism) using institutional stablecoins as the primary unit of account.
* **Verifiable Agent Identity:** Integrated with Decentralized Identifiers (DIDs) to prove the agent is running a specific version of a verified model.

### 2026 Technical Stack
* **Solidity ^0.8.26**
* **Foundry:** For advanced fuzzing and invariant testing of agent spending limits.
* **Viem/Wagmi:** Modern TypeScript stack for agent-side wallet orchestration.
* **LayerZero V2:** Cross-chain liquidity support for agents operating across multiple execution environments.
