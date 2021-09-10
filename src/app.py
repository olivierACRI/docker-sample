from aiohttp import web
import os
import logging

log = logging.getLogger(__name__)


async def index_handler(request):
    log.info('[Index handler]')
    return web.Response(text="""\
<html>
    <head>
        <title>Test lab</title>
        <meta charset="utf-8">
    </head>
    <body>
        <h1>Test lab</h1>
        <a href="./test">Next</a>
    </body>
<html>
""", content_type='text/html')

async def test_handler(request):
    log.info('[Test handler]')
    response = web.Response(text=f"""\
<html>
    <head>
        <title>Test page</title>
        <meta charset="utf-8">
    </head>
    <body>
        <h1>Test page</h1>
        <a href="./">Back</a>
    </body>
<html>
""")
    response.content_type = "text/html"
    return response


app = web.Application()
app.add_routes([
    web.get("/", index_handler),
    web.get("/test", test_handler),
])



port_number = int(os.environ.get('PORT')) if os.environ.get('PORT').isdigit() else 8000
web.run_app(app, port=port_number)
