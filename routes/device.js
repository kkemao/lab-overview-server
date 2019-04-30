var express = require('express');
var bodyParser = require('body-parser');
require('../util/date');
var db = require('../db');
var router = express.Router();


var urlencodedParser = bodyParser.urlencoded({ extended: false })

/* GET home page. */
router.get('/', function(req, res, next) {
  var sql = 'SELECT * FROM t_device_info';
  db.do(sql, function(err, rows){
    rows ? res.send({errCode: 0, data: rows}) : res.send({errCode: 1001, data: '查询失败'});
  });
});

router.get('/:id', function(req, res, next) {
  var id = req.params.id;
  var sql = `SELECT
              s.id,
              s.NAME,
              s.PORT,
              s.version,
              s.DESCRIBE,
              s.create_time,
              c.NAME AS comp_name,
              c.id AS comp_id,
              d.ip AS ip,
              d.id AS device_id 
            FROM
              t_server_info s
              LEFT JOIN t_comp_info c ON s.comp_id = c.id
              LEFT JOIN t_device_info d ON s.device_id = d.id 
            WHERE
              s.device_id = ?;`;
    db.dowith(sql, [id], function(err, rows){
      rows ? res.send({errCode: 0, data: rows}) : res.send({errCode: 1001, data: '查询失败'});
    });
});

router.post('/add', async function(req, res, next) {
  var data = req.body;
  console.log(req.body);
  if(!(data.type && data.ip && data.owner)){
    res.send({errCode: 1001, data: '参数不全'});
    return;
  }
  var arr = await checkIP(data.ip);
  
  if(arr && arr.length > 0){
    res.send({errCode: 1001, data: 'IP已存在，请重新修改。'});
    return;
  }
  var sql = `INSERT into t_device_info values(
              null, '${data.type}',
              '${data.ip}',
              '${data.owner}',
              '${new Date().format('yyyy-MM-dd hh:mm:ss')}',
              '${data.version}',
              '${data.describe}')`;
              console.log('zkf', sql);
  db.do(sql, function(err, rows){
    rows ? res.send({errCode: 0, data: rows}) : res.send({errCode: 1001, data: '添加失败'});
  });
});

router.post('/update', async function(req, res, next) {
  var data = req.body;
  console.log(req.body);
  if(!(data.id && data.type && data.ip && data.owner)){
    res.send({errCode: 1001, data: '参数不全'});
    return;
  }
  var arr = await checkIP(data.ip, parseInt(data.id));
  
  if(arr && arr.length > 0){
    res.send({errCode: 1001, data: 'IP已存在，请重新修改。'});
    return;
  }
  console.log('zkf', arr);
  var sql = `update t_device_info t
            set t.type = '${data.type}',
            t.ip = '${data.ip}',
            t.owner = '${data.owner}',
            t.describe = '${data.describe}',
            t.version = '${data.version}'
            where t.id = ${parseInt(data.id)}
            `;
              console.log('zkf', sql);
  db.do(sql, function(err, rows){
    rows ? res.send({errCode: 0, data: rows}) : res.send({errCode: 1001, data: '修改失败'});
  });
});

router.delete('/delete', async function(req, res, next) {
  var data = req.body;
  if(!data.id){
    res.send({errCode: 1001, data: '参数不全'});
    return;
  }
  
var arr = await isUsedInServer(data.id);

if(arr[0].count != 0){
  console.log(arr[0].count);
  res.send({errCode: 1001, data: '该服务器有绑定服务组件，请先删除对应的组件。'});
  return;
}
  var sql = `delete from t_device_info
            where id = ${parseInt(data.id)}
            `;
            console.log(sql);
  db.do(sql, function(err, rows){
    rows ? res.send({errCode: 0, data: rows}) : res.send({errCode: 1001, data: '删除失败'});
  });
});

function checkIP(ip, id) {
  let sql = id ? `select * from t_device_info where ip = '${ip}' and id != ${id}` : `select * from t_device_info where ip = '${ip}'`;
  return db.doPromise(sql).then(function(row){
    return row
  },function (err){
    return err
  });
}

function isUsedInServer(device_id) {
  let sql = `select count(*) as count from t_server_info where device_id = ${device_id}`;
  return db.doPromise(sql).then(function(row){
    return row
  },function (err){
    return err
  });
}
module.exports = router;
