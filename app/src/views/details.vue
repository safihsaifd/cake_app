<template>
    <div style="background:#F4F4F4">
<!-- 大图片 -->
        <div class="bigpic"><img v-lazy=listpic></div>
<!-- 介绍 -->
        <div class="profile">
            <div class="title">
                <span>{{details.title}}</span>
                <p class="price_wrap">￥{{details.price}}</p>
                <router-link to="/"><img src="../assets/icon/share.png"></router-link>
            </div>
            <div class="vip">
                <p>aha会员尊享多重礼遇</p>
                <p>开通仅¥99 预计可省¥358</p>
                <p>|</p>
                <p>￥99开通</p>
            </div>
            <div class="item_info">
                <div class="spec_selected_show">已选规格: 2-4人食
                    <span class="tobuy">></span>
                </div>
                <div class="spec">
                    <p>{{details.category_name}}</p>
                    <p>
                       甜度<i class="sweet_level"></i>
                    </p>
                </div>
                <p class="Vertical">|</p>
            </div>
        </div>
<!-- 弹出赠品 -->
        <div class="gift" @click="opengift">
            <p>
                <b class="pro_type">赠品</b>
                <span class="promotion_content">{{details.discount}}</span>
                <span class="togift">></span>
            </p>
        </div>
        <div class="promotion_pop" :style="ishow" @click="opengift">
            <div class="pop_inner gift">
                <div>
                    <b class="pro_type">赠品</b>
                    <span class="promotion_content" style="font-weight: 600">{{details.discount}}</span>
                    <div class="giftmore">
                        即日起至2020.11.30，单笔正价购买此蛋糕并选择周五至周日配送，赠「盒子蛋糕」一个，两种口味（巧克力松露/草莓优格）任选。赠品可能会与蛋糕分开配送，请留意分批查收。本活动不与其他优惠同享（如优惠券、蛋糕券、兑换券、储值卡、银行优惠等）。
                    </div>
                </div>
                <div class="close">×</div>
            </div>
        </div>
<!-- 评论 -->
        <div class="comment">
            <ul>
                <li class="comments_li" v-for="(item,index) of comment" :key="index">
                    <h3 class="comment_title">
                        <span class="f_left">{{item.phone}}</span>
                        <span class="f_right">{{item.time}}</span>  
                    </h3>
                    <p class="comment_content">{{item.com}}</p>
                </li>
            </ul>
            <p class="link"><router-link to="/">查看更多评论 ></router-link></p>
        </div>
<!-- 介绍详情 -->
        <div class="details">
            <div class="desc_col">
                <h2>找寻心中的美味</h2>
                <img v-lazy=onepic>
                <p class="goods_intro">{{introduce.topintr}}</p>
            </div>
            <div class="desc_col">
                <h2>严选食材</h2>
                <img v-lazy=twopic>
            </div>
            <div class="desc_col">
                <div class="imgWrap"><img v-lazy=leftpic></div>
                <div class="contentWrap" v-html="introduce.leftintr"></div>
            </div>
            <div class="desc_col">
                <div class="contentWrap" v-html="introduce.rightintr"></div>
                <div class="imgWrap"><img v-lazy=rightpic></div>
            </div>
            <div class="desc_col">
                <h2>关于食用</h2>
                <div class="text_wrap">
                    <p>口味：{{introduce.flavor}}</p>
                    <p>适合人群：大众</p>
                    <p>保鲜条件：冷藏0-4摄氏度</p>
                    <p>食用方法：请收到蛋糕后2-3小时内食用</p>
                    <p class="orange" v-html="introduce.tips"></p>
                </div>
            </div>
            <div class="details desc_col">
                <h2>{{details.title}}</h2>
                <div v-html="details.slogan" class="slogan"></div>
                <p><img src="../assets/pubimg/promise.jpg"></p>
            </div>
        </div>
<!-- 底部选项卡 -->
        <mt-tabbar fixed v-model="tabbar" style="padding:5px 0px">
            <mt-tab-item id="home">
                <img src="../assets/pubimg/shouye1.png" slot="icon">
            </mt-tab-item>
            <mt-tab-item id="kefu">
                <img src="../assets/pubimg/kefu.png" slot="icon">
            </mt-tab-item>
            <mt-tab-item id="buy">
                <img src="../assets/pubimg/buy1.png" slot="icon">
            </mt-tab-item>
            <mt-tab-item id="tobuy">
                <button class="routobuy" @click="addtostore">加入购物车</button>
            </mt-tab-item>
            <mt-tab-item id="tobuy"></mt-tab-item>
        </mt-tabbar>
    </div>
