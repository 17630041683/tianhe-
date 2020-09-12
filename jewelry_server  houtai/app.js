// 引入第三方模块
const express = require("express");
const cors = require("cors");
const session = require("express-session")
const mysql = require("mysql");

// 创建连接池
var pool = mysql.createPool({
  host: "127.0.0.1",
  port: 3306,
  user: "root",
  password: "",
  database: "jewelry",
  connectionLimit: 20,
});

// 创建web服务器
var app = express();

// 配置跨域
app.use(
  cors({
    origin: ["http://127.0.0.1:8080", "http://localhost:8080"],
    // 是否每次请求验证
    credentials: true,
  })
);

// 配置session
app.use(session({
  secret: "keyboard cat",
  resave: true,
  saveUninitialized: true,
  cookie: ('name', 'value', { maxAge: 5 * 60 * 1000, secure: false })
}))

// 启动web服务器设置监听端口为4000
app.listen(4000);

//定义异步函数，查询数据库
function getData(sql, params) {
  return new Promise(function (resolve, reject) {
    pool.query(sql, params, (err, result) => {
      if (err) reject(err);
      resolve(result);
    });
  });
}

// 首页发送请求  获取首页数据
app.get("/", (req, res) => {
  var output = {
    fiveimage: [],
    fourimage: [],
    bthreeimage: [],
    sthreeimage: [],
  };
  var sql1 = "select fid,fname,image,aid from jewelry_fiveimage";
  getData(sql1, [])
    .then((result) => {
      output.fiveimage = result;
      // console.log(output.fiveimage);
      var sql2 = "select sid,fname,image,aid from jewelry_fourimage";
      return getData(sql2, []);
    })
    .then((result) => {
      output.fourimage = result;
      // console.log(output.fourimage);
      var sql3 = "select fid,fname,title,image,aid from jewelry_bthreeimage";
      return getData(sql3, []);
    })
    .then((result) => {
      output.bthreeimage = result;
      // console.log(output.bthreeimage);
      var sql4 =
        "select fid,wname,fname,title,subtitle,image,aid,jewelry_id from jewelry_sthreeimage";
      return getData(sql4, []);
    })
    .then((result) => {
      output.sthreeimage = result;
      // console.log(output.sthreeimage);
      res.send(output);
    })
    .catch((err) => {
      throw err;
    });
});

// 获取get请求的id
// 功能一:获取商品列表
app.get("/productList", (req, res) => {
  var id = req.query.aid;
  // console.log(id);
  var sql =
    "select sid,subject,description,image,jewelry_id from jewelry_list where family_id=?";
  pool.query(sql, [id], (error, result) => {
    console.log(result);
    if (error) throw error;
    res.send({ code: 1, message: "查询成功", productlist: result });
  });
});

// 功能二:获取商品详情
app.get("/productdetail", (req, res) => {
  var output = {
    images: [],
    productdetail: [],
    sixdetails: [],
  };
  var id = req.query.jewelry_id;
  // console.log(id);
  var sql =
    "select sid,title,subtitle,price,image,jewelry_id from jewelry_detail where jewelry_id=?";
  getData(sql, [id])
    .then((result) => {
      output.productdetail = result;
      var sql2 =
        "select picture,photo,image,img from jewelry_detail_image where jewelry_id=?";
      return getData(sql2, [id]);
    })
    .then((result) => {
      output.images = result;
      var sql3 =
        "select sid,subject,description,image,jewelry_id from jewelry_list where family_id=4";
      return getData(sql3, []);
    })
    .then((result) => {
      output.sixdetails = result;
      res.send(output);
    })
    .catch((err) => {
      throw err;
    });
});

// 功能三：关于我们
app.get("/about", (req, res) => {
  var output = {
    about: [],
    guanyu: [],
    chanpin: [],
    hezuo: [],
    jiaru: []
  }
  var four_id = req.query.four_id;
  // console.log(four_id);
  var sql = "select sid,title,subtitle from jewelry_guanyu where four_id=?";
  getData(sql, [four_id]).then((result) => {
    output.guanyu = result;
    var sql2 = "select sid,image,title,subtitle from jewelry_chanpin where four_id=?";
    return getData(sql2, [four_id]);
  }).then((result) => {
    output.chanpin = result;
    var sql3 = "select sid,subtitle,image from jewelry_hezuo where four_id=?";
    return getData(sql3, [four_id]);
  }).then((result) => {
    output.hezuo = result;
    var sql4 = "select sid,title,subtitle from jewelry_jiaru where four_id=?";
    return getData(sql4, [four_id]);
  }).then((result) => {
    output.jiaru = result;
    var sql5 = "select sid,title,four_id from jewelry_about";
    return getData(sql5, []);
  }).then(result => {
    output.about = result;
    res.send(output);
  })
    .catch((err) => {
      throw err;
    })
})






















// 用户登录
app.get("/login", (req, res) => {
  var uname = req.query.uname;
  var upwd = req.query.upwd;
  var sql = "select uid from jewelry_user where uname=? and upwd=md5(?)";
  pool.query(sql, [uname, upwd], (err, result) => {
    if (err) throw err;
    if (result.length == 0) {
      res.send({ code: -1, msg: "用户名或密码错误" });
    } else {
      var uid = result[0].uid;
      // req.session.uid = uid;
      // console.log(req.session);
      res.send({ code: 1, msg: "登陆成功", uid: uid });
    }
  })
})

// 验证用户是否存在
app.get("/check", (req, res) => {
  console.log(req.query.uname);
  var uname = req.query.uname;
  var sql = "select uid from jewelry_user where uname=?";
  pool.query(sql, [uname], (err, result) => {
    if (err) throw err;
    // console.log(result);
    if (result.length > 0) {
      res.send({ code: 1, msg: "用户名已存在" });
    } else {
      res.send({ code: -1, msg: "用户名可用" });
    }
  })
})

// 用户注册
app.get("/reg", (req, res) => {
  console.log(req.query);
  var uname = req.query.uname;
  var upwd = req.query.upwd;
  var email = req.query.email;
  var phone = req.query.phone;
  var sql = "insert into jewelry_user values (null,?,md5(?),?,?)";
  pool.query(sql, [uname, upwd, email, phone], (err, result) => {
    if (err) throw err;
    console.log(result);
    if (result.affectedRows > 0) {
      res.send({ code: 1, msg: "注册成功" });
    } else {
      res.send({ code: -1, msg: "注册失败" });
    }
  })
})