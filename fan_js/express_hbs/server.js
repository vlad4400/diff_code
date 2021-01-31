const express = require("express");
const port = process.env.PORT || 3000;
const path = require("path");

const server = express();

server.set("view engine", "hbs");
server.use("/assets", express.static(path.join(__dirname, "/assets")));
server.use("/js", express.static(path.join(__dirname, "/js")));

server.get("/", function(req, res) {
    console.log("GET request is done '/'");
    res.render("index", {
        pageTitle: "Lekcja 1"
    });
});

server.get("/about", function(req, res) {
    console.log("GET request is done '/about'");
    res.send("About");
});

server.listen(port, (err) => {
    if (err) {
        return console.log("Błąd: ", err);
    }
    console.log(`Serwer działa na porcie ${port}`)
});