</template>
<style scoped>
/* 展示图片 */
    .bigpic{
        width: 414px;
        height: 414px;
    }
    .bigpic img{
        width: 100%;height: auto;
    }
/* 介绍--标题价格分享 */
    .profile{
        padding: 18px 22px;
        height: 216px;
        background: #fff;
    }
    .profile .title{
        text-align: center;
        vertical-align: middle;
        font-size: 20px;
        padding: 3px 15px;
        margin-bottom: 3px;
        position: relative;
    }
    .title p{
        color: #cea461;
        font-size: 22px;
        padding-top: 15px;
    }
    .title img{
        padding-top:5px;
        position: absolute;
        right: 10px;top:7px;
    }
/* 介绍---会员优惠 */
    .vip{
        background: #F9F9F9;
        box-sizing: border-box;
        padding: 10px 20px;
        margin-top: 15px;
        position: relative;
    }
    .vip p:first-child{
        color: #cea461;
    }
    .vip p:nth-child(2){
        font-size: 12px;
        margin-top: 5px;
    }
    .vip p:nth-child(3){
        position: absolute;
        color: #cea461;
        top: 13px;
        right: 100px;
        font-size: 20px;
    }
    .vip P:last-child{
        color: #cea461;
        font-size: 15px;
        position: absolute;
        right: 20px;
        top: 18px;
    }
/*介绍----规格种类甜度*/
    .item_info{
        margin-top: 15px;
        padding-left: 20px;
        font-size: 14px;
        position: relative;
    }
    .tobuy{
        position: absolute;
        font-size: 25px;
        color: gray;
        right: 8px;top: -5px;
    }
    .spec p{
        margin-top: 6px;
    }
    .Vertical{
        position: absolute;
        left: 5px;top: -2px;
        font-size:16px;font-weight: 600;
        color: red;
    }
/* 赠品模块 */
    .gift{
        margin-top: 10px;
        background: #fff;
        padding: 20px 20px;
        font-size: 13px;
        position: relative;
    }
    .pro_type{
        background: #ff4001;
        color: #ffffff;
        padding: 2px 4px;
        border-radius: 2px
    }
    .promotion_content{
        vertical-align: baseline;
        margin-left: 10px;
    }
    .togift{
        position: absolute;
        font-size: 25px;
        color: gray;
        top: 15px;right: 30px;
    }
    /* 点击弹出的赠品框 */
    /* 整体框架 */
    .promotion_pop{
        position: fixed;
        z-index: 30;
        width: 100%;
        height: 100%;
        left: 0;
        top: 0;
        background: rgba(0, 0, 0, 0.5);
    }
    .pop_inner{
        box-sizing: border-box;
        position: absolute;
        width: 100%;height: 50%;
        left: 0;bottom: 0;
        background: #fff;
        color: #3e3e3e;
        padding: 2rem;
    }
    .giftmore{
        line-height: 1.3;
        margin-top: 0.5rem;
    }
    .close{
        font-weight: 600;
        font-size: 20px;
        position: absolute;
        right: 10px;top: 10px;
    }
/* 评论模块 */
    .comment{
        margin-top: 10px;
        padding:10px 0;
        background: #fff;
    }
    .comment ul{
        white-space: nowrap;
        overflow-x: scroll;
        margin-bottom: 45px;
    }
    .comments_li{
        display: inline-block;
        margin-left: 15px;
        border: 1px solid #d1d1d1;
        border-radius: 3px;
        width: 13rem;
        vertical-align: top;
        padding: 0.8rem;
    }
    .comment_title{
        color: #9c9c9c;
        margin-bottom: 2px;
        font-size: 0.1rem;
    }
    .comment_content{
        overflow: hidden;
        text-overflow: ellipsis;
        word-break: break-all;
        font-size: 13px;
        margin-top: 20px;
    }
    .f_left{float:left !important;}
    .f_right{float:right !important;}
    .link{text-align: center;}
    .link a{
        text-decoration: none;
         color: #9c9c9c;
    }
