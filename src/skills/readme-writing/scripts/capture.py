"""Captures a screenshot of a running project for the README.

Usage: python3 capture.py <url> <out.png> [light|dark]
Captures a 1600x1000 viewport at device scale 2 and saves it at 2000px wide.
"""

import asyncio
import sys

from PIL import Image
from playwright.async_api import async_playwright


async def main(url: str, out: str, scheme: str) -> None:
    async with async_playwright() as p:
        browser = await p.chromium.launch()
        page = await browser.new_page(
            viewport={"width": 1600, "height": 1000}, device_scale_factor=2, color_scheme=scheme
        )
        await page.goto(url, wait_until="networkidle")
        await page.wait_for_timeout(1500)
        await page.screenshot(path=out)
        await browser.close()

    image = Image.open(out).convert("RGB")
    image.resize((2000, round(image.height * 2000 / image.width)), Image.LANCZOS).save(out, optimize=True)


asyncio.run(main(sys.argv[1], sys.argv[2], sys.argv[3] if len(sys.argv) > 3 else "dark"))
