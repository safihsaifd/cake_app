import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  //物品
  state: {
    //记录登陆状态
    isLogined:localStorage.getItem('isLogined') ? localStorage.getItem('isLogined') : 0,
    //记录登陆用户id
    userid:localStorage.getItem('userid') ? localStorage.getItem('userid') : 0,// 使用json字符串进行数据格式存取
    //购物车蛋糕列表
    cart:JSON.parse(localStorage.getItem('cart'+`${localStorage.getItem('userid')}`))? JSON.parse(localStorage.getItem('cart'+`${localStorage.getItem('userid')}`)) :[],
    //购物车某一蛋糕数量-->对应购物车列表下标
    cakenumber:JSON.parse(localStorage.getItem('cakenumber'+`${localStorage.getItem('userid')}`))? JSON.parse(localStorage.getItem('cakenumber'+`${localStorage.getItem('userid')}`)) :[],
    //保存复选框-->对应购物车列表下标
    checkArry:JSON.parse(localStorage.getItem('checkArry'+`${localStorage.getItem('userid')}`))? JSON.parse(localStorage.getItem('checkArry'+`${localStorage.getItem('userid')}`)):[],
    //保存全选框状态
    checkAllstate:0
  },
  //搬运工
  mutations: {
    //改变登陆状态
    logined(state){
      state.isLogined = 1;
    },
    //改变登陆用户id
    uid(state){
      state.userid=localStorage.getItem('userid');
    },
    //改变购物车物品
    changecart(state){
      //当不为空时再添加 否则会报错
      if(JSON.parse(localStorage.getItem('cart'+`${localStorage.getItem('userid')}`))!=undefined){      
        state.cart=JSON.parse(localStorage.getItem('cart'+`${localStorage.getItem('userid')}`));
        state.cakenumber=JSON.parse(localStorage.getItem('cakenumber'+`${localStorage.getItem('userid')}`));
        state.checkArry=JSON.parse(localStorage.getItem('checkArry'+`${localStorage.getItem('userid')}`));
      }
    },
    //添加一种类蛋糕
    addcake(state,payload){
      state.cart.push(payload);
      state.cakenumber.push(1);//添加新蛋糕时 往数量数组中新index存1
      state.checkArry.push(1);//添加新蛋糕时 往复选框数组中新index存1,表示复选框选定
      //存入本地缓存，让每次刷新都可以存在
      localStorage.setItem('cakenumber'+`${state.userid}`,JSON.stringify(state.cakenumber));
      localStorage.setItem('cart'+`${state.userid}`,JSON.stringify(state.cart));
      localStorage.setItem('checkArry'+`${state.userid}`,JSON.stringify(state.checkArry));
    },
    //添加某一种蛋糕数量
    addnumber(state,payload){
      //添加蛋糕重复时，往此数量[此蛋糕下标]+1
      state.cakenumber[payload]=state.cakenumber[payload]+1;
      //为了重新渲染页面 克隆一个数组 然后整体复制给原本数组
      let clone=[];
      for(var item in state.cakenumber){
        clone[item]=state.cakenumber[item]
      }
      state.cakenumber=clone;
      //存入本地缓存，让每次刷新都可以存在
      localStorage.setItem('cakenumber'+`${state.userid}`,JSON.stringify(state.cakenumber));
    },
    //删除一种类蛋糕
    delete(state,payload){
      //但这种方法返回的是删除元素的值
      state.cart.splice(payload,1);
      state.cakenumber.splice(payload,1);
      state.checkArry.splice(payload,1);
      //存入本地缓存，让每次刷新都可以存在
      localStorage.setItem('cakenumber'+`${state.userid}`,JSON.stringify(state.cakenumber));
      localStorage.setItem('checkArry'+`${state.userid}`,JSON.stringify(state.checkArry));
      localStorage.setItem('cart'+`${state.userid}`,JSON.stringify(state.cart));
    },
    //取消单个复选框，复选框对应下标归0，反之
    changecheck(state,payload){
      let clone=[];
      if(state.checkArry[payload]==0){
        state.checkArry[payload]=1;
        //为了重新渲染页面 克隆一个数组 然后整体复制给原本数组
        for(var item in state.checkArry){
          clone[item]=state.checkArry[item]
        }
        state.checkArry=clone;
        //存入本地缓存，让每次刷新都可以存在
        localStorage.setItem('checkArry'+`${state.userid}`,JSON.stringify(state.checkArry));
      }else{
        state.checkArry[payload]=0;
        //为了重新渲染页面 克隆一个数组 然后整体复制给原本数组
        for(var item in state.checkArry){
          clone[item]=state.checkArry[item]
        }
        state.checkArry=clone;
        //存入本地缓存，让每次刷新都可以存在
        localStorage.setItem('checkArry'+`${state.userid}`,JSON.stringify(state.checkArry));
      }
    },
    //检验复选框数组是否有0，有的话 全选框不选
    checkAll(state){
      //先判断购物车里是否有内容
      if(state.checkArry.length>0){
        //遍历购物车，看勾选框是否勾选
        for(var i=0;i<state.checkArry.length;i++){
          if(state.checkArry[i]==1){
            state.checkAllstate=1;
          }else{
            //如果有一个未勾选 就把全选状态变为false并跳出循环
            state.checkAllstate=0;
            break;
          }
        }
      }else{state.checkAllstate=0;}
    },
    //选择全部购物车商品，或者取消全部购物车商品
    choseAll(state){
      let clone=[];
      //判断状态，每次点击，全选状态取反
      if(state.checkAllstate==0){
        state.checkAllstate=1;
      }else{
        state.checkAllstate=0;
      }
      //遍历，让每一个单选框状态和全选一致
      for(var i=0;i<state.checkArry.length;i++){
        state.checkArry[i]=state.checkAllstate;
      }
      //克隆一下数组再整体重新复制给checkArry，以便重新渲染
      for(var item in state.checkArry){
        clone[item]=state.checkArry[item];
      }
      //存入本地缓存，让每次刷新都可以存在
      state.checkArry=clone;
      localStorage.setItem('checkArry'+`${state.userid}`,JSON.stringify(state.checkArry));
    }
  },
  //计算值
  getters:{
    //计算购物车总价格函数
    priceall(state){
      let sum=0;
      if(state.cart.length>0){
        for(let i=0;i<state.cart.length;i++){
          if(state.checkArry[i]==1){
            sum=sum+state.cart[i].price*state.cakenumber[i];
          }
        }
      }
      return sum;    
    }
  },
  //拉货汽车(mutations 不能产生异步操作，而 actions 可以产生异步操作)
  actions: {
  },
  modules: {
  }
})
