<template>
  <div id="conn">
    <main class="text-center">
      <div class="login">
        <div class="l_one">
          <p style="font-size:20px;color:#ddb293;">珠宝会员登录</p>
          <router-link style="font-size:14px;color:#ddb293;margin-top:8px;" to="/register">新用户注册</router-link>
        </div>
        <div>
          <input
            placeholder="请输入用户名"
            id="uname"
            v-model="uname"
            @blur="unameblur"
            @focus="unamefocus"
          />
          <span id="utxt">请输入3~12位数字或字母，不能以数字开头</span>
        </div>
        <div>
          <input
            type="password"
            placeholder="请输入密码"
            v-model="upwd"
            id="upwd"
            @focus="upwdfocus"
            @blur="upwdblur"
          />
          <span id="ptxt">请输入6~12位数字或字母</span>
        </div>
        <div class="l_one">
          <label class="yes" style="font-size:14px;position: relative;">
            <input type="checkbox" />记住登录名
          </label>
          <a class="ayes" href="javascript:;" style="font-size:14px;">忘记密码?</a>
        </div>
        <!-- <canvas width="320" height="60" id="check" @click="drawCanvas">您的浏览器不支持canvas标签！请升级浏览器</canvas> -->
        <div class="l_btn">
          <button class="btn" @click="login">登录</button>
        </div>
      </div>
    </main>
  </div>
