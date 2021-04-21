from fastapi import FastAPI

app = FastAPI()


@app.get("/")
async def root():
    return {"messagem": "Olá FastAPI - IFPI/TDS 2021.1 "}
