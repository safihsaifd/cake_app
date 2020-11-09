<template>
    <div style="background:#eee;height:736px">
<!-- 头部样式 -->
        <div class="is_login" v-if="this.islogin==1">
            <!-- 头像，账号，等级 && aha标签 -->
            <div class="top">
                <span class="avatar">
                    <img :src="imgStr">
                    <input type="file" name="" class="header-upload-btn" accept="image/*" @change="onchangeImgFun">
                </span>
                <div class="info">
                    <span class="name">{{this.username}}</span>
                    <span class="level">LV.{{this.userlist.level}}</span>
                </div>
            </div>
            <!-- aha值，优惠券，积分 -->
            <div class="wrap">
                <router-link to="/">
                    <p class="num">{{this.userlist.isaha}}</p>
                    <p>aha值返利</p>
                </router-link>
                <router-link to="/">
                    <p class="num">{{this.userlist.isjuan}}</p>
                    <p>我的优惠券</p>
                </router-link>
            </div>
        </div>
<!-- 未登录时样式 -->        
        <div class="is_login" v-else>
            <div class="nologin">
                <router-link to="/login" class="avatar" style="">
                    <img src="../assets/me/avatar.png">
                </router-link>
            </div>
            <div class="nologin">
                <router-link to="/login">
                    <button style="small">登陆</button>
                </router-link>
            </div>
        </div>
<!-- 订单模块 -->
        <div class="orders_module">
            <p class="title">我的订单</p>
            <router-link to="">
                <img src="../assets/me/ka.png">
                <p>待付款</p>
            </router-link>
            <router-link to="">
                <img src="../assets/me/fahuo.png">
                <p>待发货</p>
            </router-link>
            <router-link to="">
                <img src="../assets/me/car.png">
                <p>待收货</p>
            </router-link>
            <router-link to="">
                <img src="../assets/me/dd.png">
                <p>我的订单</p>
            </router-link>
        </div>
<!-- aha会员购买或续费入口 -->
        <div class="aha_module">
            <router-link to="">
                <img src="../assets/me/bg_aha.png" alt="">
            </router-link>
        </div>
<!-- 我的服务 -->
        <div class="orders_module">
            <p class="title">我的服务</p>
            <router-link to="">
                <img src="../assets/me/cake.png">
                <p>生日助手</p>
            </router-link>
            <router-link to="">
                <img src="../assets/me/book.png">
                <p>个人资料</p>
            </router-link>
            <router-link to="">
                <img src="../assets/me/ka.png">
                <p>储值卡优惠</p>
            </router-link>
            <router-link to="">
                <img src="../assets/me/password.png">
                <p>设置密码</p>
            </router-link>
            <router-link to="">
                <img src="../assets/me/kefu.png">
                <p>在线客服</p>
            </router-link>
            <router-link to="">
                <img src="../assets/me/money.png">
                <p>我的发票</p>
            </router-link>
            <router-link to="">
                <img src="../assets/me/our.png">
                <p>关于我们</p>
            </router-link>
            <div class="out" @click="outlogin">
                <img src="../assets/me/our.png">
                <p>退出登陆</p>
            </div>
        </div>
<!-- 底部选项卡 -->
        <bt></bt>
    </div>
</template>
<style scoped>
 /*头部框架  */
    .is_login{
        box-sizing: border-box;
        padding: 2rem 1.7rem;
        background:url(../assets/me/bg.png) repeat-y top center;
        background-size: 100% auto;
    }
/* 头像姓名等级 */
    /* 登陆后 */
    .top{position: relative;}
    .avatar{width: 25%;}
    .avatar img{width: 3.5rem;}
    .header-upload-btn{
        position: absolute;
        width: 5rem;
        left: -0.3rem;top:1rem;
        font-size: 1px;
        opacity: 0;/* 通过定位把input放在img标签上面，通过不透明度隐藏 */
    }
    .info{
        display: inline;
        margin-left: 0.5rem;
    }
    .name{
        font-size: 0.2rem;
        font-weight: bold;
    }
    .level{
        padding: 1px 4px;
        margin-left: 1rem;
        line-height: normal;
        font-size: 9px;
        color: #ffffff;
        background: #a38d6b;
        border-radius: 2px;
    }
