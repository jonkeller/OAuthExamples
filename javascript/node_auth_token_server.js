var http = require("http");

var express = require('express');
var app = express();

app.use(express.static(__dirname));

app.get("/", function(req, res){
    res.sendfile('public_client_flow.html')
})

app.get("/oauth2/callback", function(req,res){
    res.redirect("/")
})

var httpServer = http.createServer(app);
httpServer.listen('8085');
