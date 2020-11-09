<template>
    <div style=" background-color: #eee;">
<!-- 登录页图片 -->
        <router-link to="/home" class="logoImg">
            <img src="../assets/pubimg/logo.jpg" alt="logo">
        </router-link>
<!-- 输入框 -->
        <div v-if="this.active%2==0">
            <mt-field type="text"
            placeholder="请输入手机号码"
            :attr="{maxlength:11}"
            v-model="phone"
            :state="phoneState"
            @blur.native.capture="checkPhone">
            </mt-field>
            <mt-field style="margin-top:10px"
            type="password" 
            placeholder="请输入密码"
            :attr="{maxlength:20,autocomplete:'off'}"
            v-model="password"
            :state="passwordState"
            @blur.native.capture="checkPassword">
            </mt-field>
        </div>
        <div v-else>
            <mt-field type="text"
            placeholder="请输入用户名"
            :attr="{maxlength:16}"
            v-model="username"
            :state="usernameState"
            @blur.native.capture="checkUsername">
            </mt-field>
            <mt-field style="margin-top:10px"
            type="password" 
            placeholder="请输入密码"
            :attr="{maxlength:20,autocomplete:'off'}"
            v-model="password"
            :state="passwordState"
            @blur.native.capture="checkPassword">
            </mt-field>
        </div>
<!-- 登陆按钮 -->
        <div class="btn">
            <div v-if="this.active%2==0">
                <mt-button type="danger" size="large" @click="phone_login">登陆</mt-button>
                <mt-button type="danger" size="large" style="margin-top:10px" plain v-model="active" @click="toswitch">用户名快捷登陆</mt-button>
            </div>
            <div v-else>
                <mt-button type="danger" size="large" @click="user_login">登陆</mt-button>
                <mt-button type="danger" size="large" style="margin-top:10px" plain v-model="active" @click="toswitch">手机号快捷登陆</mt-button>
            </div>
            <div class="btn_rout">
                <router-link to="/reg">注册账号</router-link>
                <router-link to="/">忘记密码</router-link>
            </div>      
        </div>
    </div>
</template>
<style>
 /* 登录页图片 */
.logoImg{
    display: block;
    width: 100%;
    height: 340px;
    text-align: center; 
}
.logoImg img{
    width: 100%;height: 100%;
    vertical-align: middle;
}
/* 登陆按钮模块 */
.btn{
    box-sizing: border-box;
    width: 100%;height: 290px;
    padding: 40px 15px;
}
.btn_rout{
    display: flex;
    justify-content: space-between;
    margin-top: 30px;
}
.btn_rout a{
    color: gray;
    text-decoration: none; 
}
</style>
<script>
export default {
    data() {
        return {
            phone:'',/*登陆手机号*/
            password:'',/*登陆密码*/
            username:'',/*登陆用户名*/
            usernameState:'',/*登陆用户名状态*/
            phoneState:'',/*登陆手机状态*/
            passwordState:'',/*登陆密码状态*/
            active:"2",//绑定切换样式
        }
    },
    methods: {
        /*验证登陆手机号格式*/
        checkPhone(){
            let reg=/^1[3-9]\d{9}$/;
             if(reg.test(this.phone)){
                this.phoneState = 'success';
                return true;
            }else{
                this.phoneState = 'error';
                this.$toast({
                message:"用户名为必填项",
                position:"top",
                duration:"2000"
                });
                return false;
            }
        },
        //校验用户名
        checkUsername(){  
        let reg = /^[0-9a-zA-Z_]{4,16}$/;
        if(reg.test(this.username)){
            this.usernameState = 'success';
            return true;
        }else{
            this.usernameState = 'error';
            this.$toast({
            message:"用户名为必填项",
            position:"top",
            duration:"2000"
            });
            return false;
        }
        },
        /*验证登陆密码格式*/
        checkPassword(){
            //密码的正则表达式 零宽断言 密码必须有一位大写字母和数字
            let reg =/^(?![0-9a-z]+$)(?![A-Za-z]+$)[0-9A-Za-z]{4,20}$/;
            if(reg.test(this.password)){
                return true;
            } else {
                this.$toast({
                message:"密码必须为包含字母、数字的组合体",
                position:"top",
                duration:"2000"
                });
                return false;
            }
        },
        /*使用手机号登陆 */
        phone_login(){
            if(this.checkPhone() && this.checkPassword()){
                //该将获取到的信息提交到WEB服务器
                let obj = {
                    phone:this.phone,
                    password:this.password
                }
                this.axios.post('/phoneLogin',this.qs.stringify(obj)).then(res=>{
                    //如果用户登录成功
                    if(res.data.code == 1){
                    //提交Mutations
                    this.$store.commit('logined');
                    //往webstorage中存储呢,因为用户刷新后数据依然要保持
                    localStorage.setItem('isLogined','1');
                    //存储住登陆用户信息//取的时候直接用getItem拿就好了
                    localStorage.setItem('userlist',JSON.stringify(res.data.result));// 使用json字符串进行数据格式存取
                    //存储用户id
                    localStorage.setItem('userid',JSON.stringify(res.data.result.uid));// 使用json字符串进行数据格式存取
                    this.$store.commit('uid');
                    //成功登陆后及时改变购物车状态
                    this.$store.commit('changecart');
                    //登陆成功跳转
                    this.$router.push('/');
                    } 
                    else{
                        this.$messagebox("登录提示","手机号或密码错误");
                    }
                })
            }
        },
        /*使用用户名登陆 */
        user_login(){
            if(this.checkUsername() && this.checkPassword()){
                //该将获取到的信息提交到WEB服务器
                let obj = {
                    username:this.username,
                    password:this.password
                }
                this.axios.post('/userLogin',this.qs.stringify(obj)).then(res=>{
                    //如果用户登录成功
                    if(res.data.code == 1){
                    //提交Mutations
                    this.$store.commit('logined');
                    //往webstorage中存储呢,因为用户刷新后数据依然要保持
                    localStorage.setItem('isLogined','1');
                    //存储住登陆用户信息//取的时候直接用getItem拿就好了
                    localStorage.setItem('userlist',JSON.stringify(res.data.result));// 使用json字符串进行数据格式存取
                    //存储用户id
                    localStorage.setItem('userid',JSON.stringify(res.data.result.uid));// 使用json字符串进行数据格式存取
                    this.$store.commit('uid');
                    //成功登陆后及时改变购物车状态
                    this.$store.commit('changecart');
                    //登陆成功 跳转页面
                    this.$router.push('/');
                    } 
                    else{
                        this.$messagebox("登录提示","用户名或密码错误");
                    }
                })
            }
        },
        /*切换到用户名(手机)登陆*/
        toswitch(){
            this.active++;
        }
    },
}
</script>