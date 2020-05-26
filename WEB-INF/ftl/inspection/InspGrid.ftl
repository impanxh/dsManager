<#assign security=JspTaglibs["/WEB-INF/tlds/security.tld"] />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <title>检查记录</title>
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
    <script src="${rc.contextPath}/js/common.js"></script>
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

         <div class="list-item" style="margin-bottom: 0.2rem;margin-top: 0.2rem;">
            <div class="list-img">
                <a href="javascript:void(0);">
                    <img src="${rc.contextPath}/images/slider-sample-default.png">
                </a>
            </div>
        </div>
        <div class="m-grids-3">
            <a class="grids-item" href="javascript:void(0);" id="unitChkLink">
                <div class="grids-icon" id="unitChk">
                    <i class="icon-ucenter-outline" style="font-size: 26px;color:#FF685D;" id="unitChkIcon"></i>
                </div>
                <div class="grids-txt" id="unitChkTxt">单位月度检查记录</div>
            </a>
            <a class="grids-item" href="javascript:void(0);" id="manageChkLink">
                <div class="grids-icon" id="manageChk">
                    <i class="icon-warn-outline" style="font-size: 26px;color:#FF685D;" id="manageChkIcon"></i>
                </div>
                <div class="grids-txt" id="manageChkTxt">主管部门检查记录</div>
            </a>
            <a class="grids-item" href="javascript:void(0);" id="superviseChkLink">
                <div class="grids-icon" id="superviseChk">
                    <i class="icon-feedback" style="font-size: 26px;color:#FF685D;" id="superviseChkIcon"></i>
                </div>
                <div class="grids-txt" id="superviseChkTxt"><span>公安机关检查记录<span></div>
            </a>
            <input type="hidden" id="unitId" />
        </div>

   	</section>
</section>
<!--底部DIV -->
 <#include "/menu/foot.ftl" />
<!--底部DIV -->

<script src="${rc.contextPath}/ydui_js/ydui.js"></script>
<script>
    !function ($) {

    }(jQuery);

    $(document).ready(function(){
        var unitId = getQueryString("unit");
        var myUnit = getUnitById(unitId);
        if(myUnit == null) {
            window.location.href = "${rc.contextPath}/hyList";
        }
        var role = getQueryString("role");
        if(role == null) {
            role = "";
        }
        var roleParam = "&role=" + role;
        $("#unitId").val(unitId);
        $("#unitTitle").text(myUnit.s_Map.unitName_s);
        $("#navbarBack").attr("href", "${rc.contextPath}/placebase?unit=" + unitId+roleParam);

        var userType = queryUserGroup('<@security.authentication property="principal.username" />');
        $("#unitChkLink").attr("href", "${rc.contextPath}/inspection/ResultList?user=3&unit="+unitId+roleParam);
        $("#manageChkLink").attr("href", "${rc.contextPath}/inspection/ResultList?user=2&unit="+unitId+roleParam);
        $("#superviseChkLink").attr("href", "${rc.contextPath}/inspection/ResultList?user=1&unit="+unitId+roleParam);
//        if(isNotNull(userType[1])) {
//            if(userType[1] == "*" ) {
//                // 警员
//            } else {
//                // 主管部门
//                $("#superviseChkIcon").css("color", "#ccc");
//                $("#superviseChkTxt").css("color", "#ccc");
//            }
//        } else {
//            // 单位人员
//            $("#manageChkIcon").css("color", "#ccc");
//            $("#manageChkTxt").css("color", "#ccc");
//            $("#superviseChkIcon").css("color", "#ccc");
//            $("#superviseChkTxt").css("color", "#ccc");
//        }

    })
</script>
</body>


</html>