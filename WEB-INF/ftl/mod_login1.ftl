<#assign security=JspTaglibs["/WEB-INF/tlds/security.tld"] />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <title>模块列表</title>
    <meta content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0" name="viewport" />
    <meta content="yes" name="apple-mobile-web-app-capable" />
    <meta content="black" name="apple-mobile-web-app-status-bar-style" />
    <meta content="telephone=no" name="format-detection" />
    <!-- 引入YDUI样式 -->
    <link rel="stylesheet" href="${rc.contextPath}/ydui_css/ydui.css" />
    <link rel="stylesheet" href="${rc.contextPath}/css/demo.css" />
    <!-- 引入YDUI自适应解决方案类库 -->
    <script src="${rc.contextPath}/ydui_js/ydui.flexible.js"></script>
</head>
<body>
<section class="g-flexview">
    <header class="m-navbar">
        <a href="" class="navbar-item"><i class="back-ico"></i></a>
        <div class="navbar-center"><span class="navbar-title">用户登录</span></div>
    </header>

    <section class="g-scrollview">

        <h1 class="demo-pagetitle">消防安全管理平台</h1>
        <h2 class="demo-detail-title">一个方便，快捷，高效，安全的消防安全信息管理平台</h2>
        <form id="userForm" class="am-form" name='loginForm' action='${rc.contextPath}/loginForLayer' method='POST'>
        <div class="m-cell">
            <div class="cell-item">
                <div class="cell-left"> <i class="cell-icon icon-ucenter"></i>用户名：</div>
                <div class="cell-right "><input type="text" id="doc-ipt-email-1" value="" name="username" class="cell-input" placeholder="请输入用户名" autocomplete="off" /></div>
            </div>
            <div class="cell-item">
                <div class="cell-left"> <i class="cell-icon icon-star"></i>密码：</div>
                <div class="cell-right "><input type="password" id="doc-ipt-pwd-1" value="" name="password" class="cell-input" placeholder="请输入密码" autocomplete="off" /></div>
            </div>
        </div>
        </form>

   	</section>

    <footer class="m-tabbar">
            <div class="m-button" style="width: 100%;">
                <button type="button" id="loginbut"  onclick="sub()" class="btn-block btn-primary">登录</button>
            </div>
        </footer>
</section>
</script>
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