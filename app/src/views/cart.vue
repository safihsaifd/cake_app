<template>
    <div>
<!-- 购物车box -->
        <!-- 未选择商品时候 -->
        <div class="no_content" v-if="this.cart.length==0">
            <img src="../assets/pubimg/empty.png">
            <p>您还没有选购您的商品</p>
        </div>
        <!-- 选购后样式 -->
        <div class="yes_content" v-else v-for="(item,index) of cart" :key="index">
            <div class="ischeck">
                <input type="checkbox" class="checkbox checkone" name="checkone"
                :checked=checkArry[index] @click="changecheck(index)">
            </div>
            <div class="cart_img">
                <img v-lazy="item.smallpic">
            </div>
            <div class="cart_message">     
                <h2 class="title">{{item.title}}</h2>
                <h2 class="fork">每份含餐具5套</h2>
                <div class="add_delete">
                    <span class="price" style="color:rgb(255, 64, 1);">￥{{item.price}}</span>
                    <div class="threebtn">
                        <button @click="deletecake(index)"><img src="../assets/icon/delete.png"></button>
                        {{cakenumber[index]}}
                        <button style="color:a38d6b" @click="addnumber(index)">+</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- 有商品时候 -->
<!-- 推荐商品标题 -->
        <div class="division">
            <h2>推荐商品</h2>
            <h3>Sincerely Recommend</h3>
        </div>
<!--推荐商品 -->
        <div class="box cake">
            <mt-tab-container class="list">
                <mt-tab-container-item class="listbox">
                    <div v-for="(item,index) of cake" :key="index">
                        <router-link :to="{path:'/details',query:{uid:item.uid}}">
                             <img v-lazy="item.smallpic">
                        </router-link>
                        <p class="item_name">{{item.title}}</p>
                        <span class="tag">{{item.introduce}}</span>
                        <p class="recommend_reason">{{item.discount}}</p>
                        <p class="price">￥{{item.price}}</p>
                        <button type="primary" class="btnbuy" @click="addstore(item)">+</button>
                    </div>
                </mt-tab-container-item>
            </mt-tab-container>
        </div>
<!--购物车有内容时候，底部样式  -->
        <div class="math" v-if="cart.length>0">
            <div class="selectall">
                <input type="checkbox" class="checkbox checkall" :checked=checkAllstate @click="choseAll">
                <span>全选</span>
            </div>
            <div class="allmoney">
                <span>应付:
                    <strong class="orange">￥{{priceall}}</strong>
                </span>
                <button>结算</button>
            </div>
        </div>
        <div v-else></div>
<!-- 底部样式 -->
        <bt></bt>
    </div>
</template>
<style scoped>
/*未选择商品时 头部框体样式*/
    .no_content{
        text-align: center;
        position: relative;
        height: 15rem;
    }
    .no_content img{
        position: absolute;
        width: 5.3rem;
        left: 40%;top: 4rem
    }
    .no_content p{
        position: absolute;
        font-size: 0.6rem;
        color: #9c9c9c;
        left: 37%;top: 10.5rem;
    }
/* 选择商品后样式 */
    .yes_content{
        display: flex;
        justify-content: space-around;
        flex-wrap: wrap;
        margin-bottom: 1rem;
    }
    .ischeck{
        width: 15%;
        text-align: center;
        padding-top: 45px;
    }
    .cart_img{
        width: 25%;
    }
    .cart_img img{
        width: 100%;
    }
    .cart_message{
        width: 50%;
        position: relative;
    }
    .title{
        font-size: 14px;
        padding: 5px 0;
    }
    .fork{
        font-size: 10px;
        color: #9e9e9e;
    }
    .add_delete{
        position: absolute;
        bottom: 0;width: 100%;
    }
    .threebtn{
        float: right;
    }
/* 推荐商品标题样式 */
    .division{
        border-top: 1px solid #d1c6af;
        padding: 1rem 0 1.4rem;
        margin: 0 1.3rem;
        color: #a38d6b;
        text-align: center
    }
    .division h2{
        font-weight: bold;
        font-size: 17px;
        line-height: 50px;
        height: 50px;
    }
    .division h3{
        font-weight: normal;
        font-size: 13px;
    }
