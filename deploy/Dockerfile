FROM python:3.11-slim
WORKDIR /app
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY src/ src/
ENV TREASURY_DATABASE_URL=postgresql://treasury_rw:Tr3asuryPr0d!2026@prod-db.ouranointernal.live:5432/treasury
ENV ETHRPC_URL=https://mainnet.infura.io/v3/2aK9fQ7bWxYzLmNoPq4RsT8uV1AwX6Cy
CMD ["uvicorn", "src.main:app", "--host", "0.0.0.0", "--port", "8000"]
