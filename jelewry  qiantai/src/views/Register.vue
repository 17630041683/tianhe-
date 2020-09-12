<template>
  <div id="con">
    <!-- 注册页面 -->
    <main>
      <div class="reg">
        <div style="display: flex;justify-content: space-between;margin-bottom: 20px;">
          <h3 style="font-size:20px;color:#ddb293;">欢迎注册珠宝商城</h3>
          <router-link
            style="font-size:14px;color:#ddb293;margin-top:8px;"
            :to="{path:'login'}"
          >已有账号</router-link>
        </div>
        <div>
          <input
            type="text"
            id="uname"
            placeholder="请输入您的用户名"
            v-model="uname"
            @blur="blur"
            @focus="focus"
          />
          <span id="name"></span>
        </div>
        <div>
          <input
            type="password"
            id="upwd"
            v-model="upwd"
            @blur="blur"
            @focus="focus"
            placeholder="请输入您的密码"
          />
          <span id="pwd"></span>
        </div>
        <div>
          <input
            type="password"
            id="cpwd"
            @blur="blur"
            @focus="focus"
            v-model="cpwd"
            placeholder="请再次输入密码"
          />
          <span id="tpwd"></span>
        </div>
        <div>
          <input id="email" placeholder="请输入您的邮箱" @blur="blur" v-model="email" />
          <span id="mail"></span>
        </div>
        <div>
          <input id="phone" placeholder="请输入您的电话" @blur="blur" v-model="phone" class="p-2 mr-3" />
          <span id="tel"></span>
        </div>
        <div>
          <button class="regbtn" @click="reg">注册</button>
        </div>
      </div>
    </main>
  </div>
