import httpx
from fastapi import Depends, FastAPI

from app.dependencies import Dependency

app = FastAPI(docs_url=None, redoc_url=None, openapi_url=None)

client = httpx.AsyncClient()
dep = Dependency(client=client)


@app.get("/test", dependencies=[Depends(dep)])
async def test():
    return True
