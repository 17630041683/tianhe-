import Vue from "vue";
import ElementUI from "element-ui";
import "element-ui/lib/theme-chalk/index.css";
import App from "./App.vue";
import router from "./router";
import store from "./store";
import MyHeader from "./components/MyHeader";
import MyFooter from "./components/MyFooter";
import axios from "axios";

// 配置axios
axios.defaults.baseURL = "http://127.0.0.1:4000";
Vue.prototype.axios = axios;

// 将header.vue,footer.vue组件对象做成了全局对象
Vue.component("my-header", MyHeader);
Vue.component("my-footer", MyFooter);

Vue.config.productionTip = false;
Vue.use(ElementUI); //通过Vue.use()方法注册组件

new Vue({
  router,
  store,
  render: (h) => h(App),
}).$mount("#app");
