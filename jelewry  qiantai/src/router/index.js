import Vue from "vue";
import VueRouter from "vue-router";

Vue.use(VueRouter);

const routes = [
  {
    path: "/about/:four_id",
    component: () => import("../views/About"),
  },
  {
    path: "/login",
    component: () => import("../views/Login"),
  },
  {
    path: "/productlist/:aid/:name", //
    component: () => import("../views/ProductList"),
  },
  {
    path: "/productdetail/:jewelry_id/:aid/:name/:subject", //
    component: () => import("../views/ProductDetail"),
  },
  {
    path: "/register",
    component: () => import("../views/Register"),
  },
  {
    path: "/button",
    component: () => import("../views/Button"),
  },
  {
    path: "/",
    component: () => import("../views/Index"),
  },
];

const router = new VueRouter({
  routes,
});

export default router;
