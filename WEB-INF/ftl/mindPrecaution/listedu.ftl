<#assign security=JspTaglibs["/WEB-INF/tlds/security.tld"] />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <title>教育记录管理</title>
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
        <a href="javascript:void(0);" onclick="GotoBase()" class="navbar-item"><i class="back-ico"></i></a>
        <div class="navbar-center"><span class="navbar-title" id="unitTitle">教育培训记录</span></div>
        <a href="javascript:void(0);" onclick="AddEdu()" class="navbar-item">添加记录</a>
    </header>

    <section class="g-scrollview" id="issueSection">
        <h1 class="demo-pagetitle" id="">教育培训记录</h1>

        <div id="issueList" class="m-list list-theme1"></div>                 
   	</section>

    <script id="issueTemplate" type="text/html">
        <div class="m-cell"  >
            {{each list as data}}
            <a href="${rc.contextPath}/mindPrecaution/editedu?id={{data.id}}" class="cell-item J_Link"<#-- j_link比较重要需要加--> data-page="{{page}}">
                <div class="cell-left">
                    {{data.s_Map.issueName_s}}
                    <input type="hidden" id="issueId"  v-bind:value="data.id" >
                </div>
                <div class="cell-right cell-arrow"></div>
            </a>
            {{/each}}
        </div>
    </script>
</section>
<!--底部DIV -->
 <#include "/menu/foot.ftl" /> 
<!--底部DIV -->
<script src="${rc.contextPath}/js/jquery-2.0.2.min.js"></script>
<script src="${rc.contextPath}/js/jquery.form.js"></script>
<script src="${rc.contextPath}/js/jquery-dateFormat.js"></script>
<script src="${rc.contextPath}/js/preCaution.js"></script>
<!-- 引入city包 -->
<script src="${rc.contextPath}/ydui_js/ydui.citys.js"></script>
<script src="${rc.contextPath}/ydui_js/ydui.js"></script>
<script src="${rc.contextPath}/js/vue.min.js"></script>
<script src="${rc.contextPath}/js/address.js"></script>
<script>
    var dialog = YDUI.dialog;

    var unitId;

    $(function(){
        unitId = getQueryString("unit");

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
                    "filter[className]": "FireEdu",
                    "filter[unitId_s_s_EQ]" : unitId,
                    start: listRequestJson.start,
                    length: listRequestJson.pageSize
                },
                success: function (ret) {
                    typeof callback == 'function' && callback(ret);
                }
            });
        };
        loadScrollTable(listRequestJson,loadMore);

        var myUnit = getUnitById(unitId);
        if(myUnit != null) {                        
            $("#unitTitle").text(myUnit.s_Map.unitName_s);
        }
    });

    !function ($) {
        
    }(jQuery);

    function AddEdu() {            
        window.location.href = "${rc.contextPath}/mindPrecaution/editedu?unit=" + unitId;
    } 
    function GotoBase() {            
        window.location.href = "${rc.contextPath}/placebase?unit=" + unitId;
    } 
</script>
</body>
</html>