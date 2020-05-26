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
        <a href="${rc.contextPath}/mod_login" class="navbar-item"><i class="back-ico"></i></a>
        <div class="navbar-center"></div>
    </header>

    <section class="g-scrollview">

        <h1 class="demo-pagetitle">德清县单位主体责任<br>管理信息平台</h1>
        <h2 class="demo-detail-title">一个方便，快捷，高效，安全的信息管理平台</h2>
        <div class="m-grids-4">
            <a class="grids-item" href="${rc.contextPath}/placeManage">
                <div class="grids-icon" >
                    <i class="icon-order" style="font-size: 26px;"></i>
                </div>
                <div class="grids-txt">场所管理</div>
            </a>
            <a class="grids-item" href="${rc.contextPath}/personPrecaution/PPIssueList">
                <div class="grids-icon">
                    <i class="icon-type" style="font-size: 26px;"></i>
                </div>
                <div class="grids-txt">纠纷隐患</div>
            </a>
            <a class="grids-item" href="${rc.contextPath}/inspection/InspList">
                <div class="grids-icon">
                    <i class="icon-feedback" style="font-size: 26px;"></i>
                </div>
                <div class="grids-txt">检查记录</div>
            </a>
            <a class="grids-item" href="${rc.contextPath}/userInfo">
                <div class="grids-icon">
                    <i class="icon-ucenter" style="font-size: 26px;"></i>
                </div>
                <div class="grids-txt">我的信息</div>
            </a>
            <a class="grids-item" href="html/grids.html">
                <div class="grids-icon">
                    <i class="icon-setting" style="font-size: 26px;"></i>
                </div>
                <div class="grids-txt">修改密码</div>
            </a>
            <a class="grids-item" href="">
                <div class="grids-icon">
                    <i class="icon-more" style="font-size: 26px;"></i>
                </div>
                <div class="grids-txt">待增加</div>
            </a>
            <a class="grids-item" href="">
                <div class="grids-icon">
                    <i class="icon-more" style="font-size: 26px;"></i>
                </div>
                <div class="grids-txt">待增加</div>
            </a>
            <a class="grids-item" href="">
                <div class="grids-icon">
                    <i class="icon-more" style="font-size: 26px;"></i>
                </div>
                <div class="grids-txt">待增加</div>
            </a>
            
        </div>

   	</section>
</section>
</script>
</body>
<!-- 引入jQuery 2.0+ -->
<script src="${rc.contextPath}/js/jquery-2.0.2.min.js"></script>
<!-- 引入city包 -->
<script src="${rc.contextPath}/ydui_js/ydui.citys.js"></script>
<!-- 引入YDUI脚本 -->
<script src="${rc.contextPath}/ydui_js/ydui.js"></script>
<script>

    function gotoUnit() {            
        window.location.href = "${rc.contextPath}/mod/placeManage";
    }

    function gotoIssue() {            
        window.location.href = "${rc.contextPath}/trouble/list";
    }

    !function ($) {
        
    }(jQuery);

    //ready
    // $(function(){
    // });
</html>