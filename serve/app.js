//导入必要3大模块
const express=require("express");
//引用cors跨域
const cors = require('cors');
//引用数据库
const mysql=require("mysql");
//引用解析组件
const bodyParser=require("body-parser");
//引用加密模块
const md5=require("md5");
//启用express
const app=express();
//使用body-parser将post请求数据解析为对象
app.use(bodyParser.urlencoded({
	extended:false
}));
//连接数据库
const pool=mysql.createPool({
	host:'127.0.0.1',
	port:'3306',
	user:'root',
	password:'',
	database:'dangao',
	connectionLimit:20
});
//应用cors跨域
app.use(cors());

//开始写接口
//首页大轮播图接口
app.get('/getlun1',(req,res)=>{
	let sql='select * from lunbo where uid<5';
	pool.query(sql,(err,result)=>{
		if(err) throw err;
		res.send({message:'查询成功',code:1,result:result});
	})
})

//首页小轮播图接口
app.get('/getlun2',(req,res)=>{
	let sql='select * from lunbo where uid>4';
	pool.query(sql,(err,result)=>{
		if(err) throw err;
		res.send({message:'查询成功',code:1,result:result});
	})
})

//首页蛋糕信息
app.get('/cake',(req,res)=>{
	let sql="select uid,bigpic,smallpic,title,price,introduce,discount from cake";
	pool.query(sql,(err,result)=>{
		if(err) throw err;
		res.send({message:'查询成功',code:1,result:result});
	})
})

//获取列表展示页蛋糕信息
app.get('/list',(req,res)=>{
	let cid=req.query.cid;
	let flavor=req.query.flavor;
	if(cid==1){
		if(flavor=='全部'){
			let sql='select uid,smallpic,title,price,introduce,discount from cake';
			pool.query(sql,(err,result)=>{
				if(err) throw err;
				res.send({message:'查询成功',code:1,result:result});
			})
		}else{
			let sql='select uid,smallpic,title,price,introduce,discount from cake where flavor = ?';
			pool.query(sql,[flavor],(err,result)=>{
				if(err) throw err;
				res.send({message:'查询成功',code:1,result:result});
			})
		}
	}else{
		if(flavor=='全部'){
			let sql='select uid,smallpic,title,price,introduce,discount from cake where category_id = ?';
			pool.query(sql,[cid],(err,result)=>{
				if(err) throw err;
				res.send({message:'查询成功',code:1,result:result});
			})
		}else{
			let sql='select uid,smallpic,title,price,introduce,discount from cake where category_id = ? and flavor = ?';
			pool.query(sql,[cid,flavor],(err,result)=>{
				if(err) throw err;
				res.send({message:'查询成功',code:1,result:result});
			})
		}
	}
})

//获取蛋糕分类表
app.get('/category',(req,res)=>{
	let sql="select category_id,category_name from category";
	pool.query(sql,(err,result)=>{
		if(err) throw err;
		res.send({message:'查询成功',code:1,result:result});
	})
})

//获取蛋糕详情页信息
app.get('/details',(req,res)=>{
	let uid=req.query.uid;
	let sql="select listpic,smallpic,title,price,category_name,introduce,discount,slogan from cake where uid=?";
	pool.query(sql,[uid],(err,result)=>{
		if(err) throw err;
		res.send({message:'查询成功',code:1,result:result[0]});
	})
})

//获取蛋糕详情页下方介绍内容
app.get('/introduce',(req,res)=>{
	let uid=req.query.uid;
	let sql="select * from introduce where uid=?";
	pool.query(sql,[uid],(err,result)=>{
		if(err) throw err;
		res.send({message:'查询成功',code:1,result:result[0]});
	})
})

//取出评论消息
app.get('/comment',(req,res)=>{
	let sql='select * from comment';
	pool.query(sql,(err,result)=>{
		if(err) throw err;
		res.send({message:'查询成功',code:1,result:result});
	})
})

//手机登陆接口
app.post("/phoneLogin",(req,res)=>{
	let phone=req.body.phone;
	let password=md5(req.body.password);
	let sql="select * from user where phone=? and password=?";
	pool.query(sql,[phone,password],(err,result)=>{
	  if(err) throw err;
	  console.log(result);
	  if(result.length==1){
		res.send({message:"登陆成功",code:1,result:result[0]})
	  }else{
		res.send({message:"登陆失败",code:0})
	  }
	})
})
//用户名登陆接口
app.post("/userLogin",(req,res)=>{
	let username=req.body.username;
	let password=md5(req.body.password);
	let sql="select * from user where username=? and password=?";
	pool.query(sql,[username,password],(err,result)=>{
	  if(err) throw err;
	  console.log(result);
	  if(result.length==1){
		res.send({message:"登陆成功",code:1,result:result[0]})
	  }else{
		res.send({message:"登陆失败",code:0})
	  }
	})
})
//注册接口
app.post("/reg",(req,res)=>{
	let phone=req.body.phone;
	let username=req.body.username;
	let password=req.body.password;
	let sql="select uid from user where phone=? and username=?";
	pool.query(sql,[phone,username],(err,result)=>{
	  if(err) throw err;
	  if(result.length==0){
		sql="insert into user(phone,username,password) values(?,?,MD5(?))";
		pool.query(sql,[phone,username,password],(err,result)=>{
			if(err) throw err;
			res.send({message:"注册成功",code:1,result:result});
		})
		}else{
			res.send({message:"注册失败",code:0});
		}
	})
});
app.post("/updateimg",(req,res)=>{
	let headimg=req.body.dataURL;
	let uid=req.body.uid;
	let sql='update user set headimg=? where uid=?';
	pool.query(sql,[headimg,uid],(err,result)=>{
		if(err) throw err;
		res.send({message:"修改成功",code:1,result:result});
	})
})

//连接服务器
app.listen(5050,()=>{
  console.log('server is running...');
});