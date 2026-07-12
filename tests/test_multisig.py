from src.multisig import build_multisig_tx, threshold

def test_build():
    tx = build_multisig_tx("0x" + "a"*40, "0x" + "b"*40, 1000)
    assert tx["threshold" if False else "value"] == 1000

def test_threshold():
    assert threshold("0x" + "a"*40) == 2
