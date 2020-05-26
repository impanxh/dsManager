<#assign security=JspTaglibs["/WEB-INF/tlds/security.tld"] />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <title>人防信息管理</title>
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
    <!-- 引入city包 -->
    <script src="${rc.contextPath}/ydui_js/ydui.citys.js"></script>
    <!-- 引入YDUI脚本 -->
    <script src="${rc.contextPath}/ydui_js/ydui.js"></script>
    <script src="${rc.contextPath}/js/preCaution.js"></script>
    <script src="${rc.contextPath}/js/address.js"></script>
    <script type="application/javascript">
        function gotoAnPP(itemName) {
            var unitId = $("#unitId").val();
            var itemExists = TPItemExists(unitId, itemName);
            if(itemExists) {
                window.location.href = "${rc.contextPath}/personPrecaution/PPView?unit=" + unitId +
                        "&item=" + itemName;
            } else {
                window.location.href = "${rc.contextPath}/personPrecaution/PPEdit?unit=" + unitId +
                        "&item=" + itemName;
            }
        }

        function gotoWorkGroup() {
            var unitId = $("#unitId").val();
            window.location.href = "${rc.contextPath}/personPrecaution/PPWGList?unit=" + unitId;
        }

        function gotoIssue() {
            var unitId = $("#unitId").val();
            window.location.href = "${rc.contextPath}/personPrecaution/PPIssueList?unit=" + unitId;
        }

        function gotoInsp() {
            var unitId = $("#unitId").val();
            window.location.href = "${rc.contextPath}/inspection/InspList?type=人防措施&unit=" + unitId;
        }
    </script>
</head>
<body>
<section class="g-flexview">
    <header class="m-navbar">
        <a href="javascript:history.back(-1);" class="navbar-item" id="navbarBack"><i class="back-ico"></i></a>
        <div class="navbar-center"><span class="navbar-title" id="unitTitle"></span></div>
    </header>

    <section class="g-scrollview">

        <h1 class="demo-pagetitle">人防信息管理</h1>
        <h2 class="demo-detail-title"></h2>
        <div class="m-grids-3">
            <a class="grids-item" href="javascript:void(0);" onclick="gotoWorkGroup()" >
                <div class="grids-icon" >
                    <i class="icon-ucenter-outline" style="font-size: 26px;color:#FF685D;"></i>
                </div>
                <div class="grids-txt">工作小组</div>
            </a>
            <a class="grids-item" href="javascript:void(0);" onclick="gotoIssue()">
                <div class="grids-icon">
                    <i class="icon-warn" style="font-size: 26px;color:#FF685D;"></i>
                </div>
                <div class="grids-txt">隐患纠纷</div>
            </a>
            <a class="grids-item" href="javascript:void(0);" onclick="gotoInsp()">
                <div class="grids-icon">
                    <i class="icon-more" style="font-size: 26px;color:#FF685D;"></i>
                </div>
                <div class="grids-txt"><span>日常巡检<span></div>
            </a>
            <input type="hidden" id="unitId" />
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
        var myUnit = getUnitById(unitId);
        if(myUnit != null) {
            $("#unitId").val(unitId);
            $("#unitTitle").text(myUnit.s_Map.unitName_s);
            $("#navbarBack").attr("href", "${rc.contextPath}/placebase?unit="+unitId);
        }
    })
</script>
</body>


</html>