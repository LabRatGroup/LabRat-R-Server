var appRouter = function (app) {

    app.get("/", function (req, res) {
        res.status(200).send("LabRar R server API services.");
    });

    app.get("/train/:token", function (req, res) {
        var sh = require('shelljs');
        var token = req.params.token;

        console.log('Processing model training data for '+token);
        console.log(sh.exec('pwd'));
        var command = sh.exec(['rscript', './generateModel.R', token].join(' '));

        res.status(command).send();
    });

    app.get("/predict/:token", function (req, res) {
        var sh = require('shelljs');
        var token = req.params.token;

        console.log('Predicting data for '+token);
        console.log(sh.exec('pwd'));
        var command = sh.exec(['rscript', './predict.R', token].join(' '));

        res.status(command).send();
    });
}

module.exports = appRouter;
