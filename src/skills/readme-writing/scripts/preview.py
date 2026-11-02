"""Screenshots a rendered README page, serving shields.io badges from badge.mjs.

Usage: python3 preview.py <page.html> <out.png> [height|full] [light|dark]
Requires Python Playwright with Chromium, and `npm install` in this directory.
"""

import asyncio
import pathlib
import subprocess
import sys

from playwright.async_api import async_playwright

HERE = pathlib.Path(__file__).resolve().parent


def badge_svg(url: str) -> str:
    return subprocess.run(
        ["node", str(HERE / "badge.mjs")], input=url, capture_output=True, text=True, check=True
    ).stdout


async def main(page_path: str, out: str, height: str, scheme: str) -> None:
    full = height == "full"

    async with async_playwright() as p:
        browser = await p.chromium.launch()
        page = await browser.new_page(
            viewport={"width": 1100, "height": 1000 if full else int(height)},
            color_scheme=scheme,
        )

        async def serve_badge(route):
            await route.fulfill(status=200, content_type="image/svg+xml", body=badge_svg(route.request.url))

        await page.route("**/img.shields.io/**", serve_badge)
        await page.goto(pathlib.Path(page_path).resolve().as_uri(), wait_until="load")
        await page.wait_for_timeout(1500)
        await page.screenshot(path=out, full_page=full)
        await browser.close()


if __name__ == "__main__":
    argv = sys.argv[1:]
    asyncio.run(main(argv[0], argv[1], argv[2] if len(argv) > 2 else "1250", argv[3] if len(argv) > 3 else "dark"))
