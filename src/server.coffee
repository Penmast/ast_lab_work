fs = require('fs')
url = require 'url'
pug = require 'pug'

renderResource = (filename, type, res, callback) ->
  console.log "rendering resource #{filename} of type #{type}"
  fs.readFile "public/#{type}/#{filename}", (err, file) ->
    throw err if err
    res.writeHead 200,
      'Content-Type': "text/#{type}"
    res.write file
    res.end()

module.exports =

  logic: (req, res) ->
    url = url.parse req.url
    [ _, directory, filetype, filename ] = url.pathname.split "/"
    directory = "/" if directory == ""

    switch directory
      when "/"
        renderResource "index.html", "html", res
      when "public"
        renderResource filename, filetype, res
      when "billet1.html"
        renderResource "billet1.html", "html", res
      when "billet2.html"
        renderResource "billet2.html", "html", res
      else
        res.writeHead 404,
          'Content-Type': 'text/plain'
        res.end 'Route not found\n'

  port: "4444"
  address: "127.0.0.1"
