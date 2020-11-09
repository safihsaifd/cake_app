<template>
  <div>
    <div class="swipe">
      <mt-swipe 
        :showIndicators="true"
        :auto="5000"
        :speed="500"
        :continuous="true">
          <mt-swipe-item v-for="(lunbo,index) of lunbo2" :key="index">
            <img :src=lunbo.pic class="ctimg">
            <div class="title">
                <p class="main_title2">{{lunbo.title}}</p>
                <p class="sub_title2">{{lunbo.sub_title}}</p>
            </div>
          </mt-swipe-item>
      </mt-swipe>
    </div>
  </div>
</template>
<style scoped>
.swipe{
  width: 100%;
  height: 160px;
}
.ctimg{
  width: 100%;
  height: auto;
}
.title{
  color: #000;
  position: absolute;
  top: 50%;
  transform: translateY(-50%);
  left: 0;
  width: 100%;
  padding-left: 20px;
}
.main_title2{
  font-size: 20px;
  font-weight: bolder;
}
.sub_title2{
  font-size: 15px;
  margin-top: 10px;
}    
</style>
<script>
export default {
  data() {
    return {
      lunbo2:[]
    }
  },
  methods: {
    //获取轮播图信息
    getpic(){
      this.axios.get('/getlun2').then(res=>{
        //将服务器返回数据给轮播图数组
        let data=res.data.result;
        //重新给图片地址赋值
        data.forEach(item=>{
          if(item.pic != null){
            item.pic = require('../assets/lunboimg/' + item.pic);
          }
          this.lunbo2.push(item);
        })
      })
    },
  },
  mounted() {
    this.getpic();
  },
}
</script>