<template>
  <div>
    <div v-if="id!=4">
      <!-- <img :src="image" alt />
      <p style="color:white;">{{title}}</p>
      <p style="color:white;">{{subtitle}}</p>-->
      <el-row :gutter="20">
        <el-col :span="3" style="height:1px;">&nbsp;</el-col>
        <el-col :span="18">
          <img :src="image" style="width:990px;height:446px;" alt v-if="image!=null" />
          <p style="color:#ddb293;font-size:18px;font-weight:bold;" v-if="title!=null">{{title}}</p>
          <p
            style="color:#888;font-size:14px;margin:20px 0 30px;"
            v-if="subtitle!=null"
          >{{subtitle}}</p>
        </el-col>
        <el-col :span="3" style="height:1px;">&nbsp;</el-col>
      </el-row>
    </div>
    <div v-if="id==4">
      <el-collapse accordion>
        <el-collapse-item>
          <template slot="title">{{title}}</template>
          <div>{{subtitle}}</div>
        </el-collapse-item>
      </el-collapse>
    </div>
  </div>
</template>
  
<script>
export default {
  props: ["image", "subtitle", "title", "id"],
  data() {
    return {
      activeName: "1"
    };
  }
};
</script>

<style>
/* 边框线 */
.el-collapse {
  border: 0;
}
/* 点击下拉 */
.el-collapse-item__header {
  background-color: black;
  color: #ddb293;
  font-size: 17px;
  border-bottom: 1px solid #444;
  margin-top: 1px;
  padding: 15px 60px 15px 30px;
}
/* 下拉内容 */
.el-collapse-item__wrap {
  background-color: black;
  border: 0;
}
/* 下拉文字 */
.el-collapse-item__content {
  color: #c2c2c2;
  font-size: 15px;
  border-left: 2px solid #ddb293;
  padding: 0 20px;
}
/* > 按钮 */
.el-icon-arrow-right:before {
  content: none;
}
</style>