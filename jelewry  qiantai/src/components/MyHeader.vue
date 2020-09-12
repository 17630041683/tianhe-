<template>
  <!-- 背景 -->
  <div id="h_content">
    <!-- 左一LOGO -->
    <div id="h_one">
      <router-link to="/">
        <img src="../../public/img/index/logo.png" alt />
      </router-link>
    </div>
    <!-- 中间文字 -->
    <el-menu
      :default-active="activeIndex"
      class="el-menu-demo"
      mode="horizontal"
      @select="handleSelect"
      background-color="#000"
    >
      <el-submenu index="1" popper-class="textClass">
        <template slot="title">钻戒定制</template>
        <el-menu-item index="1-1">
          <router-link to="/productlist/3/黑珍珠">黑珍珠</router-link>
        </el-menu-item>
        <el-menu-item index="1-2">
          <router-link to="/productlist/1/戒指">戒指</router-link>
        </el-menu-item>
      </el-submenu>
      <el-submenu index="2" popper-class="textClass">
        <template slot="title">求婚钻戒</template>
        <el-menu-item index="2-1">
          <router-link to="/productlist/5/钻石">钻石</router-link>
        </el-menu-item>
        <el-menu-item index="2-2">
          <router-link to="/productlist/6/彩色钻石">彩色钻石</router-link>
        </el-menu-item>
        <el-menu-item index="2-3">
          <router-link to="/productlist/4/项链">项链</router-link>
        </el-menu-item>
      </el-submenu>
      <el-submenu index="3" popper-class="textClass">
        <template slot="title">真爱礼物</template>
        <el-menu-item index="3-1">
          <router-link to="/productlist/5/白金戒指">白金戒指</router-link>
        </el-menu-item>
        <el-menu-item index="3-2">
          <router-link to="/productlist/4/链坠">链坠</router-link>
        </el-menu-item>
      </el-submenu>
      <el-submenu index="4" popper-class="textClass">
        <template slot="title">真爱体验</template>
        <el-menu-item index="4-1">
          <router-link to="/productlist/2/项链">项链</router-link>
        </el-menu-item>
        <el-menu-item index="4-2">
          <router-link to="/productlist/5/戒指">戒指</router-link>
        </el-menu-item>
      </el-submenu>
      <el-submenu index="5" popper-class="textClass">
        <template slot="title">关于我们</template>
        <el-menu-item index="5-1">
          <router-link to="/about/1">品牌理念</router-link>
        </el-menu-item>
        <el-menu-item index="5-2">
          <router-link to="/about/2">产品理念</router-link>
        </el-menu-item>
        <el-menu-item index="5-3">
          <router-link to="/about/3">合作伙伴</router-link>
        </el-menu-item>
        <el-menu-item index="5-3">
          <router-link to="/about/4">加入我们</router-link>
        </el-menu-item>
      </el-submenu>
    </el-menu>
    <!-- 登录注册部分 -->
    <div id="h_three">
      <ul v-if="!uname" id="d1" class="hupul">
        <li>
          <router-link :to="{path:'/login'}">登录</router-link>
        </li>
        <li style="margin:0 20px;">|</li>
        <li>
          <router-link :to="{path:'/register'}">注册</router-link>
        </li>
      </ul>
      <ul v-if="uname" id="d2" class="hupul">
        <li style="margin-left:10px;">
          <span style="color:white;">欢迎 {{this.uname}}</span>
        </li>
        <li style="margin:0 20px; color:#666;">|</li>
        <li style="margin-left:10px;">
          <a href="javascript:;" @click="signout">注销</a>
        </li>
      </ul>
    </div>
    <!-- 右边小图 -->
    <!-- <div class="h_four">
      <img src="img/small/shop.png" alt />
    </div>-->
  </div>
</template>

<script>
import { mapState } from "vuex";
export default {
  data() {
    return {
      activeIndex: "",
      activeIndex2: ""
      // uname: "",
      // islogin: false
    };
  },
  computed: {
    //固定写法 ...mapState([state中的属性名...])
    ...mapState(["uname", "uid", "phone"])
  },
  methods: {
    handleSelect(key, keyPath) {
      console.log(key, keyPath);
    },
    signout() {
      //注销
      //丁:清空session
      sessionStorage.clear();
      //再次执行vuex中函数
      this.$store.commit("updateUser");
      // this.$router.replace({ path: "/" });
      // this.$store.commit("signout");
      // sessionStorage.removeItem("uname");
      // sessionStorage.removeItem("islogin");
    }
  }
  // created() {
  //   this.$store.commit("islogin");
  //   var user = this.$store.getters.getuser;
  //   console.log(user, "user");
  //   修改data中的uname和islogin
  //   if (user) {
  //   this.islogin = user.islogin;
  //   console.log(this.islogin, "this.islogin");
  //   this.uname = user.uname;
  //   }
  // }
  // watch: {
  //   $route(to, from) {
  //     // 做一些路由变化的响应 这里打印一下你的参数，看看能不能接收到
  //     // console.log(this.$route.params.aid);
  //   }
  // }
};
</script>

<style>
* {
  margin: 0;
  padding: 0;
}
a {
  color: #909399;
}
/* all */
#h_content {
  height: 67px;
  width: 1200px;
  margin: 0 auto;
  display: flex;
  justify-content: space-between;
  min-width: 800px;
}
/* 一 */
#h_content #h_one img {
  width: 175px;
  height: 20px;
  padding-top: 20px;
}

/* 二 */
#h_content .el-menu.el-menu--horizontal {
  border-bottom: 0;
}

/* 导航栏的文字信息css */
#h_content .el-submenu__title {
  color: #909399;
}
#h_content .el-submenu__title:hover {
  display: block;
  color: #ddb293;
}
/* 鼠标悬停后的内部文字信息提示 */
.textClass .el-menu--popup {
  background-color: rgba(0, 0, 0, 0) !important;
  border: 0;
  width: 100px !important;
}
.textClass .el-menu--popup-bottom-start {
  margin-top: 0;
  padding-bottom: 0;
}
.textClass .el-menu .el-menu-item {
  background-color: rgba(0, 0, 0, 0.1) !important;
  width: 100px;
  display: block;
  text-align: center;
}
.textClass .el-menu .el-menu-item a:hover {
  color: #ddb293;
}
#h_content .textClass .el-menu .el-menu-item.is-active {
  color: #909399;
}
#h_content a:hover {
  color: #ddb293;
}
#h_content .el-menu--collapse .el-menu .el-submenu,
.el-menu--popup {
  min-width: 100px !important;
}
/* 三 */
#h_content #h_three {
  text-align: center;
  margin-top: 18px;
  /* display: flex; */
}

#d1,
#d2 {
  display: flex;
}
/* #d1 {
  display: none;
  justify-content: space-evenly;
}
#d2 {
  display: none;
} */
</style>