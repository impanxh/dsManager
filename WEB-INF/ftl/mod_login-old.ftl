<#assign security=JspTaglibs["/WEB-INF/tlds/security.tld"] />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <title>系统登录</title>
    <meta content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0" name="viewport" />
    <meta content="yes" name="apple-mobile-web-app-capable" />
    <meta content="black" name="apple-mobile-web-app-status-bar-style" />
    <meta content="telephone=no" name="format-detection" />
    <!-- 引入YDUI样式 -->
    <link rel="stylesheet" href="${rc.contextPath}/ydui_css/ydui.css" />
    <link rel="stylesheet" href="${rc.contextPath}/ydui_css/iconfont.css" />

    <!-- 引入登录界面样式 -->
    <link rel="stylesheet" href="${rc.contextPath}/ydui_css/amazeui.min.css">
    <link rel="stylesheet" href="${rc.contextPath}/ydui_css/app.css">
    <!-- 引入YDUI自适应解决方案类库 -->
    <script src="${rc.contextPath}/ydui_js/ydui.flexible.js"></script>

    <style type="text/css">
    input::-webkit-input-placeholder, textarea::-webkit-input-placeholder {

　　color: #fff;

　　}

　　input:-moz-placeholder, textarea:-moz-placeholder {

　　color:#fff;

　　}

　　input::-moz-placeholder, textarea::-moz-placeholder {

　　color:#fff;

　　}

　　input:-ms-input-placeholder, textarea:-ms-input-placeholder {

　　color:#fff;

　　}


    </style>
</head>
<body>
<div class="am-g myapp-login">
    <div class="myapp-login-bg">
         <div class="myapp-login-logo">
            <i class="am-icon-stumbleupon"></i>
         </div>

         <div class="am-u-sm-10 myapp-login-form">
            <form id="userForm" class="am-form" name='loginForm' action='${rc.contextPath}/loginForLayer' method='POST'>
            
              <fieldset>
        
                <div class="am-form-group">

                  <input type="email" class="" id="doc-ipt-email-1" value=" " name="username" placeholder="登录名">
                </div>
                

                <div class="am-form-group">
                 
                  <input type="password" class="" id="doc-ipt-pwd-1" value="" name="password"  placeholder="请输入密码">
                </div>
                <p><button type="button" id="loginbut"  onclick="sub()" class="am-btn am-btn-default">登录</button></p>
                <div class="login-text">
                    Forgot Password?
                </div>
              </fieldset>
            </form>
         </div>
    </div>
</div>
</body>
<!-- 引入jQuery 2.0+ -->
<script src="${rc.contextPath}/js/jquery-2.0.2.min.js"></script>
<script src="${rc.contextPath}/js/jquery.form.js"></script>
<!--<![endif]-->
<!--[if lte IE 8 ]>
<script src="http://libs.baidu.com/jquery/1.11.3/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="assets/js/amazeui.ie8polyfill.min.js"></script>
<![endif]-->
<script src="${rc.contextPath}/ydui_js/amazeui.min.js"></script>
<script src="${rc.contextPath}/ydui_js/app.js"></script>
<script type="text/javascript">
function sub(){ 
    $('#userForm').ajaxForm(function(data) {
      if (data.left == true) {
      document.getElementById('loginbut').setAttribute('disabled', true);
      $("#loginbut").css("background-color", "#85A2AD");
      var uptime = window.setTimeout(function() {
        window.location.href="${rc.contextPath}/modList";
        clearTimeout(uptime);
      }, 2000)
    } else {
      layer.msg("登陆失败");
    }

    }).submit();
}

</script>
</html>