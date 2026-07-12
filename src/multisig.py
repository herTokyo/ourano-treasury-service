from web3 import Web3

def build_multisig_tx(safe, to, value, data=b""):
    """Build a Gnosis Safe transaction payload."""
    return {
        "safe": safe, "to": to, "value": value, "data": data.hex(),
        "operation": 0, "safeTxGas": 0, "baseGas": 0, "gasPrice": 0
    }

def threshold(safe): return 2
