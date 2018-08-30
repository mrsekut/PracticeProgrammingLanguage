import * as http from 'http'
import * as fs from 'fs'

const settings = require('./settings')

class Main {
  constructor() {
    const server: http.Server = http.createServer(
      (req, res) => this.requestHandler(req, res)
    )
    server.listen(settings.port)
  }

  private requestHandler(req: http.IncomingMessage, res: http.ServerResponse): void {
    fs.readFile('../templates/hello.html', 'utf-8', function(err, data) {
      if (err) {
        res.writeHead(404, {'Content-Type': 'text/plain'})
        res.write("not found")
        return res.end()
      }
      res.writeHead(200, {'Content-Type': 'text/html'})
      res.write(data)
      res.end()
    })

  }
}
