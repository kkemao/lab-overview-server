var express = require('express');
var bodyParser = require('body-parser');
require('../util/date');
var db = require('../db');
var router = express.Router();


var urlencodedParser = bodyParser.urlencoded({ extended: false })

/* GET home page. */
router.get('/', function(req, res, next) {
  var sql = 'select * from t_comp_info';
  db.do(sql, function(err, rows){
    rows ? res.send({errCode: 0, data: rows}) : res.send({errCode: 1001, data: '查询失败'});
  });
});

module.exports = router;
