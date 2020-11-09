<template>
  <div style="background: #f8f8f8;">
    <!-- 首页大轮播图 -->
    <lunbo></lunbo>
    <!-- 会原心享俱乐部 -->
    <hf></hf>
    <!-- 首页小轮播图 -->
    <lunbo2></lunbo2>
    <!-- 开始蛋糕展示 -->
    <h2 class="h2text">
      <span>
      -蛋糕推荐-
      </span>
    </h2>
    <!-- 蛋糕展示跳转 -->
    <div class="item" v-for="(item,index) of cake" :key="index">
      <router-link :to="{path:'/details',query:{uid:item.uid}}">
        <img v-lazy=item.bigpic>
      </router-link>
      <div class="goods_desc" style="color: #000;">
        <p class="name">{{item.title}}</p>
        <p class="recommend_reason" style="font-size:13px">{{item.introduce}}</p>
      </div>
    </div>
    <!-- 卡劵模块 -->
    <div class="section_others">
      <router-link to="/">
      <img src="../assets/icon/jiaohuan.png" alt="">
      <p>企业兑换</p>
      </router-link>
      <router-link to="/">
      <img src="../assets/icon/kajuan.png" alt="">
      <p>卡劵绑定</p>
      </router-link>
      <router-link to="/">
      <img src="../assets/icon/people.png" alt="">
      <p>银行活动</p>
      </router-link>
    </div>
    <!-- 热门评论h2 -->
    <div>
      <h2 class="h2text">-热门评论-</h2>
    </div>
    <!-- 公司信息 -->
    <div class="section_lecake_info">
      <div class="device_type ">
        <router-link to="/">电脑板</router-link>
        <router-link to="/">网站公告</router-link>
        <router-link to="/">经营资质</router-link>
      </div>
      <h3 class="copyright">
        <span>copyright © 2010-2020  诺心lecake.com版权所有</span><br>
        <span>诺心食品（上海）有限公司   沪ICP备10211730号</span>
      </h3>
    </div>
    <!-- 底部选项卡 -->
    <bt></bt>
  </div>
</template>
<style>
/* 蛋糕模块开始标题 */
  .h2text{
    margin-top: 20px;
    margin-bottom: 15px;
    text-align: center;
    font-weight: 600;
  }
/* 蛋糕模块 */
  .item{
    position: relative;
    margin-top: 5px;
    width: 100%;height: 276px;
  }
  .item img{
    width: 100%;height: auto;
  }
  .goods_desc{
    position: absolute;
    left: 15px;
    top: 20px;
    width: 70%;
  }
  .name{
    font-weight: 500;
  }
  .recommend_reason{
    margin-top: 5px;
  }
  /* 卡劵模块 */
  .section_others{
    padding: 16.5px 22px;
    margin-top: 16.5px;
    display: flex;
    justify-content: space-around;
    background: #fff !important;
  }
  .section_others a{
    text-align: center;
    position: relative;
    padding-top: 0.2rem;
    color: #003;
    text-decoration: none;
  }
  .section_others p{
    font-size: 14px;
    position: relative;
    padding-top: 0.2rem;
  }
  /* 公司信息 */
  .section_lecake_info{
    width: 100%;
    text-align: center;
    padding: 1.4rem 0 0.5rem;
    background: #e6e6e6;
    margin-bottom: 55px;
  }
  .device_type{
    display: flex;
    justify-content: space-between;
    padding: 0 6rem;
  }
  .device_type a{
    text-decoration: none;
    border: 1px solid #000;
    color: #000;
    padding: 3px;
    font-size: 13px;
  }
  .copyright{
    font-size: 10px;
    color: #bababa;
    margin-top: 18px;
    line-height: 14px;
  }
</style>
<script>
const HF = ()=>import("../components/heartfeel.vue");//路由懒加载
const LunBo = ()=>import("../components/lunbo.vue");
const LunBo2 = ()=>import("../components/lunbo2.vue");
export default {
  components:{
    "hf":HF,
    'lunbo':LunBo,
    'lunbo2':LunBo2
  },
  data() {
    return {
      cake:[]
    }
  },
  methods: {
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
          if(item.bigpic != null){
            item.bigpic = require('../assets/cake/' + item.bigpic);
          }
          this.cake.push(item);
        })
        //关闭加载提示框
        this.$indicator.close();
      });
    }
  },
  mounted() {
    //获取默认分类下的蛋糕数据,本次调用有且只有一次
    this.getcake();
  },
}
</script>
