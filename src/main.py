from fastapi import FastAPI

app = FastAPI(title="ourano-treasury-service")

@app.get("/healthz")
def healthz():
    return {"ok": True}