</template>
<script>
export default {
  data() {
    return {
      uname: "",
      upwd: "",
      reg: "",
      n: 5,
      str: ""
    };
  },
  methods: {
    testblur() {
      //转小写再比较
      var str = this.str.toLowerCase();
      var reg = this.reg.toLowerCase();
      if (str == reg) {
        $("#ttest")
          .css("color", "green")
          .html("验证成功！");
      } else {
        $("#ttest")
          .css("color", "black")
          .html("验证失败！");
      }
    },
    unamefocus() {
      //用户名输入框获取焦点
      // var utxt=document.getElementById("utxt");
      // utxt.style.display="block"
      $("#utxt").css({ display: "block", color: "#000" });
    },
    upwdfocus() {
      //焦点输入框获取焦点   //验证修改
      if ($("#utxt").css("display") == "block") {
        $("#txt").css("display", "none");
      }
      $("#ptxt").css("display", "block");
    },
    unameblur() {
      //用户名输入框失去焦点验证
      var reg = /^\w{3,12}$/i;
      if (!reg.test(this.uname)) {
        $("#utxt").css("color", "red");
        $("#utxt").html("用户名格式不正确！！");
        this.uname = "";
        $("#uname").focus();
        return;
      } else {
        $("#utxt").css("color", "green");
        $("#utxt").html("用户名输入成功！！");
        $("#upwd").focus();
      }
    },
    upwdblur() {
      //密码输入框失去焦点验证
      var reg = /^[0-9a-z]{6,12}$/i;
      if (!reg.test(this.upwd)) {
        $("#ptxt")
          .css("color", "red")
          .html("密码格式不正确！");
        this.upwd = "";
        return;
      } else {
        $("#ptxt")
          .css("color", "green")
          .html("密码输入成功！");
        return;
      }
    },
    login() {
      /*定时器不确定是否执行，后续验证，如果不行，尝试将n放在data中*/
      var uname = this.uname;
      var upwd = this.upwd;
      if (!uname) {
        alert("用户名不能为空！");
        $("#uname").focus();
        return;
      }
      if (!upwd) {
        alert("密码不能为空！");
        $("#upwd").focus();
        return;
      }
      // if ($("#ttest").html() != "验证成功！") {
      //   alert("请先进行验证！");
      //   $("#test").focus();
      //   return;
      // }
      var obj = { params: { uname, upwd } };
      var url = "login";
      this.axios.get(url, obj).then(res => {
        // console.log(res);
        if (res.data.code == 1) {
          // this.$store.commit("login", this.uname);
          sessionStorage.setItem("uname", this.uname);
          // sessionStorage.setItem("islogin", true);
          //丁:更新vuex中保存的用户状态 触发updateUser方法
          this.$store.commit("updateUser");
          //丁:登陆成功返回首页
          this.$router.replace({ path: "/" });
        } else {
          alert("用户名或密码错误！");
          this.uname = "";
          this.upwd = "";
          $("#uname").focus();
        }
      });
    },
    /*产生一个随机数 可设置随机数区间*/
    ranNum(min, max) {
      return Math.random() * (max - min) + min;
    },
    /*返回一个随机颜色，可设置颜色区间*/
    ranColor(min, max) {
      var r = this.ranNum(min, max);
      var g = this.ranNum(min, max);
      var b = this.ranNum(min, max);
      // return "rgb(" + r + "," + g + "," + b + ")";
      return `rgb(${r},${g},${b})`;
    },
    /*随机字符串数组*/
    ranStr() {
      var str =
        "QWERTYUIOPASDFGHJKLZXCVBNMqwertyuiopasdfghjklzxcvbnm0123456789";
      return str.split("").sort(function() {
        return Math.random() - 0.5;
      });
    },
    /*绘制文本字符串*/
    drawText(
      canvasId,
      canvasW,
      canvasH,
      num,
      fsMin,
      fsMax,
      frMin,
      frMax,
      min,
      max
    ) {
      var ctx = document.getElementById("check").getContext("2d");
      var str = "";
      for (var i = 0; i < num; i++) {
        var char = this.ranStr()[Math.floor(0, this.ranStr().length)];
        var fs = this.ranNum(fsMin, fsMax);
        canvasId.font = fs + "px Verdana";
        canvasId.fillStyle = this.ranColor(min, max);
        // 保存绘制的状态
        canvasId.save();
        // context.translate(x,y);
        // x    添加到水平坐标（x）上的值
        // y    添加到垂直坐标（y）上的值
        // 偏移
        canvasId.translate((canvasW / num) * i + canvasW / 20, 0);
        // 变换角度
        canvasId.rotate((this.ranNum(frMin, frMax) * Math.PI) / 180);
        // context.fillText(text,x,y,maxWidth);
        // text    规定在画布上输出的文本。
        // x    开始绘制文本的 x 坐标位置（相对于画布）。
        // y    开始绘制文本的 y 坐标位置（相对于画布）。
        // maxWidth    可选。允许的最大文本宽度，以像素计。
        canvasId.fillText(char, 0, (canvasH + fs) / 2.5, canvasW / num);
        // 返回之前保存过的路径状态和属性
        ctx.restore();
        str += char;
      }
      // console.log(str);
      return str;
    },
    /*绘制背景*/
    drawBg(canvasId, canvasW, canvasH, min, max) {
      // 绘制canvas背景
      canvasId.fillStyle = this.ranColor(min, max);
      // 填充颜色
      canvasId.fillRect(0, 0, canvasW, canvasH);
    },
    /*绘制干扰圆点*/
    drawCircle(canvasId, canvasW, canvasH, num, r, min, max) {
      for (var i = 0; i < num; i++) {
        // 开始绘制 （拿起笔）
        canvasId.beginPath();
        // context.arc(x,y,r,sAngle,eAngle,counterclockwise); （绘制）
        // x    圆的中心的 x 坐标。
        // y    圆的中心的 y 坐标。
        // r    圆的半径。
        // sAngle    起始角，以弧度计。（弧的圆形的三点钟位置是 0 度）。
        // eAngle    结束角，以弧度计。
        // counterclockwise    可选。规定应该逆时针还是顺时针绘图。False = 顺时针，true = 逆时针。
        canvasId.arc(
          this.ranNum(0, canvasW),
          this.ranNum(0, canvasH),
          r,
          0,
          2 * Math.PI
        );
        // 填充颜色
        canvasId.fillStyle = this.ranColor(min, max);
        // 填充
        canvasId.fill();
        // 闭合绘制 （放开笔）
        canvasId.closePath();
      }
    },
    /*绘制干扰线段*/
    drawLine(canvasId, canvasW, canvasH, num, min, max) {
      for (var i = 0; i < num; i++) {
        // 开始绘制 （拿起笔）
        canvasId.beginPath();
        // 绘制开始点
        canvasId.moveTo(this.ranNum(0, canvasW), this.ranNum(0, canvasH));
        // 绘制结束点
        canvasId.lineTo(this.ranNum(0, canvasW), this.ranNum(0, canvasH));
        canvasId.strokeStyle = this.ranColor(min, max);
        canvasId.stroke();
        canvasId.closePath();
      }
    },
    drawCanvas() {
      var ctx = document.getElementById("check").getContext("2d");
      var ctxW = document.getElementById("check").clientWidth;
      var ctxH = document.getElementById("check").clientHeight;
      // 清空canvas
      ctx.clearRect(0, 0, 200, 60);
      // 绘制背景
      this.drawBg(ctx, ctxW, ctxH, 200, 255);
      // 绘制干扰圆点
      this.drawCircle(ctx, ctxW, ctxH, 20, 5, 200, 255);
      // 绘制干扰线段
      this.drawLine(ctx, ctxW, ctxH, 20, 0, 255);
      // 绘制验证码
      var str = this.drawText(ctx, ctxW, ctxH, 4, 10, 50, -30, 30, 0, 100);
      this.str = str;
      return str;
    }
  },
  mounted() {
    // this.drawCanvas();
  }
};
</script>
<style  scoped>
main {
  height: 350px;
}

.login {
  position: absolute;
  top: 15%;
  left: 50%;
  margin-left: -200px;
  background: white;
  padding: 20px;
  width: 310px;
}
.login .l_one {
  display: flex;
  justify-content: space-between;
  margin-bottom: 20px;
}
.login .register {
  font-size: 14px;
  margin-left: 65px;
  color: #222;
  text-decoration: none;
}
.login div > input {
  border: 0;
  width: 300px;
  height: 35px;
  margin-bottom: 15px;
  padding-left: 15px;
  font-size: 14px;
  opacity: 0.7;
}
.login .changecan {
  display: block;
  font-size: 14px;
}
.login .l_btn {
  margin: 0 auto;
  width: 300px;
  height: 40px;
}
.login .btn {
  width: 100%;
  height: 100%;
  font-size: 20px;
  border: 0;
  border-radius: 5px;
  background: #fab7da;
}
#ttest {
  display: block;
  font-size: 12px;
}
#utxt,
#ptxt {
  display: none;
  font-size: 12px;
}
</style>
