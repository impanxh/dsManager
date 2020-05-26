<#assign security=JspTaglibs["/WEB-INF/tlds/security.tld"] />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <title>安全责任管理</title>
    <meta content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0" name="viewport" />
    <meta content="yes" name="apple-mobile-web-app-capable" />
    <meta content="black" name="apple-mobile-web-app-status-bar-style" />
    <meta content="telephone=no" name="format-detection" />
    <!-- 引入YDUI样式 -->
    <link rel="stylesheet" href="${rc.contextPath}/ydui_css/ydui.css" />
    <link rel="stylesheet" href="${rc.contextPath}/css/demo.css" />
    <!-- 引入YDUI自适应解决方案类库 -->
    <script src="${rc.contextPath}/ydui_js/ydui.flexible.js"></script>
    <!-- 引入jQuery 2.0+ -->
    <script src="${rc.contextPath}/js/jquery-2.0.2.min.js"></script>
    <script src="${rc.contextPath}/js/jquery.form.js"></script>
    <script src="${rc.contextPath}/js/jquery-dateFormat.js"></script>
    <!-- 引入YDUI脚本 -->
    <script src="${rc.contextPath}/ydui_js/ydui.js"></script>
    <script src="${rc.contextPath}/js/vue.min.js"></script>
    <script src="${rc.contextPath}/js/preCaution.js"></script>
    <script src="${rc.contextPath}/js/address.js"></script>
</head>
<body>
<section class="g-flexview">
    <header class="m-navbar">
        <a href="javascript:history.back(-1);" class="navbar-item" id="navbarBack"><i class="back-ico"></i></a>
        <div class="navbar-center"><span class="navbar-title" id="unitTitle"></span></div>
    </header>

    <section class="g-scrollview">

         <div class="list-item" style="margin-bottom: 0.2rem;margin-top: 0.2rem;">
            <div class="list-img">
                <a href="javascript:void(0);">
                    <img src="${rc.contextPath}/images/slider-sample-default.png">
                </a>
            </div>
        </div>

        <div class="m-grids-4" id="Security">
            <a class="grids-item" v-bind:href="ppUrl">
                <div class="grids-icon" >
                    <i class="icon-order" style="font-size: 26px;color:#FF685D;"></i>
                </div>
                <div class="grids-txt">人防管理</div>
            </a>
             <a class="grids-item" v-bind:href="epUrl">
                <div class="grids-icon" >
                    <i class="icon-order" style="font-size: 26px;color:#FF685D;"></i>
                </div>
                <div class="grids-txt">物防管理</div>
            </a>
             <a class="grids-item" v-bind:href="tpUrl">
                <div class="grids-icon" >
                    <i class="icon-order" style="font-size: 26px;color:#FF685D;"></i>
                </div>
                <div class="grids-txt">技防管理</div>
            </a>
             <a class="grids-item" v-bind:href="mpUrl">
                <div class="grids-icon" >
                    <i class="icon-order" style="font-size: 26px;color:#FF685D;"></i>
                </div>
                <div class="grids-txt">心防管理</div>
            </a>
        </div>
   	</section>
</section>
<!--底部DIV -->
 <#include "/menu/foot.ftl" />
<!--底部DIV -->


<script>
    !function ($) {

    }(jQuery);

    $(document).ready(function(){
        var unitId = getQueryString("unit");
        // 副标题
        var myUnit = getUnitById(unitId);
        if(myUnit == null) {
            window.location.href = "${rc.contextPath}/hyList";
        }

        $("#unitTitle").text(myUnit.s_Map.unitName_s);

        var role = getQueryString("role");
        if(role == null) {
            role = "";
        }

        $("#navbarBack").attr("href", "${rc.contextPath}/placebase?unit="+unitId+"&role="+role);
        var security = new Vue({
            el: '#Security',
            data: {
                ppUrl: "${rc.contextPath}/personPrecaution/PPList?unit="+ unitId+"&role="+role,
                epUrl: "${rc.contextPath}/equipPrecaution/EPList?unit="+ unitId+"&role="+role,
                tpUrl: "${rc.contextPath}/techPrecaution/TPList?unit="+ unitId+"&role="+role,
                mpUrl: "${rc.contextPath}/mindPrecaution/MPList?unit="+ unitId+"&role="+role,
            },
        })

    })
</script>
</body>


</html>