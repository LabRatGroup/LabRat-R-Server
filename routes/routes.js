var appRouter = function (app) {

    app.get("/", function (req, res) {
        res.status(200).send("LabRat R server API services.");
    });

    app.get("/train/:token", function (req, res) {
        var sh = require('shelljs');
        var token = req.params.token;

        console.log('Processing model training data for ' + token);
        console.log(sh.exec('pwd'));
        var command = sh.exec(['rscript', './generateModel.R', token].join(' '));

        console.log('########## TRAINING PROCESS RESPONSE:' + command);

        res.status(command).send(command);
    });

    app.get("/predict/:token", function (req, res) {
        var sh = require('shelljs');
        var token = req.params.token;

        console.log('Predicting data for ' + token);
        console.log(sh.exec('pwd'));
        var command = sh.exec(['rscript', './predict.R', token].join(' '));

        console.log('########## PREDICTION PROCESS RESPONSE:' + command);

        res.status(command).send(command);
    });
}

module.exports = appRouter;
