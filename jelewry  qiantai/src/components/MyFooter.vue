<template>
  <div id="f_one" class="con">
    <div id="f_two"></div>
    <div id="f_three">
      <ul>
        <li>会员指引</li>
        <li>会员积分指引</li>
        <li>会员手册</li>
        <li>会员权益</li>
      </ul>
      <ul>
        <li>关于我们</li>
        <li>专业认证</li>
        <li>合作专区</li>
        <li>品牌理念</li>
      </ul>
      <ul>
        <li>购物指南</li>
        <li>购买流程</li>
        <li>支付方式</li>
        <li>配送流程</li>
      </ul>
      <ul>
        <li>售后服务</li>
        <li>退货流程</li>
        <li>服务咨询</li>
        <li>办理售后</li>
      </ul>
      <ul>
        <li>服务条款</li>
        <li>终身保养</li>
        <li>注册协议</li>
        <li>隐私声明</li>
      </ul>
    </div>
    <span>xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx</span>
  </div>
</template>

<script>
export default {};
</script>

<style>
body {
  line-height: 1.5;
}
#f_one {
  height: 280px;
  background: rgba(0, 0, 0, 1);
}
#f_one > #f_two {
  border-top: 1px solid #333;
  margin: 120px 0 50px;
}
#f_one > #f_three {
  display: flex;
  justify-content: space-around;
}
#f_one > #f_three > ul {
  list-style: none;
}
#f_one > #f_three > ul > li:first-child {
  color: #a3a3a3;
  font-size: 16px;
}
#f_one > #f_three > ul > li:not(:first-child) {
  color: #888;
  font-size: 14px;
  margin-top: 12px;
}
#f_one > span {
  color: #999;
  display: block;
  font-size: 14px;
  margin: 50px 0 0 80px;
}
</style>