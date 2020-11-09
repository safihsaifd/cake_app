import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
//引入组件 
import BT from './components/buttom.vue'
import Head from './components/myhead.vue'

//导入Mint UI 
import MintUI from 'mint-ui';
//导入样式文件 
import 'mint-ui/lib/style.min.css'; 
//注册为Vue的插件 
Vue.use(MintUI);

//引入v-lazy
import Vuelazyload from 'vue-lazyload';
//引用v-lazy
Vue.use(Vuelazyload);

//引用qs
import qs from 'qs'
Vue.prototype.qs = qs;

//让component变成全局组件:
Vue.component("bt",BT)
Vue.component("Head",Head)

//引入axios
import axios from "axios"
axios.defaults.baseURL="http://127.0.0.1:5050";
//原型链上创建axios
Vue.prototype.axios=axios;
Vue.config.productionTip = false

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
