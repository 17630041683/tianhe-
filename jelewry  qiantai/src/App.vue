<template>
  <div id="app">
    <my-header></my-header>
    <router-view />
    <my-footer></my-footer>
  </div>
</template>

<style>
body {
  background: rgba(0, 0, 0, 1);
}
#app .con {
  width: 1200px;
  margin: 0 auto;
}
#app a {
  cursor: pointer;
}
#app .con .el-icon-arrow-right:before {
  color: #707070;
}
#app .con .el-breadcrumb__inner a,
.el-breadcrumb__inner.is-link {
  font-weight: 500;
  color: #bbb;
}
#app .con .el-breadcrumb__inner a,
.el-breadcrumb__inner.is-link:hover {
  color: #ddb293;
}
</style>
