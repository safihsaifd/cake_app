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
                    <mt-tab-item type="primary"
                    :id="item.category_id.toString()" 
                    v-for="(item,index) of category"
                    :key="index">{{item.category_name}}</mt-tab-item>
               </mt-navbar>
            </div>
            <div slot="right" class="shortcut">
                <mt-button type="primary">筛选</mt-button>
            </div>
        </mt-header>
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
</style>
<script>
export default {
    data() {
        return {
            category:[],
            active:'1'
        }
    },
    methods: {
        getcategory(){
            this.axios('/category').then(res=>{
                this.category=res.data.result;
                console.log(this.category);
            })
        }
    },
    mounted() {
        this.getcategory()
    },
}
</script>
