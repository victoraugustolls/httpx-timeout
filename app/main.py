import aiohttp
import httpx
from fastapi import Depends, FastAPI

from app.dependencies import AiohttpDependency, HTTPXDependency

app = FastAPI(docs_url=None, redoc_url=None, openapi_url=None)

client = httpx.AsyncClient()
session = aiohttp.ClientSession()
dep_aiohttp = AiohttpDependency(client=session)
dep_httpx = HTTPXDependency(client=client)


@app.get("/aiohttp", dependencies=[Depends(dep_aiohttp)])
async def test_aiohttp():
    return True


@app.get("/httpx", dependencies=[Depends(dep_httpx)])
async def test_httpx():
    return True
