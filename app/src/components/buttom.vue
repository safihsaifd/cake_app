<template>
    <!-- 底部选项卡 -->
    <div>
      <mt-tabbar v-model="tabbar" fixed style="background:#fff"> 
        <mt-tab-item id="index">
         首页
         <img src="../assets/pubimg/shouye2.png" slot="icon" v-if="tabbar == 'index'">
         <img src="../assets/pubimg/shouye1.png" slot="icon" v-else>
        </mt-tab-item>
        <mt-tab-item id="list">
         生日蛋糕
         <img src="../assets/pubimg/dangao2.png" slot="icon" v-if="tabbar == 'list'">
         <img src="../assets/pubimg/dangao1.png" slot="icon" v-else>
        </mt-tab-item>
        <mt-tab-item id="ok">
         OK零食
         <img src="../assets/pubimg/yooxi2.png" slot="icon" v-if="tabbar == 'ok'">
         <img src="../assets/pubimg/yooxi1.png" slot="icon" v-else>
        </mt-tab-item>
        <mt-tab-item id="cart">
         购物袋
         <img src="../assets/pubimg/buy2.png" slot="icon" v-if="tabbar == 'cart'">
         <img src="../assets/pubimg/buy1.png" slot="icon" v-else>
        </mt-tab-item>
        <mt-tab-item id="me">
         我的
         <img src="../assets/pubimg/wode2.png" slot="icon" v-if="tabbar == 'me'">
         <img src="../assets/pubimg/wode1.png" slot="icon" v-else>
        </mt-tab-item>
      </mt-tabbar>
    </div>
</template>
<script>
export default {
    data() {
        return {
            //默认被选定的顶部选项卡的ID
            tabbar:'index',
        }
    },
    //动态改变tabbar的绑定值
    mounted() {
        this.tabbar='index';
        if(this.$route.path.slice(1)==''){
            this.tabbar='index';
        }else{
            this.tabbar=this.$route.path.slice(1);
        }
    },
    watch: {
        //监听底部选项卡,可以带有两个参数,参数1代表新值,参数2代表旧值
        tabbar(value){
            if(value == 'index'){
                this.$router.push('/').catch(e=>{});
            }
            if(value == 'me'){
                this.$router.push('/me').catch(e=>{});
            }
            if(value == 'list'){
                this.$router.push('/list').catch(e=>{});
            }
            if(value == 'ok'){
                this.$router.push('/list').catch(e=>{});
            }
            if(value == 'cart'){
                this.$router.push('/cart').catch(e=>{});
            }
        }
    },
}
</script>