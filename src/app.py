from aiohttp import web
import os


async def index_handler(request):
    return web.Response(text="""\
<html>
    <head>
        <title>Test lab</title>
        <meta charset="utf-8">
    </head>
    <body>
        <h1>Test lab</h1>
    </body>
<html>
""")

async def test_handler(request):
    response = web.Response(text=f"""\
<p>Test</p>
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
