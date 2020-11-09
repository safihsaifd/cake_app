<template>
    <div class="hf">
        <div class="inner">
            <div class="content">
                <p>尊贵礼遇享不停，升级aha会员</p>
                <p>预计可省¥358+，
                    <router-link to="/" class="more">了解更多</router-link>
                </p>
            </div>
        </div>
        <div class="btn_wrap">
            <router-link to="/" class="btn">立即开通 ¥99/年</router-link>
        </div>
        <div class="bg_aha_rights">
            <img src="../assets/pubimg/ahaRights.png">
        </div>
    </div>
</template>
<style scoped>
    .hf{
        width: 100%;height: 15rem;
        background: url(../assets/pubimg/hfbg.jpg);
        background-size: 100% auto;
        position: relative;
    }
    .inner{
        position: absolute;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
    }
    .content{
        position: absolute;
        top: 30.8%;
        left: 5.2%;
    }
    .more{
        text-decoration: underline;
        color: #cea461;
    }
    .btn_wrap{
        position: absolute;
        left: 5.2%;
        top: 65%;
    }
    .btn_wrap>.btn{
        font-size: 14px;
        display: block;
        height: 28px;
        background: #cda366;
        line-height: 28px;
        padding:0 20px;
        color: #ffffff;
        text-decoration: none;
        outline: 0;
    }
    .bg_aha_rights{
        position: absolute;
        right: 1.5rem;
        bottom: 13%;
        width: 7.5rem;
    }
    .bg_aha_rights>img{
        width: 100%;
    }
</style>