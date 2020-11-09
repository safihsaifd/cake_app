<template>
    <div>
<!--头部导航栏  -->
        <mt-header class="header">
            <div slot="left" class="shortcut">
                <img src="../assets/icon/point.png" alt="">
                <mt-button to="/reg">成都</mt-button>
            </div>
            <div slot="right" class="centerselect">
               <mt-navbar v-model="active">
                    <mt-tab-item type="primary" v-for="(item,index) of category" :key="index"
                    :id="item.category_id.toString()">
                    {{item.category_name}}</mt-tab-item>
               </mt-navbar>
            </div>
            <div slot="right" class="shortcut">
                <mt-button type="primary" @click="openselect">筛选</mt-button>
            </div>
        </mt-header>
<!-- 弹出筛选框体  -->
        <div class="select" :style="ishow">
            <div @click="openselect" class="left_blackbox"></div>
            <!-- 右边白色选择框 -->
            <div class="right_whitebox">
                <h2 class="text-style">筛选</h2>
                <p class="text-style">口味</p>
                <ul>
                    <li v-for="(item,index) of selectlist" :key="index" @click="putselect(item,index)"
                    :class="{border:index==current}">
                        {{item}}
                    </li>
                </ul>
                <div class="btn">
                    <button @click="clearselect">重置</button>
                    <button @click="toselect">确认</button>
                </div>
            </div>
        </div>
<!-- 首页大图片 -->
        <div class="box">
            <img src="../assets/pubimg/zeroSugarBanner.jpg" alt="展示图片">
        </div>
<!-- 列表详情 -->
        <div class="box cake">
            <mt-tab-container class="list" v-model="active">
                <mt-tab-container-item class="listbox" :id="active.toString()">
                    <div v-for="(item,index) of cake" :key="index">
                        <router-link :to="{path:'/details',query:{uid:item.uid}}">
                             <img v-lazy="item.smallpic">
                        </router-link>
                        <p class="item_name">{{item.title}}</p>
                        <span class="tag">{{item.introduce}}</span>
                        <p class="recommend_reason">{{item.discount}}</p>
                        <p class="price">￥{{item.price}}</p>
                    </div>
                </mt-tab-container-item>
            </mt-tab-container>
        </div>
<!-- 底部选项卡 -->
        <bt></bt>
    </div>
</template>
<style scoped>
/*头部导航栏*/ 
    .shortcut button{ 
        display:inline-block;  
        color:#000;
    }
    .header{
        background: #fff;
        padding: 0 10px;
        border-bottom: 1px solid #000;
        font-size: 13px;
        height: 35px;
        position: relative;
    }
    .centerselect{
        position: absolute;
        left: 35%;
        bottom: 5%;
    }
    .centerselect a{
        text-decoration: none;
        color: #000;
        margin-right: 2rem;
        height: 2px;
        background: transparent;
    }
    .mint-navbar .mint-tab-item.is-selected {
    border-bottom: 0px;
    color:  #ff4001;;
    }
