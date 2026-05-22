/**
 * Utility to verify if a target contract belongs to a 
 * verified RWA (Real World Asset) provider before agent spends.
 */
const VERIFIED_PROVIDERS = [
    "0x1234...5678", // Example: Tokenized Compute Provider
    "0x8765...4321"  // Example: Data Marketplace
];

function isProviderSafe(address) {
    return VERIFIED_PROVIDERS.includes(address.toLowerCase());
}

module.exports = { isProviderSafe };
