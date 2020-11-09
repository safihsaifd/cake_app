<template>
    <div style="background-color: #eee;">
<!-- 登录页图片 -->
        <router-link to="/" class="regImg">
            <img src="../assets/pubimg/logo.jpg" alt="logo">
        </router-link>
<!-- 手机用户名表单-->
        <div>
            <mt-field 
            type="text" 
            placeholder="请输入手机号码"
            :attr="{maxlength:12}"
            v-model="phone"
            :state="phoneState"
            @blur.native.capture="checkPhone"
            :disabled="isAgree1==false || isAgree2==false">
            </mt-field>   
            <mt-field 
            type="text" 
            placeholder="请输入用户名"
            :attr="{maxlength:12}"
            v-model="username"
            :state="usernameState"
            @blur.native.capture="checkUsername"
            :disabled="isAgree1==false || isAgree2==false">
            </mt-field>   
        </div>
<!-- 两次密码验证表单 -->
        <div style="margin-top:10px">
            <mt-field 
            type="password" 
            placeholder="请输入6-16位密码，区分大小写"
            :attr="{maxlength:16,autocomplete:'off'}"
            v-model="password"
            :state="passwordState"
            @blur.native.capture="checkPassword"
            :disabled="isAgree1==false || isAgree2==false">
            </mt-field>   
            <mt-field 
            type="password" 
            placeholder="请确认密码"
            :attr="{maxlength:16,autocomplete:'off'}"
            v-model="conpassword"
            :state="conpasswordState"
            @blur.native.capture="checkConpassword"
            :disabled="isAgree1==false || isAgree2==false">
            </mt-field>  
        </div>
        <!-- 注册按钮模块 -->
        <div class="regbtn">
            <mt-button type="danger" size="large" @click="reg">注册</mt-button>
            <router-link to="/login" class="rega">登陆</router-link>
            <!-- 条款模块 -->
            <div class="txt login_radio" style="margin-top: 50px;">
                <input type="checkbox" v-model="isAgree1">
                <span>我已阅读
                    <router-link to="/">《服务条款》</router-link>
                    和
                    <router-link to="/">《隐私声明》</router-link>
                </span>
            </div>
            <div class="txt login_radio">
                <input type="checkbox" v-model="isAgree2">
                <span>我希望通过电子邮箱/手机短信了解品诺的最新产品信息</span>
            </div> 
        </div>
    </div>
</template>
<style scope>
/* 登录页图片 */
.regImg{
    display: block;
    width: 100%;
    height: 320px;
    text-align: center;
}
.regImg img{
    width: 100%;
    vertical-align: middle;
}
/* 登陆按钮模块 */
.regbtn{
    box-sizing: border-box;
    width: 100%;
    background-color: #eee;
    padding: 40px 15px;
}
.rega{
    float: right;
    text-decoration: none;
    color: gray;
    margin-top: 15px;
    font-size: 15px;
}
/* 末尾条款样式 */
.txt{
    font-size: 13px;
    padding: .2rem .4rem;
    color: #7f7f7f;
}
.login_radio input{
    width: 18px;
    height: 18px;
    vertical-align: middle;
    margin-right: 5px;
}
.login_radio a{
    color: #199eea;
    text-decoration: none;
}
</style>
<script>
export default {
    data() {
        return {
            phone:'',
            username:'',
            phoneState:'',
            usernameState:'',
            password:'',
            conpassword:'',
            passwordState:'',
            conpasswordState:'',
            isAgree1:false, //开局默认不同意
            isAgree2:false //开局默认不同意
        }
    },
    methods: {
        /*验证登陆手机号格式*/
        checkPhone(){
            let reg=/^1[3-9]\d{9}$/;
             if(reg.test(this.phone)){
                this.phoneState = 'success';
                return true;
            } else {
                this.phoneState = 'error';
                this.$toast({
                message:"手机号为必填项",
                position:"top",
                duration:"2000"
                });
                return false;
            }
        },
        //校验用户名
        checkUsername(){  
            let reg = /^[0-9a-zA-Z_]{6,12}$/;
            if(reg.test(this.username)){
                this.usernameState = 'success';
                return true;
            } else {
                this.usernameState = 'error';
                this.$toast({
                message:"用户名为必填项",
                position:"top",
                duration:"2000"
                });
                return false;
            }
        },
        //校验密码
        checkPassword(){
        //密码的正则表达式
            let reg = /^[0-9A-Za-z]{6,16}$/;
            if(reg.test(this.password)){
                this.passwordState = 'success';
                return true;
            } else {
                this.passwordState = 'error';
                this.$toast({
                message:"密码必须为字母、数字的组合体",
                position:"top",
                duration:"2000"
                });
                return false;
            }
        },
        //校验确认密码
        checkConpassword(){
            if(this.conpassword!=''){
                if(this.password != this.conpassword){
                    this.conpasswordState = 'error';
                    this.$toast({
                    message:"两次密码不一致",
                    position:"top",
                    duration:"2000"
                });
                    return false;
                }else{
                    this.conpasswordState = 'success';
                    return true;
                }
            }else{
                this.conpasswordState = 'error';
                return false;
            }
        },
        //注册函数
        reg(){
            if(this.checkPhone() && this.checkUsername() && this.checkPassword() && this.checkConpassword()){
            //该将获取到的信息提交到WEB服务器
                this.axios.post('/reg','phone='+ this.phone + '&username=' + this.username + '&password=' + this.password).then(res=>{
                    //用户注册成功
                    if(res.data.code == 1){
                        this.$router.push('/login');
                    } else{
                        this.$messagebox('注册提示','手机号已被注册');
                    }
                });
            }
        }
    },
}
</script>