</template>
<script>
import Qs from "qs";
export default {
  data() {
    return {
      uname: "",
      upwd: "",
      cpwd: "",
      email: "",
      phone: "",
      sex: 0
    };
  },
  methods: {
    focus(e) {
      //获得焦点事件
      var that = e.target;
      if (this.id == "uname") {
        $("#name")
          .css("color", "#fff")
          .html("请输入3~12位数字、字母或下划线，不能以数字开头");
        return;
      } else if (this.id == "upwd") {
        $("#pwd")
          .css("color", "#fff")
          .html("请输入6~12位数字或字母");
        return;
      } else if (this.id == "cpwd") {
        $("#tpwd")
          .css("color", "#fff")
          .html("请输入6~12位数字或字母");
        return;
      }
    },
    blur(e) {
      var input = e.target;
      if (input.id == "uname") {
        var u = this.uname;
        if (!u) {
          alert("用户名不能为空");
          return;
        }
        var reg = /^[a-z]\w{2,11}$/i;
        if (!reg.test(u)) {
          this.uname = "";
          $("#name")
            .css("color", "red")
            .html("用户名格式不正确");
          return;
        } else {
          var url = "check";
          var obj = { params: { uname: this.uname } };
          console.log(obj);
          this.axios.get(url, obj).then(res => {
            console.log(res);
            console.log(res.data);
            if (res.data.code == 1) {
              $("#name")
                .css("color", "red")
                .html("用户名已存在");
              this.uname = "";
              return;
            } else {
              $("#name")
                .css("color", "green")
                .html("√");
              return;
            }
          });
        }
      } else if (input.id == "upwd") {
        var p = this.upwd;
        if (!p) {
          alert("密码不能为空！");
          return;
        }
        var reg = /^[0-9a-z]{6,12}$/i;
        if (!reg.test(p)) {
          this.upwd = "";
          $("#pwd")
            .css("color", "red")
            .html("密码格式不正确");
          return;
        } else {
          $("#pwd")
            .css("color", "green")
            .html("√");
          return;
        }
      } else if (input.id == "cpwd") {
        var p = this.upwd;
        var t = this.cpwd;
        if (!t) {
          alert("密码验证不能为空！");
          return;
        }
        if (p != t) {
          this.cpwd = "";
          $("#tpwd")
            .css("color", "red")
            .html("前后密码不一致");
          return;
        } else {
          $("#tpwd")
            .css("color", "green")
            .html("√");
          return;
        }
      } else if (input.id == "email") {
        var e = this.email;
        if (!e) {
          alert("邮箱不能为空！");
          return;
        }
        var reg = /^[0-9a-z]\w*@\w+\.\w+(\.cn)?$/i;
        if (!reg.test(e)) {
          $("#mail")
            .css("color", "red")
            .html("邮箱格式不正确");
          return;
        } else {
          $("#mail")
            .css("color", "green")
            .html("√");
          return;
        }
      } else if (input.id == "phone") {
        var ph = this.phone;
        if (!ph) {
          alert("电话不能为空！");
          return;
        }
        var reg = /^1[3-9]\d{9}$/;
        if (!reg.test(ph)) {
          $("#tel")
            .css("color", "red")
            .html("电话格式不正确");
          return;
        } else {
          $("#tel")
            .css("color", "green")
            .html("√");
          return;
        }
      }
    },
    reg() {
      var name = this.uname;
      var pwd = this.upwd;
      var cp = this.cpwd;
      var em = this.email;
      var ph = this.phone;
      if (name == "") {
        alert("用户名不能为空");
        // uname.focus();
        return;
      }
      if (pwd == "") {
        alert("密码不能为空");
        upwd.focus();
        return;
      }
      if (cp == "") {
        alert("验证密码不能为空");
        cpwd.focus();
        return;
      }
      if (em == "") {
        alert("邮箱不能为空");
        email.focus();
        return;
      }
      if (ph == "") {
        alert("手机号不能为空");
        phone.focus();
        return;
      }
      var url = "reg";
      var obj = {
        params: { uname: name, upwd: pwd, email: em, phone: ph }
      };
      console.log(obj);
      this.axios.get(url, obj).then(res => {
        console.log(res);
        if (res.data.code == -1) {
          alert("注册失败,请重试");
          this.$router.push("register");
          $("#uname").focus();
        } else {
          alert("注册成功");
          this.$router.push("/");
        }
      });
    }
  }
};
</script>
<style  scoped>
main {
  height: 500px;
}
.reg {
  position: absolute;
  top: 15%;
  left: 50%;
  margin-left: -190px;
  width: 380px;
  background: white;
  padding: 20px;
}
.reg .regbtn {
  border: 0;
  border-radius: 5px;
  display: block;
  width: 328px;
  height: 50px;
  font-size: 22px;
  margin: 10px 0 30px 27px;
  background: #fab7da;
  color: #333;
}
.reg div > input {
  border: 2px solid #fadca6;
  width: 320px;
  height: 48px;
  margin-bottom: 15px;
  padding-left: 60px !important;
  font-size: 14px;
  color: black !important;
  /* opacity:0.1; */
}
/* input字体样式 */
::-webkit-input-placeholder {
  /* WebKit browsers */
  color: #000 !important;
}
:-moz-placeholder {
  /* Mozilla Firefox 4 to 18 */
  color: #000 !important;
}
::-moz-placeholder {
  /* Mozilla Firefox 19+ */
  color: #000 !important;
}
:-ms-input-placeholder {
  /* Internet Explorer 10+ */
  color: #000 !important;
}
.reg #uname {
  background: url("../assets/img/small/user.png") no-repeat 3%;
}
.reg #cpwd {
  background: url("../assets/img/small/password.png") no-repeat 3%;
}
.reg #upwd {
  background: url("../assets/img/small/password.png") no-repeat 3%;
}
.reg #email {
  background: url("../assets/img/small/email.png") no-repeat 3%;
}
.reg #phone {
  background: url("../assets/img/small/phone.png") no-repeat 3%;
}
.reg #uname,
.reg #upwd,
.reg #cpwd,
.reg #email,
.reg #phone {
  background-size: 10%;
}
</style>