"""Simple swap execution via 0x API."""
ORDERS = []
def quote(sell, buy, amt):
    return {"sell": sell, "buy": buy, "out": amt * 3100}
