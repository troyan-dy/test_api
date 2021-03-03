import asyncio
import os
import random

import uvicorn
from fastapi import FastAPI

WORKERS = int(os.environ["WORKERS"])
NUMBER = int(os.environ["NUMBER"])
app = FastAPI()


@app.get("/test_api/{number:int}")
async def root(number):
    await asyncio.sleep(random.random())
    return number << NUMBER


if __name__ == "__main__":
    uvicorn.run("app:app", host="0.0.0.0", port=1337, workers=WORKERS)
