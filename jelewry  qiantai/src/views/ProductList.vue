<template>
  <div id="productlist" class="con">
    <div style="width:100%;height:70px"></div>
    <!-- 面包屑导航 -->
    <el-breadcrumb separator-class="el-icon-arrow-right">
      <el-breadcrumb-item :to="{ path: '/' }">首页</el-breadcrumb-item>
      <el-breadcrumb-item>{{name}}</el-breadcrumb-item>
    </el-breadcrumb>
    <!-- 内容 -->
    <div class="list">
      <el-row :gutter="70">
        <div v-for="(item,i) of data" :key="i">
          <router-link :to="`/productDetail/${item.jewelry_id}/${aid}/${name}/${item.subject}`">
            <el-col :span="7">
              <img :src="item.image" alt />
              <p class="p1">{{item.subject}}</p>
              <p class="p2">{{item.description}}</p>
            </el-col>
          </router-link>
        </div>
      </el-row>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      data: [],
      aid: this.$route.params.aid,
      name: this.$route.params.name
    };
  },
  methods: {
    load() {
      var url = "productList";
      var obj = { params: { aid: this.$route.params.aid } };
      console.log(obj);
      this.axios.get(url, obj).then(res => {
        console.log(res);
        var data = res.data.productlist;
        this.data = []; // 设置数据为空，防止数据变太快，页面出现抖动
        data.forEach(element => {
          if (element.image != null) {
            element.image = require("../../public/img/index/" + element.image);
          }
          this.data.push(element);
        });
      });
    }
  },
  created() {
    this.load();
  },
  watch: {
    $route() {
      this.load();
    }
  }
};
</script>

<style>
/* ------------------------------面包屑导航部分------------------------------ */
/* ------------------------------已经移入全局里面------------------------------ */
/* #productlist .el-breadcrumb__inner a,
.el-breadcrumb__inner.is-link {
  font-weight: 500;
  color: #bbb;
}
#productlist .el-breadcrumb__inner a,
.el-breadcrumb__inner.is-link:hover {
  color: #ddb293;
} */
/* ------------------------------内容部分------------------------------ */
#productlist .list {
  margin-top: 70px;
}
#productlist .el-col {
  margin-right: 20px;
  margin-bottom: 60px;
  text-align: center;
  margin-bottom: 100px;
}
#productlist .list img {
  width: 370px;
  height: 300px;
}
#productlist .list .p1 {
  color: #eee;
  font-size: 13px;
  width: 370px;
  margin: 15px 0;
}
#productlist .list .p1:hover {
  color: #ddb293;
}
#productlist .list .p2 {
  width: 370px;
  color: #ddb293;
  font-size: 15px;
}
/* #productlist
#productlist
#productlist
#productlist
#productlist
#productlist */
</style>