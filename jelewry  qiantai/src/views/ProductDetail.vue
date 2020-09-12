<template>
  <div id="productdetail" class="con">
    <div style="width:100%;height:70px"></div>
    <!-- 面包屑导航 -->
    <el-breadcrumb separator-class="el-icon-arrow-right">
      <el-breadcrumb-item :to="{ path: '/' }">首页</el-breadcrumb-item>
      <el-breadcrumb-item :to="{path:`/productlist/${aid}/${name}`}">{{name}}</el-breadcrumb-item>
      <el-breadcrumb-item>{{subject}}</el-breadcrumb-item>
    </el-breadcrumb>

    <!-- 商品内容 -->
    <div class="d_matter">
      <!-- 商品详情 -->
      <el-row :gutter="16">
        <div v-for="(item,i) of data" :key="i">
          <el-col :span="10">
            <div style="width:100%;height:40px;"></div>
            <div>
              <p style="font-size:14px;color:#a9a9a9;">{{item.title}}</p>
              <p style="font-size:24px;color:#a3a3a3;margin:22px 0;">{{item.subtitle}}</p>
              <div style="border-top:1px solid rgba(163, 163, 163, 0.99);"></div>
            </div>
            <div>
              <p
                style="font-size:24px;color:#ddb293;margin:45px 0 25px;"
              >RMB {{item.price.toFixed(2)}}</p>
              <p style="font-size:16px;color:#a3a3a3;">颜色:</p>
              <el-col
                :span="4"
                v-for="(item,i) of color"
                :key="i"
                style="padding:0;margin:20px 0 50px"
              >
                <el-button size="small" style="background-color:#000;color:#a3a3a3;">{{item}}</el-button>
              </el-col>
              <el-button
                type="primary"
                plain
                style="color: #ddb293;background: #000;border-color: #ddb293;width:143px;height:36px;margin-right:10px;"
              >购买</el-button>
              <!-- <el-button
                type="primary"
                @click="addcart"
                plain
                style="color: #ddb293;background: #000;border-color: #ddb293;width:143px;height:36px;margin-right:10px;"
              >添加购物车</el-button>
              <el-button
                type="primary"
                @click="gotocart"
                plain
                style="color: #ddb293;background: #000;border-color: #ddb293;width:143px;height:36px;margin-right:10px;"
              >前往购物车</el-button>-->

              <div style="border-top:1px solid rgba(163, 163, 163, 0.99);margin:42px 0"></div>
            </div>
            <div>
              <img
                style="width:17px;margin-right:5px"
                src="https://s-10289.f.cdn-static.cn/10289_15656874774062.png"
                alt
              />
              <router-link to="javascript:;" style="font-size:14px;color:#a3a3a3;">在购买中遇到问题，可以在线交流</router-link>
            </div>
          </el-col>
          <!-- 空白区域 -->
          <el-col :span="2">
            <div style="width:73px;height:599px"></div>
          </el-col>
          <!-- 右边图片 -->
          <el-col :span="12">
            <div style="width:585px;height:468px">
              <img :src="item.image" style="width:100%;height:100%" alt />
            </div>
            <!-- <div> -->
            <div v-for="(item,i) of images" :key="i" style>
              <img
                style="width:98px;height:102px;padding:12px;"
                :src="item.img"
                v-if="item.img != null"
                alt
              />
              <img
                style="width:98px;height:102px;padding:12px;"
                :src="item.picture"
                v-if="item.picture != null"
                alt
              />
              <img
                style="width:98px;height:102px;padding:12px;"
                :src="item.photo"
                v-if="item.photo != null"
                alt
              />
              <img
                style="width:98px;height:102px;padding:12px;"
                :src="item.image"
                v-if="item.image != null"
                alt
              />
            </div>
            <!-- </div> -->
          </el-col>
        </div>
      </el-row>
    </div>

    <!-- 分割线 -->
    <div style="border-bottom:1px solid rgba(163, 163, 163, 0.99);margin:70px 0 30px;"></div>

    <!-- 商品基本参数 -->
    <div class="d_param">
      <div style="margin-bottom:20px;">
        <h1 style="font-size:18px;color:#a3a3a3;font-weight:bold;">基本参数</h1>
      </div>
      <div v-for="(item,i) of param" :key="i">
        <p style="font-size:14px;color:#a3a3a3;">产品名称: {{item.lname}}</p>
        <ul>
          <li>· 种类: {{item.category}}</li>
          <li>· CPU: {{item.cpu}}</li>
          <li>· 内存: {{item.memory}}</li>
          <li>· 显存: {{item.video_memory}}</li>
          <li>· 显卡: {{item.video_card}}</li>
          <li>· 硬盘: {{item.disk}}</li>
          <li>· 分辨率: {{item.resolution}}</li>
          <li>· 规格: {{item.spec}}</li>
          <li>· 系统: {{item.os}}</li>
          <li>· 承诺: {{item.promise}}</li>
        </ul>
      </div>
    </div>

    <!-- 分割线 -->
    <div style="border-bottom:1px solid rgba(163, 163, 163, 0.99);margin:30px 0;"></div>

    <!-- 产品详情 -->
    <div class="d_detail">
      <div style="margin-bottom:20px;">
        <h1 style="font-size:18px;color:#a3a3a3;font-weight:bold;">产品详情</h1>
      </div>
      <div v-for="(item,i) of param" :key="i">
        <p style="font-size:14px;color:#a3a3a3;padding: 10px 0;">关于产品: {{item.lname}}</p>
        <p style="font-size:14px;color:#a3a3a3;padding: 10px 0;">产品详情: {{item.title}}</p>
        <p style="font-size:14px;color:#a3a3a3;padding: 10px 0;">即可抢购: {{item.subtitle}}</p>
      </div>
    </div>

    <!-- 分割线 -->
    <div style="border-bottom:1px solid rgba(163, 163, 163, 0.99);margin:30px 0;"></div>

    <!-- 商品推荐 -->
    <div class="d_shop" style="text-align:center;">
      <!-- 商品推荐 -->
      <div style="margin:100px 0 80px;">
        <p style="font-size:22px;color:#a3a3a3;">商品推荐</p>
      </div>
      <el-row :gutter="24">
        <div v-for="(item,i) of sixshop" :key="i">
          <router-link :to="`/productDetail/${item.jewelry_id}/${aid}/${name}/${item.subject}`">
            <el-col :span="4">
              <div>
                <img style="width:180px;height:180px;" :src="item.image" alt />
              </div>
              <div>
                <p class="p1">{{item.subject}}</p>
                <p class="p2">{{item.description}}</p>
                <p></p>
              </div>
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
      name: this.$route.params.name,
      subject: this.$route.params.subject,
      color: ["红色", "黄色", "紫色", "绿色", "蓝色", "棕色"],
      images: [],
      sixshop: [],
      param: [], // 参数
      count: 1
    };
  },
  methods: {
    load() {
      var url = "productdetail";
      var obj = { params: { jewelry_id: this.$route.params.jewelry_id } };
      // console.log(obj);
      this.axios.get(url, obj).then(res => {
        console.log(res);
        var data = res.data.productdetail;
        this.data = [];
        var images = res.data.images;
        this.images = [];
        var sixshop = res.data.sixdetails;
        this.sixshop = [];
        sixshop.forEach(element => {
          if (element.image != null) {
            element.image = require("../../public/img/index/" + element.image);
          }
          this.sixshop.push(element);
        });
        data.forEach(element => {
          if (element.image != null) {
            element.image = require("../../public/img/index/" + element.image);
          }
          this.data.push(element);
        });
        images.forEach(element => {
          // console.log(element);
          if (element.photo != null) {
            element.photo = require("../../public/img/index/" + element.photo);
          }
          if (element.image != null) {
            element.image = require("../../public/img/index/" + element.image);
          }
          if (element.img != null) {
            element.img = require("../../public/img/index/" + element.img);
          }
          if (element.picture != null) {
            element.picture = require("../../public/img/index/" +
              element.picture);
          }
          this.images.push(element);
        });
      });
    }
  },
  mounted() {
    var id = this.$route.params.jewelry_id;
    // console.log(id);
    var baseURL =
      "http://101.96.128.94:9999/data/product/details.php?lid=" + id;
    this.axios.get(baseURL).then(res => {
      console.log(res);
      this.param.push(res.data.details);
    });
  },
  created() {
    this.load();
    // console.log(this.data);
    // console.log(this.param);
    console.log(this.sixshop);
  },
  watch: {
    $route: function(newVal, oldVal) {
      console.log(oldVal); //oldVa 上一次url
      console.log(newVal); //newVal 这一次的url
      if (newVal != oldVal) {
        this.load(); //重新调用加载函数
      }
    }
  }
};
</script>

<style>
#productdetail .d_matter {
  margin-top: 37px;
}
#productdetail .d_param li {
  font-size: 14px;
  color: #a3a3a3;
  padding: 10px 0;
}

#productdetail .d_shop .p1 {
  color: #eee;
  font-size: 13px;
  /* width: 370px; */
  margin: 15px 0;
}
#productdetail .d_shop .p1:hover {
  color: #ddb293;
}
#productdetail .d_shop .p2 {
  /* width: 370px; */
  color: #ddb293;
  font-size: 15px;
}
</style>