/* 登陆前 */
    .nologin{
        text-align: center;
    }
    .nologin :first-child{
        margin-top: 10px;
    }
    .nologin button{
        background: #a38d6b;
        border: 0;
        color: #fff;
        font-size: 12px;
        padding: 0.3rem 1rem;
    }
/* 返利优惠卷 */
    .wrap{
        width: 100%;
        display: flex;
        justify-content: space-around;
        margin-top: 1.5rem;
    }
    .wrap a{
        display: inline-block;
        text-decoration: none;
        color: #000;
        font-size: 0.9rem;
    }
    .num{
         font-weight: bold;
         text-align: center;
         margin-bottom: 0.2rem;
    }
/* 订单模块 */
    .orders_module,.aha_module{
        margin:0.7rem 1.4rem;
        background: #fff;
        border-radius: 5px;
    }
    .title{
        padding: 0.6rem;
        font-size:14px;
        border-bottom: 1px solid #f9f9f9; 
    }
    .out,.orders_module a{
        width: 25%;
        display: inline-block;
        text-decoration: none;
        color: #000;
        font-size: 13px;
        text-align: center;
        padding: 2rem 0;
    }
    .orders_module p{
        margin-top: 0.5rem;
    }
    .aha_module img{
        width: 100%;
    }
</style>
<script>
export default {
    data() {
        return {
            islogin:'',//登陆状态
            userlist:[],//用户信息
            uid:'',//用户id
            username:'',//用户名称
            imgStr:""
        }
    },
    mounted() {
        this.islogin=localStorage.getItem('isLogined');
        this.userlist=JSON.parse(localStorage.getItem('userlist'));
        this.uid=localStorage.getItem('userid');
        //给用户电话隐藏数位
        if(this.islogin==1){
            this.username=this.userlist.phone.substr(0,3) + '****' + this.userlist.phone.substr(7);
            //判断用户是否有头像 否则给与初始头像
            if(this.userlist.headimg==null){
                this.imgStr=require('../assets/me/avatar.png')
            }else{
                //如果有头像 用户头像重新赋值
                this.imgStr=this.userlist.headimg;
            }
        }
    },
    methods: {
        // 退出登陆时 清楚登陆缓存
        outlogin(){
            window.localStorage.removeItem("userlist");
            window.localStorage.removeItem("userid");
            window.localStorage.removeItem("isLogined");
            location.reload() //刷新
        },
        onchangeImgFun(e){
            //获取图片信息
            var file = e.target.files[0];
            console.log(file);
            // 获取图片的大小，做大小限制有用
            let imgSize=file.size;
            // this指向问题，所以在外面先定义
            var _this=this;
            if(imgSize<=10*1024){
                var reader=new FileReader();
                //开始读取指定的reader中的内容。
                //一旦完成，result属性中将包含一个data: 
                //URL格式的Base64字符串以表示所读取文件的内容。
                reader.readAsDataURL(file);
                //处理loadend事件。该事件在读取操作结束时（要么成功，要么失败）触发。
                reader.onloadend=function(){
                    var dataURL=reader.result;
                    console.log(dataURL);
                    _this.imgStr=dataURL;
                    //Base64中的+号传输到后端会变为空格 先转为%2B
                    let img=dataURL.replace(/\+/g,"%2B");
                    // 向服务器提交修改        
                    _this.axios.post('/updateimg','dataURL='+ img + '&uid=' + _this.uid).then(res=>{
                        let data=res.data.result;
                        if(data.affectedRows==1){
                            console.log('修改成功')
                        }else{
                            console.log('修改失败')
                        }
                    })
                    //重新给缓存赋值
                    _this.userlist.headimg=dataURL;
                    localStorage.setItem('userlist',JSON.stringify(_this.userlist));
                }
            }else{
                 this.$messagebox('图片大小超出范围，请重新上次头像');
            }
        }
    },
}
</script>


