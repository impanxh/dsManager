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
    <!-- 引入jQuery 2.0+ -->
    <script src="${rc.contextPath}/js/jquery-2.0.2.min.js"></script>
    <!-- 引入YDUI自适应解决方案类库 -->
    <script src="${rc.contextPath}/ydui_js/ydui.flexible.js"></script>
    <script src="${rc.contextPath}/js/address.js"></script>
    <!-- 引入YDUI脚本 -->
    <script type="text/javascript" language="javascript"
            src="${rc.contextPath}/js/vue.min.js"></script>
    <script src="${rc.contextPath}/ydui_js/ydui.js"></script>
    <script src="${rc.contextPath}/ydui_js/template.js"></script>
    <script src="${rc.contextPath}/ydui_js/ydui-list.js"></script>
</head>
<body>
<section class="g-flexview">
    <header class="m-navbar">
        <a href="javascript:history.back(-1);" class="navbar-item" id="navbarBack"><i class="back-ico"></i></a>
        <div class="navbar-center"><span class="navbar-title" id="unitTitle"></span></div>
        <a href="${rc.contextPath}/inspection/InspStart" class="navbar-item" id="newInspect" style="color:yellowgreen"><b>新的检查</b></a>
    </header>

    <section class="g-scrollview" id="inspSection">
        <h1 class="demo-pagetitle">检查记录</h1>
        <h2 class="demo-detail-title"></h2>
        <div id="inspList" class="m-list list-theme1"></div>
   	</section>

    <script id="inspTemplate" type="text/html">
        <div class="m-cell">
            {{each list as data}}
                {{if data.i_Map.failureInsp_i > 0}}
                <a href="${rc.contextPath}/inspection/InspView?id={{data.id}}" class="cell-item J_Link"<#-- j_link比较重要需要加--> data-page="{{page}}">
                <div class="cell-left" style="color:red">
                    {{data.s_Map.unitName_s}} {{data.s_Map.inspTime_s}}
                </div>
                <div class="cell-right" style="color:red">
                    {{data.i_Map.failureInsp_i}} 条检查未通过
                </div>
                {{else}}
                <a href="${rc.contextPath}/inspection/InspView?id={{data.id}}" class="cell-item J_Link"<#-- j_link比较重要需要加--> data-page="{{page}}">
                <div class="cell-left" style="color:green">
                    {{data.s_Map.unitName_s}} {{data.s_Map.inspTime_s}}
                </div>
                <div class="cell-right" style="color:green">
                    检查通过
                </div>
                {{/if}}
            </a>
            {{/each}}
        </div>
    </script>

</section>
<!--底部DIV -->
 <#include "/menu/foot.ftl" />
<!--底部DIV -->

<script src="${rc.contextPath}/js/jquery.form.js"></script>
<script src="${rc.contextPath}/js/preCaution.js"></script>
<!-- 引入city包 -->
<script src="${rc.contextPath}/ydui_js/ydui.citys.js"></script>
<script>
    !function ($) {
    }(jQuery);

    $(function(){
        var unitId = getQueryString("unit");
        var inspType = getQueryString("type") || "";

        // 副标题
        var myUnit = getUnitById(unitId);
        if(myUnit != null) {
            //$("#unitId").val(unitId);
            $("#unitTitle").text(myUnit.s_Map.unitName_s);
            $("#newInspect").attr("href", "/inspection/InspStart?unit="+unitId+"&type="+inspType);
            if(inspType == "") {
                $("#navbarBack").attr("href", "${rc.contextPath}/placebase?unit="+unitId);
            } else {
                $("#navbarBack").attr("href", "${rc.contextPath}/personPrecaution/PPIndex?unit="+unitId);
            }
        } else {
            $("#newInspect").attr("href", "/inspection/InspStart?type="+inspType);
            $("#navbarBack").attr("href", "${rc.contextPath}/modList");
            unitId = "";
        }


        var listRequestJson = {
            "pageSize":10,"start":0,"page":1,
            "templeteDivId":"inspTemplate",//vue script template id
            "sectionId":'inspSection',//vue 最外层显示数据的section id
            "listContent_id":"inspList"//vue 二层内容id
        };

        var loadMore = function (callback) {
            $.ajax({
                url: 'http://'+changeAddr()+'/common/getModelList',
                type: 'GET',
                data: {
                    "filter[className]": "Inspection",
                    "filter[unitId_s_s_EQ]" : unitId,
                    start: listRequestJson.start,
                    length: listRequestJson.pageSize,
                    "userid":"<@security.authentication property="principal.username" />",
                    "isTaskQuery": "yes"
                },
                success: function (ret) {
                    typeof callback == 'function' && callback(ret);
                }
            });
        };
        loadScrollTable(listRequestJson,loadMore);
    });


</script>
</body>
</html>