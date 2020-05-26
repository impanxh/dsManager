<#assign security=JspTaglibs["/WEB-INF/tlds/security.tld"] />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <title>责任管理</title>
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
    <script src="${rc.contextPath}/js/common.js"></script>
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
        <div class="m-grids-2">
            <a class="grids-item" href="javascript:void(0);" id="selfRespLink">
                <div class="grids-icon" id="selfResp">
                    <i class="icon-ucenter-outline" style="font-size: 26px;color:#FF685D;" id="selfRespIcon"></i>
                </div>
                <div class="grids-txt" id="selfRespTxt">主体责任</div>
            </a>
            <a class="grids-item" href="javascript:void(0);" id="manageRespLink">
                <div class="grids-icon" id="manageResp">
                    <i class="icon-warn-outline" style="font-size: 26px;color:#FF685D;" id="manageRespIcon"></i>
                </div>
                <div class="grids-txt" id="manageRespTxt">主管部门监管责任</div>
            </a>
            <a class="grids-item" href="javascript:void(0);" id="superviseRespLink">
                <div class="grids-icon" id="superviseResp">
                    <i class="icon-feedback" style="font-size: 26px;color:#FF685D;" id="superviseRespIcon"></i>
                </div>
                <div class="grids-txt" id="superviseRespTxt"><span>公安机关监督责任<span></div>
            </a>
            <a class="grids-item" href="${rc.contextPath}/logout">
                <div class="grids-icon">
                    <i class="icon-error-outline" style="font-size: 26px;color:#FF685D;"></i>
                </div>
                <div class="grids-txt"><span>退出<span></div>
            </a>
            <input type="hidden" id="unitId" />
        </div>

   	</section>
</section>
<!--底部DIV -->
 <#include "/menu/foot.ftl" />
<!--底部DIV -->

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
    
    
    
<script>
  

    $(document).ready(function(){
        var unitId = getQueryString("unit");
        var myUnit = getUnitById(unitId);
        if(myUnit != null) {
            $("#unitId").val(unitId);
            $("#unitTitle").text(myUnit.s_Map.unitName_s);
            $("#navbarBack").attr("href", "${rc.contextPath}/placeManage?unit=" + myUnit.s_Map.hyType_s);

            var userType = queryUserGroup('<@security.authentication property="principal.username" />');
            if(isNotNull(userType[1])) {
                
                if(userType[1] == "*" || userType[1] == "*00") {
                    // 警员
                     $("#selfRespLink").attr("href", "${rc.contextPath}/placebase?role=self&unit="+unitId);
                    $("#manageRespIcon").css("color", "#ccc");
                    $("#manageRespTxt").css("color", "#ccc");
                    $("#superviseRespLink").attr("href", "${rc.contextPath}/placebase?unit="+unitId);
                } else {
	                $("#selfRespIcon").css("color", "#ccc");
	                $("#selfRespTxt").css("color", "#ccc");
                    // 主管部门
                    $("#superviseRespIcon").css("color", "#ccc");
                    $("#superviseRespTxt").css("color", "#ccc");
                    $("#manageRespLink").attr("href", "${rc.contextPath}/placebase?unit="+unitId);
                }
            } else {
                // 单位人员
                $("#manageRespIcon").css("color", "#ccc");
                $("#manageRespTxt").css("color", "#ccc");
                $("#superviseRespIcon").css("color", "#ccc");
                $("#superviseRespTxt").css("color", "#ccc");
                $("#selfRespLink").attr("href", "${rc.contextPath}/placebase?unit="+unitId);
            }

        } else {
            window.location.href = "${rc.contextPath}/hyList";
        }
    })
</script>
</body>


</html>