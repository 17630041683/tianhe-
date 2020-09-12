import Vue from "vue";
import Vuex from "vuex";

Vue.use(Vuex);

export default new Vuex.Store({
  state: {
    // 集中管理属性
    uname: sessionStorage.getItem("uname"),
  },
  getters: {
    // 集中获取数据函数
    getuser(state) {
      var obj = { uname: state.uname, islogin: state.islogin };
      return obj;
    },
  },
  mutations: {
    // 集中修改数据函数
    // login(state, data) {
    //   // 登录 data:用户名，login传过来的数据
    //   state.uname = data;
    //   state.islogin = true;
    // },
    updateUser(state) {
      // 用来更新state中的数据
      state.uname = sessionStorage.getItem("uname");
    },
  },
  actions: {},
  modules: {},
});
