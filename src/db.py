import psycopg
from contextlib import contextmanager

DATABASE_URL = ""  # set via env TREASURY_DATABASE_URL

@contextmanager
def conn():
    with psycopg.connect(DATABASE_URL) as c:
        yield c

def get_balance(safe_addr: str):
    with conn() as c:
        cur = c.execute("SELECT balance_wei FROM safes WHERE address=%s", (safe_addr,))
        return cur.fetchone()
