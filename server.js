'use strict';

const fs = require('fs');
const Promise = require('bluebird');
const SFTPServer = require('sftp-server');
const path = require('path');
const server = require('sftp-server')({
    'sftp': {
        'port': 3333,
        'hostKeys': [
            fs.readFileSync(__dirname + '/ssh/host_rsa').toString('utf8')
        ],
        'dataDirectory': path.resolve(__dirname, './data'),
        'auth': function(username, password) {

            return Promise.resolve()
                .then(() => {

                    if (username === 'foo' && password === 'bar') {
                        return true;
                    } else if (username === 'labrat' && password === '68FGuksE25UzhAm4') {
                        return {
                            'permissions': {
                                'MKDIR': false
                            }
                        };
                    } else {
                        throw new Error();
                    }

                });

        },
        'rateLimitTTL': 10
    },
    'api': {
        'port': 8000,
        'key': 'yYNR8xeUGtcim7XYaUTsdfmkNuKxLHjw77MbPMkZzKoNdsAzyMryVLJEzjVMHpHM'
    },
    'log': {
        'console': {
            'enabled': true
        },
        'file': {
            'enabled': false,
            'filename':path.resolve(__dirname, 'log/sftp-server.log')
        }
    }
})
    .then((server) => {

        server.on('listening', (data) => {
            // ...
        });

        server.on('login', (data) => {
            // ...
        });

        server.on('upload_complete', (data) => {
            // ...
        });

        server.on('ready', () => {
            // ...
        });

        server.listen();

    })
    .catch((err) => {
        console.log('err', err);
        throw err;
    });

var express = require("express");
var bodyParser = require("body-parser");
var routes = require("./routes/routes.js");
var app = express();

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
const port = process.env.PORT || 3000;

routes(app);

var rServer = app.listen(port, function () {
    console.log("R server app running on port.", rServer.address().port);
});
