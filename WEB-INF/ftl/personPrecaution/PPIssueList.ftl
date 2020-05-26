<#assign security=JspTaglibs["/WEB-INF/tlds/security.tld"] />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <title>纠纷隐患记录</title>
    <meta content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0" name="viewport" />
    <meta content="yes" name="apple-mobile-web-app-capable" />
    <meta content="black" name="apple-mobile-web-app-status-bar-style" />
    <meta content="telephone=no" name="format-detection" />
    <!-- 引入YDUI样式 -->
    <link rel="stylesheet" href="${rc.contextPath}/ydui_css/ydui.css" />
    <link rel="stylesheet" href="${rc.contextPath}/css/demo.css" />
    <!-- 引入jQuery 2.0+ -->
    <script src="${rc.contextPath}/js/jquery-2.0.2.min.js"></script>
    <script src="${rc.contextPath}/js/jquery.form.js"></script>
    <script src="${rc.contextPath}/js/preCaution.js"></script>
    <!-- 引入YDUI自适应解决方案类库 -->
    <script src="${rc.contextPath}/ydui_js/ydui.flexible.js"></script>
    <script src="${rc.contextPath}/js/address.js"></script>
    <!-- 引入YDUI脚本 -->
    <script src="${rc.contextPath}/js/vue.min.js"></script>
    <script src="${rc.contextPath}/ydui_js/template.js"></script>
    <script src="${rc.contextPath}/ydui_js/ydui.js"></script>
    <script src="${rc.contextPath}/ydui_js/ydui-list.js"></script>
</head>
<body>
<section class="g-flexview">
    <header class="m-navbar">
        <a href="javascript:history.back(-1);" class="navbar-item" id="navbarBack"><i class="back-ico"></i></a>
        <div class="navbar-center"><span class="navbar-title" id="unitTitle"></span></div>
        <a href="${rc.contextPath}/personPrecaution/PPIssueEdit" class="navbar-item" id="issueAdd" style="color:yellowgreen"><b>新增</b></a>
    </header>

    <section class="g-scrollview" id="issueSection">
        <h1 class="demo-pagetitle">纠纷隐患记录</h1>
        <h2 class="demo-detail-title"></h2>
        <div id="issueList" class="m-list list-theme1"></div>
        <!--
        <div class="m-cell"  id="Issue">
            <a href="javascript:void(0);" class="cell-item"  v-for="issue in issueList" v-on:click="gotoAnIssue(issue)">
                <div class="cell-left">{{issue.s_Map.issueName_s}}</div>
                <div class="cell-right cell-arrow"></div>
            </a>
        </div>
        -->
   	</section>

    <script id="issueTemplate" type="text/html">
        <div class="m-cell"  >
            {{each list as data}}
            <a href="${rc.contextPath}/personPrecaution/PPIssueView?id={{data.id}}" class="cell-item J_Link"<#-- j_link比较重要需要加--> data-page="{{page}}">
                <div class="cell-left">
                    {{data.s_Map.issueName_s}}
                    <input type="hidden" id="issueId"  v-bind:value="data.id" >
                </div>
                <div class="cell-right cell-arrow" style="color:dodgerblue">{{data.s_Map.issueType_s}}</div>
            </a>
            {{/each}}
        </div>
    </script>

</section>
<!--底部DIV -->
 <#include "/menu/foot.ftl" />
<!--底部DIV -->
<script>
    !function ($) {
    }(jQuery);

    var dialog = YDUI.dialog;
    $(function(){
        var unitId = getQueryString("unit");

        // 副标题
        var myUnit = getUnitById(unitId);
        if(myUnit != null) {
            //$("#unitId").val(unitId);
            var role = getQueryString("role");
            if(role == null) {
                role = "";
            }
            var roleParam = "&role=" + role;
            $("#unitTitle").text(myUnit.s_Map.unitName_s);
            $("#issueAdd").attr("href", "/personPrecaution/PPIssueEdit?unit="+unitId);
            $("#navbarBack").attr("href", "${rc.contextPath}/placebase?unit="+unitId+roleParam);
        }

        var listRequestJson = {
            "pageSize":10,"start":0,"page":1,
            "templeteDivId":"issueTemplate",//vue script template id
            "sectionId":'issueSection',//vue 最外层显示数据的section id
            "listContent_id":"issueList"//vue 二层内容id
        };

        var loadMore = function (callback) {
            $.ajax({
                url: 'http://'+changeAddr()+'/common/getModelList',
                type: 'GET',
                data: {
                    "filter[className]": "issue",
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