<template>
  <div>
    <div class="swipe">
      <mt-swipe 
        :showIndicators="true"
        :auto="5000"
        :speed="500"
        :continuous="true">
          <mt-swipe-item v-for="(lunbo,index) of lunbo" :key="index">
            <img :src=lunbo.pic class="ctimg">
            <div class="title" v-html="lunbo.title">
            </div>
          </mt-swipe-item>
      </mt-swipe>
    </div>
  </div>
</template>
<style>
.brown{color: #b65b33;}
.pink{color: #e0484e;}
.main_title{
  font-size: 28px;
  font-weight: bolder;
}
.sub_title{
  margin-top: 10px;
  font-size: 23px;
}
</style>
<style scoped>
.swipe{
  width: 100%;
  height: 626px;
}
.ctimg{
  width: 100%;
  height: auto;
}
.title{
  color: #000;
  z-index: 99;
  position: absolute;
  top: 78%;
  left: 0;
  width: 100%;
  padding-left: 15px;
}
</style>
<script>
export default {
  data() {
    return {
      lunbo:[]
    }
  },
  methods: {
    //获取轮播图信息
    getpic(){
      this.axios.get('/getlun1').then(res=>{
        //将服务器返回数据给轮播图数组
        let data=res.data.result;
        //重新给图片地址赋值
        data.forEach(item=>{
          if(item.pic != null){
            item.pic = require('../assets/lunboimg/' + item.pic);
          }
          this.lunbo.push(item);
        })
      })
    },
  },
  mounted() {
    this.getpic();
  },
}
</script>