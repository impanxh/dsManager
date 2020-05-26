<#assign security=JspTaglibs["/WEB-INF/tlds/security.tld"] />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <title></title>
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
<section class="g-flexview" style="margin-bottom: 0;"> 
    <header class="m-navbar">
        
        <div class="navbar-center"><span class="navbar-title">登录</span></div>
    </header>

    <section class="g-scrollview" style="background-color: white;">

        <div class="list-item" style="margin-bottom: 1rem;margin-top: 2rem;" >
            <div class="list-img">
                <a href="javascript:void(0);">
                    <img src="${rc.contextPath}/images/login-logo.png">
                </a>
            </div>
        </div>
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

        <footer class="m-tabbar">
            <div class="m-button" style="width: 100%;margin-top: .5rem;">
                <button type="button" id="loginbut"  onclick="sub()" class="btn-block btn-primary">登录</button>
            </div>
        </footer>

   	</section>

    
</section>
</script>
</body>
<!-- 引入jQuery 2.0+ -->
<script src="${rc.contextPath}/js/jquery-2.0.2.min.js"></script>
<script src="${rc.contextPath}/js/jquery.form.js"></script>
<script src="${rc.contextPath}/ydui_js/ydui.js"></script>
<!--<![endif]-->
<!--[if lte IE 8 ]>
<script src="http://libs.baidu.com/jquery/1.11.3/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="assets/js/amazeui.ie8polyfill.min.js"></script>
<![endif]-->
<script src="${rc.contextPath}/ydui_js/amazeui.min.js"></script>
<script src="${rc.contextPath}/ydui_js/app.js"></script>
 <script src="${rc.contextPath}/js/address.js"></script>
<script src="${rc.contextPath}/js/common.js"></script>
<script src="${rc.contextPath}/js/login.js"></script>
      
</html>