/* 搜索框 */
    .select{
        width: 100%;
        height: 100%;
        position: fixed;
        left: 0;top: 0;
        z-index: 100;
        background: rgba(0, 0, 0, 0.6);
    }
    .left_blackbox{
        position: absolute;
        width: 28%;height: 100%;
        left: 0;top: 0;
    }
    .right_whitebox{
        position: absolute;
        width: 72%;height: 100%;
        right: 0;
        top: 0;
        background: #ffffff;
    }
    .text-style{
        font-size: 0.9rem;
        height:2.5rem;
        line-height: 2.5rem;
        padding-left: 1rem;
    }
    .right_whitebox h2{
        color: #a38d6b;
        border-bottom: 1px solid #d1c6af;
    }
    .right_whitebox>p{
        padding: 0.4rem 1rem;
        color: #939393;
    }
    .right_whitebox ul{
        display: flex;
        flex-wrap: wrap;
    }
    .right_whitebox li{
        width: 29%;cursor: pointer;
        text-align: center;
        color: #9c9c9c;font-size: 0.9rem;
        padding: 0.5rem 0;
        border: 1px solid #eee;
        margin-left: 0.5rem;margin-bottom: 0.5rem;
        border-radius: 2px;
    }
    .right_whitebox .border{
       border-color: #a38d6b;
    }
    .btn{
        position: absolute;
        bottom: -252px;right: 0;padding: 0;
    }
    .btn button{
        width: 50%;
        padding:0.6rem 0;
        border-radius: 0px;
        border: 0px;  
        border-top: 1px solid #a38d6b;
        font-size: 14px;
    }
    .btn :first-child{color: #a38d6b;}
    .btn :last-child{
        color: #fff;
        background: #a38d6b;
    }
/*首页大图片*/ 
    .box{
        box-sizing: border-box;
        width: 100%;
        padding: 1rem 1rem 0;
    }
    .box img{width: 100%;}
/*列表*/
    .cake{margin-bottom: 70px;}
    .listbox{
        width: 100%;
        display: flex;
        flex-wrap: wrap;
        justify-content: space-between
    }
    .listbox>div{
        width: 48%;
        margin-bottom: 10spx;
    }
/* 单块样式 */
    .item_name{
        font-size: 12px;
        line-height: 16px;
        overflow: hidden;
        padding: 0.1rem 0;
    }
    .tag{
        max-height: 14px;
        overflow: hidden;
        font-size: 10px;
        line-height: 1;
        padding: 0 2px;
        color: #ffffff;
        border-radius: 2px;
        background: #cea461;
    }
    .recommend_reason{
        margin-top: 2px;
        font-size: 10px;
        line-height: 12px;
        max-height: 24px;
        overflow: hidden;
        color: #9c9c9c;
    }
    .price{
        font-size: 14px;
        color: #cea461;
        margin-top: 5px;
    }
</style>
<script>
export default {
    data() {
        return {
            category:[],//存储头部分类
            cake:[],//存储蛋糕列表
            selectlist:['全部','雪域口味','巧克力口味','芝士口味','慕斯口味'],//筛选框分类
            active:'1',//动态绑定导航栏和主体框架的切换
            flavor:'全部',//筛选的口味条件
            ishow:{display:"none"},//选择框是否显示
            current:'0'//样式绑定
        }
    },
    methods: {
        getlist(cid,flavor){
            //显示加载提示框
            this.$indicator.open({
                text:'加载中...',
                spinnerType:'double-bounce'
            });
            //请求首页展示蛋糕数据
            this.axios.get('/list?cid=' + cid +`&flavor=` + flavor).then(res=>{
                let data = res.data.result;
                //重新给图片地址赋值
                data.forEach(item=>{
                if(item.smallpic != null){
                    item.smallpic = require('../assets/cake/' + item.smallpic);
                }
                this.cake.push(item);
                })
                //关闭加载提示框
                this.$indicator.close();
            });
        },

        //获取头部导航卡数据
        getcategory(){
            this.axios('/category').then(res=>{
                this.category=res.data.result;
            })
        },
        //显示/隐藏筛选框体
        openselect(){
            if(this.ishow.display=='none'){
                this.ishow.display='block';
            }else{
                this.ishow.display='none';
                sessionStorage.removeItem("flavor");
            }
        },
        //暂时提交搜索信息到session Storage//与border样式
        putselect(item,index){
            sessionStorage.setItem('flavor',item);
            this.current=index;
        },
        //点击重置 清除session Storage//与border样式
        clearselect(){
           sessionStorage.removeItem("flavor");
           this.current='0';
        },
        //点击确定 提交筛选 得到结果
        toselect(){
            //获取暂时缓存 并切割掉“”
            this.flavor=JSON.stringify(sessionStorage.getItem('flavor')).slice(1,-1);
            //清除之前可保存的文章数据
            this.cake= [];
            this.getlist(this.active,this.flavor);
        }
    },
    watch: {
        //监听顶部选项卡
        active(){
            //清除之前可保存的文章数据
            this.cake= [];
            this.getlist(this.active,this.flavor);
        }
    },
    mounted() {
        this.getlist(this.active,this.flavor);
        this.getcategory();
    },   
}
</script>