/* 推荐商品列表 */
    .cake{margin-bottom: 70px;}
    .listbox{
        width: 100%;
        display: flex;
        flex-wrap: wrap;
        justify-content: space-between;
    }
    .listbox>div{
        width: 48%;
        margin-bottom: 40px;
    }
    .box{
        box-sizing: border-box;
        width: 100%;
        padding: 1rem 1rem 0;
    }
    .box img{width: 100%;}
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
        float: left;
    }
    .btnbuy{
        background:orangered;
        border: 0;border-radius: 10%;
        color: #ffffff;padding: 0 4px;
        float: right;
    }
/*复选框样式  */
    .checkbox{
        width: 18px;height: 18px;
    }
/* 结算框体 */
    .math{
        position: fixed;
        z-index: 100;
        left: 0;bottom: 50px;
        width: 100%;height: 50px;
        display: flex;
        justify-content: space-between;
        align-items: center;
        background: #ffffff;
    }
    .selectall input{
        margin-left: 1rem;
    }
    .selectall span{
        margin-left: 0.7rem;
        position: absolute;
    }
    .allmoney span{
        display:inline-block;
        font-size: 14px;
        margin-right: 0.7rem; 
    }
    .orange{
        color: #ff4001 !important;
        font-weight: bold;
    }
    .allmoney button{
        width: 90px;
        height: 50px;
        background: #ff4001 !important;
        border: none;color: #ffffff;
    }

</style>
<script>
import {mapState,mapMutations,mapGetters} from 'vuex'
export default {
    data() {
        return {
            cake:[],//存储蛋糕列表
            isrepeat:0,//验证点推荐商品+号后 验证当前商品是否已加入购物车
            ischeckall:0,
        }
    },
    computed:{
        ...mapState([
            'cart',//购物车列表
            'cakenumber',//购物车某一蛋糕数量
            'checkArry',//复选框存储数组
            'checkAllstate'
        ]),
        ...mapGetters([
            'priceall',//购物车总价格返回值
        ])
    },
    methods: {
        //获取推荐商品
        getcake(){
            //显示加载提示框
            this.$indicator.open({
                text:'加载中...',
                spinnerType:'double-bounce'
            });
            //请求首页展示蛋糕数据
            this.axios.get('/cake').then(res=>{
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
        //点击推荐商品+号，添加商品到store 或者 添加数量
        addstore(cake){
            //提交蛋糕数据到vuex搬运函数
            this.isrepeat=0;//每次点击时 先把标识符归0
            let a=this.cart;//把缓存的蛋糕列表给a数组 为后续判断做模板
            if(a.length==0){
                this.$store.commit('addcake',cake);
                this.$store.commit('checkAll');
            }else{
                //循环验证是否已经存在此商品，若存在 只加数量 不添加新栏
                for(let i=0;i<a.length;i++){
                    if(cake.title==a[i].title){
                        this.addnumber(i);
                        this.isrepeat=1;//然后把存在标识符变为1 让后续判断不再重新新建蛋糕
                        break;//结束循环
                    }
                }
                if(this.isrepeat!=1){//如果循环完毕都不重复 标识符为0 新建蛋糕
                    this.$store.commit('addcake',cake);
                    this.$store.commit('checkAll');
                }
            }
        },
        //点击购物车垃圾箱，删除某一商品
        deletecake(id){
            //提交蛋糕数据到vuex搬运函数
            this.$store.commit('delete',id);
        },
        //点击购物车某一栏蛋糕+号，数量增加
        addnumber(id){
            //提交蛋糕id到vuex，修改index下标蛋糕数量
            this.$store.commit('addnumber',id);
            // this.$forceUpdate();//强制刷新
        },
        //点击单独商品复选框后 改变checkArry里对应的值
        changecheck(id){
            this.$store.commit('changecheck',id);
            this.$store.commit('checkAll');
        },
        //选择全选框后 勾选购物车里所有商品
        choseAll(){
           this.$store.commit('choseAll');
        },
    },
    watch: {
    },
    mounted() {
        this.getcake();
        console.log(this.$store.state.cart);
    },
    
}
</script>
