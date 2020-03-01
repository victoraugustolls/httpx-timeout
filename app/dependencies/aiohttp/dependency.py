from fastapi import HTTPException
import aiohttp


class AiohttpDependency:
    __slots__ = "_client"

    def __init__(self, *, client: aiohttp.ClientSession):
        self._client = client

    async def __call__(self):
        try:
            await self._client.get("https://google.com")
        except Exception as e:
            print(f"Error: {type(e)} {e}")
            raise HTTPException(status_code=500)
