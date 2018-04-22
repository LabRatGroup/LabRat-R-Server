var appRouter = function (app) {

    app.get("/", function (req, res) {
        res.status(200).send("Welcome to our restful API");
    });

    app.get("/model/:token", function (req, res) {
        var token = req.params.token;

        res.status(200).send(token);
    });
}

module.exports = appRouter;
