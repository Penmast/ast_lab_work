fs = require('fs')

module.exports =

  logic: (req, res) ->
    console.log req.url
    if req.url == "/billet1"
      fs.readFile "public/html/billet1.html", (err, html) ->
        throw err if err
        res.writeHead 200,
          'Content-Type': 'text/plain'
          res.end html

    else if req.url == "/billet2"
      fs.readFile "public/html/billet2.html", (err, html) ->
        throw err if err
        res.writeHead 200,
          'Content-Type': 'text/plain'
          res.end html

    else if req.url == "/"
      fs.readFile "public/html/index.html", (err, html) ->
        throw err if err
        res.writeHead 200,
          'Content-Type': 'text/plain'
          res.end html

    else
      res.writeHead 200,
        'Content-Type': 'text/plain'
      res.end 'Route not found\n'

  port: "4444"
  address: "127.0.0.1"
