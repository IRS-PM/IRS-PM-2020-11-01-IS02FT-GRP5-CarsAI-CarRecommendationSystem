var express = require('express');
var router = express.Router();
var request = require('request');
var mysql = require('mysql');
var dbConfig = require('./db/DBConfig');
var userSQL = require('./db/Usersql');
var fs = require('fs');
var child_process = require('child_process');
const { speed } = require('jquery');

// --------------------配置----------------------
// Using the configurations in DBConfig.js to create an MySql connnetion pool
var pool = mysql.createPool(dbConfig.mysql);

// testing call (for debug)
var responseJSON = function (res, ret) {
    if (typeof ret === 'undefined') {
        res.json({
            code: '-200',
            msg: '错误值'
        });
    } else {
        res.json(ret);
    }
};

// --------------------router----------------------
global.caroutput = "";

// loading main page
router.get('/', function (req, res) {
    caroutput = ""
    res.render('index.html')
})

router.get('/index', function (req, res) {
    caroutput = ""
    res.render('index.html')
})

router.get('/faqs', function (req, res) {
    caroutput = ""
    res.render('faqs.html')
})

router.get('/contact', function (req, res) {
    caroutput = ""
    res.render('contact.html')
})

router.get('/otherservice', function (req, res) {
    caroutput = ""
    res.render('Other services.html')
})

// Displaying car's specifications
router.get('/getCarResult', function (req, res) {
    if (caroutput != ""){
        var _res = res;
        var data = {}
        data.car = caroutput
        data.result = {
            code: 200,
            msg: '搜索结果获取成功'
        };
        setTimeout(function () {
            responseJSON(_res, data)
        }, 200);
    }else{
        console.log('caroutput is null')
    }
})

// Handling dialogflow agent
router.post('/carai', function (req, res) {
    if (!req.body) return res.sendStatus(400)
    // var intent_name = req.body.queryResult.intent.displayName

    if (req.body.queryResult.parameters.distance == 'long'){
        var distance = 1
    }else if (req.body.queryResult.parameters.distance == 'short'){
        var distance = 0
    }else{
        var distance = 2
    }
    if (req.body.queryResult.parameters.speed == 'high'){
        var speed = 1
    }else if (req.body.queryResult.parameters.speed == 'normal'){
        var speed = 0
    }else{
        var speed = 2
    }
    if (req.body.queryResult.parameters.road == 'good'){
        var road = 1
    }else if (req.body.queryResult.parameters.road == 'bad'){
        var road = 0
    }else{
        var road = 2
    }
    if (req.body.queryResult.parameters.economy == 'No'){
        var economy = 0
    }else{
        var economy = 1
    }
    if (req.body.queryResult.parameters.family == 'single'){
        var family = 0
    }else{
        var family = 1
    }
    if (req.body.queryResult.parameters.child == 'No'){
        var child = 0
    }else{
        var child = 1
    }

    // calling python file for recomendation
    var workerProcess = child_process.spawn('python', ['db/svm.py', distance,speed,road,economy,family,child]);

    workerProcess.stdout.on('data', function (data) {
        var carid = data.toString()
        pool.getConnection(function (err, connection) {
            var _res = res;
            var data = {};
            connection.query(userSQL.getcar, [carid], function (err, res, result) {
                if (res) {
                    data.cars = res[0]
                    data.result = {
                        code: 200,
                        msg: 'Found!'
                    };
                    caroutput = data.cars
                    setTimeout(function () {
                        responseJSON(_res, data)
                    }, 200);
                }
                if (err) data.err = err;
                connection.release();
            });
        });
    });

    workerProcess.stderr.on('data', function (data) {
        console.log('stderr: ' + data);
    });

    workerProcess.on('close', function (code) {
        console.log('sub process exists，logOut as: ' + code);
    });
})

module.exports = router