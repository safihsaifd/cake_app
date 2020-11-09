import Vue from 'vue'
import VueRouter from 'vue-router'

Vue.use(VueRouter)

const routes = [
  //首页
  {
    path: '/',
    name:'home',
    component: () => import(/* webpackChunkName: "home" */ '../views/Home.vue')
  },
  //详情
  {
    path: '/details',
    name:'details',
    component: () => import(/* webpackChunkName: "details" */ '../views/details.vue'),//懒加载
  },
  //注册
  {
    path: '/reg',
    name:'reg',
    component: () => import(/* webpackChunkName: "reg" */ '../views/reg.vue'),//懒加载
  },
  //登陆
  {
    path: '/login',
    name: 'login',
    component: () => import(/* webpackChunkName: "login" */ '../views/login.vue'),//懒加载
  },
  //个人中心
  {
    path: '/me',
    name:'me',
    component: () => import(/* webpackChunkName: "me" */ '../views/me.vue'),//懒加载
  },
  //蛋糕列表
  {
    path: '/list',
    name: 'list',
    component: () => import(/* webpackChunkName: "list" */ '../views/list.vue'),//懒加载
  },
  //购物车
  {
    path: '/cart',
    name:'cart',
    component: () => import(/* webpackChunkName: "cart" */ '../views/cart.vue'),//懒加载
    //路由独享守卫//如果未登陆 不能进入购物车页面
    beforeEnter(to,from,next){
      let isLogin=window.localStorage.getItem('isLogined');
      if(isLogin){next()}
      else{
        if (to.path === '/login'){
          next();
        }else{
          next('/login')
        }
      }
    }
  },
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})
// router.beforeEach((to,from,next)=>{
//   //获取是否登陆的状态
//   let isLogin=window.localStorage.getItem('isLogined');
//    //如果用户token不存在则跳转到首页
//   if(isLogin){
//     next();
//   }else{
//     //如果用户token不存在则跳转到login页面
//     if (to.path === '/login'){
//        next()
//     }else{
//       next('/login')
//     }
//   }
// })

export default router
