var express = require('express');
var bodyParser = require('body-parser');
require('../util/date');
var db = require('../db');
var router = express.Router();


var urlencodedParser = bodyParser.urlencoded({ extended: false })

/* GET home page. */
router.get('/', function(req, res, next) {
  var sql = 'select s.id, s.name, s.port, s.version, s.describe, s.create_time , c.name as comp_name, c.id as comp_id, d.ip as ip, d.id as device_id from t_server_info s left join t_comp_info c on s.comp_id = c.id left join t_device_info d on s.device_id = d.id;';
  db.do(sql, function(err, rows){
    rows ? res.send({errCode: 0, data: rows}) : res.send({errCode: 1001, data: '查询失败'});
  });
});
/* GET home page. */
router.post('/add', function(req, res, next) {
  var data = req.body;
  console.log(req.body);
  if(!(data.name && data.comp_id && data.device_id)){
    res.send({errCode: 1001, data: '参数不全'});
    return;
  }
  var sql = `INSERT into t_server_info values(
              null, '${data.name}',
              ${data.comp_id},
              ${data.device_id},
              '${data.port}',
              '${data.version}',
              '${new Date().format('yyyy-MM-dd hh:mm:ss')}',
              '${data.describe}')`;
              console.log('zkf', sql);
  db.do(sql, function(err, rows){
    rows ? res.send({errCode: 0, data: rows}) : res.send({errCode: 1001, data: '查询失败'});
  });
});

router.post('/update', function(req, res, next) {
  var data = req.body;
  console.log(req.body);
  if(!(data.name && data.comp_id && data.device_id)){
    res.send({errCode: 1001, data: '参数不全'});
    return;
  }
  var sql = `update t_server_info t
            set t.name = '${data.name}',
            t.comp_id = '${data.comp_id}',
            t.device_id = '${data.device_id}',
            t.port = '${data.port}',
            t.describe = '${data.describe}',
            t.version = '${data.version}'
            where t.id = ${parseInt(data.id)}
            `;
            console.log(sql);
  db.do(sql, function(err, rows){
    rows ? res.send({errCode: 0, data: rows}) : res.send({errCode: 1001, data: '修改失败'});
  });
});

router.delete('/delete', function(req, res, next) {
  var data = req.body;
  console.log(req.body);
  if(!data.id){
    res.send({errCode: 1001, data: '参数不全'});
    return;
  }
  var sql = `delete from t_server_info
            where id = ${parseInt(data.id)}
            `;
            console.log(sql);
  db.do(sql, function(err, rows){
    rows ? res.send({errCode: 0, data: rows}) : res.send({errCode: 1001, data: '删除失败'});
  });
});

module.exports = router;
