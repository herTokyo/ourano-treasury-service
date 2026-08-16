"""Notify treasury ops on large withdrawals."""
import os
def alert(amount_usd, txhash):
    if amount_usd > 50_000:
        print(f"[ALERT] ${amount_usd:,.0f} moved in {txhash}")