/* 介绍模块 */
    .details{
        margin-top: 10px;
        background: #fff;
        font-size: 13px;
    }
    .desc_col{
        margin: 0 15px 20px 15px;
    }
    .desc_col h2{
        text-align: center;
        color: #a6906c;
        font-size: 1.2rem;
        padding-top: 20px;
        margin-bottom: 20px;
    }
    .desc_col img{width: 100%;}
    .goods_intro{
        margin: auto;
        width: 70%;
        text-align: justify;/*文本两端对齐*/
    }
    .imgWrap , .contentWrap{
        display: inline-block;
        vertical-align: middle;
        width: 50%;
        max-width: 50%;
    }
    .contentWrap,.text_wrap,.slogan{
        width: 48%;
        text-align: center;
        color: #5f5f5f;
        line-height: 2;
    }
    .text_wrap{
        margin: auto;
        width: 70%;
        text-align: left;
    }
    .orange{color: #ff4001 !important;}
    .slogan{width: 100%;}
/* 甜度 */
    .sweet_level:before{
        position: absolute;
        content: '';
        width: 65px;
        height: 11px;
        margin-top: -5px;
        top: 87%;
        left: 55px;
        background: url(../assets/icon/sweetIcons.png) no-repeat;
        background-size: 132px 11px;
        background-position: -40px 0;
    }
/* 底部选项卡 */
    .routobuy{
        border: 0;
        text-decoration: none;
        background: #ff4001;
        color: #fff;
        font-size: 20px;
        padding: 15px 32px;
        position: absolute;
        right: 1px;
        bottom: 0;
        top: 0;
    }

</style>
<script>
export default {
    data() {
        return {
            details:[],//获取蛋糕详情
            introduce:[],//获取蛋糕介绍
            listpic:'',//开局大图
            onepic:"",//详情介绍第一张图片
            twopic:"",//详情介绍第二张图片
            leftpic:"",//详情介绍左半图片
            rightpic:"",//详情介绍右半图片
            tabbar:'',//默认被选定的顶部选项卡的ID
            comment:[],
            ishow:{display:"none"}
            
        }
    },
    methods: {
        getdetails(){
            let uid=this.$route.query.uid;
            this.axios.get("/details?uid=" + uid).then(res=>{
                this.details=res.data.result;
                this.listpic=require("../assets/cake/"+res.data.result.listpic);
                this.details.smallpic = require('../assets/cake/' + res.data.result.smallpic);
            })
        },
        getintroduce(){
            let uid=this.$route.query.uid;
            this.axios.get("/introduce?uid=" + uid).then(res=>{
                this.introduce=res.data.result;
                this.onepic=require("../assets/details/"+res.data.result.onepic);
                this.twopic=require("../assets/details/"+res.data.result.twopic);
                this.leftpic=require("../assets/details/"+res.data.result.leftpic);
                this.rightpic=require("../assets/details/"+res.data.result.rightpic);
            })
        },
        getcomment(){
            this.axios.get('/comment').then(res=>{
                let data=res.data.result;
                //给电话添加正则重新命名
                data.forEach(item=>{
                    if(item.phone!= null){
                        item.phone=item.phone.substr(0,3) + '****' + item.phone.substr(7);
                    }
                    this.comment.push(item);
                })
            })
        },
        opengift(){//打开关闭赠品弹出框
            let popgift=document.getElementsByClassName("promotion_pop");
            if(this.ishow.display=='none'){
                this.ishow.display='block';
            }else{
                this.ishow.display='none';
            }
        },
        //添加到购物车
        addtostore(){
            this.$store.commit('addcake',this.details);
            this.$store.commit('checkAll');
            this.$router.push('/cart').catch(e=>{});
            console.log(this.$store.state.cart);
        }
    },
    watch: {
        // 底部选项卡跳转 
        tabbar(value){
            if(value == 'home'){
                this.$router.push('/').catch(e=>{});
            }
            if(value == 'buy'){
                this.$router.push('/cart').catch(e=>{});
            }
        }
    },
    mounted() {
        this.getdetails();
        this.getintroduce();
        this.getcomment();
    },
}
</script>