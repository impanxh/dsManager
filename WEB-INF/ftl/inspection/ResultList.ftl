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
    <link rel="stylesheet" href="${rc.contextPath}/css/scronf5.css?v=1" />
    <!-- 引入jQuery 2.0+ -->
    <script src="${rc.contextPath}/js/jquery-2.0.2.min.js"></script>
    <script src="${rc.contextPath}/js/jquery.form.js"></script>
    <script src="${rc.contextPath}/js/jquery-dateFormat.js"></script>

    <!-- 引入YDUI自适应解决方案类库 -->
    <script src="${rc.contextPath}/ydui_js/ydui.flexible.js"></script>
    <script src="${rc.contextPath}/js/address.js"></script>
    <script src="${rc.contextPath}/js/preCaution.js"></script>
    <!-- 引入YDUI脚本 -->
    <script src="${rc.contextPath}/js/vue.min.js"></script>
    <script src="${rc.contextPath}/ydui_js/template.js"></script>
    <script src="${rc.contextPath}/js/scronf5.js"></script>
</head>
<body>
<section class="g-flexview">
    <header class="m-navbar">
        <a href="javascript:history.back(-1);" class="navbar-item" id="navbarBack"><i class="back-ico"></i></a>
        <div class="navbar-center"><span class="navbar-title" id="unitTitle"></span></div>
    </header>

    <section class="g-scrollview" id="inspSection">
        <h1 class="demo-pagetitle" id="pageTitle">检查记录</h1>
        <h2 class="demo-detail-title"></h2>
        <div id="inspList" class="m-list list-theme1"></div>
   	</section>

    <script id="inspTemplate" type="text/html">

            {{each list as data index}}
            <div class="m-cell" style="margin-bottom: 0.2rem;font-size:0.25rem">

            <div class="cell-item">
                <div class="cell-left">
                    <i class="cell-icon icon-feedback"></i>
                </div>

                {{if data.i_Map.foundIssue_i > 0}}
                <a href="${rc.contextPath}/inspection/ResultDetail?id={{data.id}}&unit={{data.s_Map.unitId_s}}&user={{data.userType}}" style="margin-top: 0.2rem;margin-bottom: 0.2rem" class="list-mes J_Link"<#-- j_link比较重要需要加--> data-page="{{page}}">
                    {{if data.i_Map.foundIssue_i > data.i_Map.solvedIssue_i}}
                    <div class="list-mes-item" style="color:red">
                        <div style="padding-top: 5px;color:orange">
                            <B>{{index+1}}、</B>检查时间：{{data.inspTime_s}}
                        </div>
                    </div>
                    <div class="list-mes-item" style="color:#999">
                        <div style="padding-top: 5px;">
                        检查人：{{data.s_Map.inspector_s}}
                        </div>
                    </div>
                    <div class="list-mes-item" style="color:red">
                    <div style="padding-top: 5px;">
                        摘要：发现{{data.i_Map.foundIssue_i}}处问题，已解决{{data.i_Map.solvedIssue_i}}处
                        </div>
                    </div>
                </a>
                <div  class="cell-right">
                <a href="${rc.contextPath}/inspection/ResultDetail?id={{data.id}}&unit={{data.s_Map.unitId_s}}&user={{data.userType}}"  class="btn btn-danger">查看</a>
                </div>
                    {{else}}
                    <div class="list-mes-item" style="color:orange">
                    <div style="padding-top: 5px;">
                        <B>{{index+1}}、</B>检查时间： {{data.inspTime_s}}
                        </div>
                    </div>
                    <div class="list-mes-item" style="color:#999">
                        <div style="padding-top: 5px;">
                            检查人：{{data.s_Map.inspector_s}}
                        </div>
                    </div>
                    <div class="list-mes-item" style="color:green">
                    <div style="padding-top: 5px;">
                        发现{{data.i_Map.foundIssue_i}}处问题，已全部解决
                        </div>
                    </div>
                </a>
                <div  class="cell-right">
                <a href="${rc.contextPath}/inspection/ResultDetail?id={{data.id}}&unit={{data.s_Map.unitId_s}}&user={{data.userType}}"  class="btn btn-primary">查看</a>
                </div>
                    {{/if}}
                {{else}}
                <a href="${rc.contextPath}/inspection/ResultDetail?id={{data.id}}&unit={{data.s_Map.unitId_s}}&user={{data.userType}}" style="margin-top: 0.2rem;margin-bottom: 0.2rem" class="list-mes J_Link"<#-- j_link比较重要需要加--> data-page="{{page}}">
                <div class="list-mes-item" style="color:red">
                        <div style="padding-top: 5px;color:orange">
                            <B>{{index+1}}、</B>检查时间：{{data.inspTime_s}}
                        </div>
                    </div>
                    <div class="list-mes-item" style="color:#999">
                        <div style="padding-top: 5px;">
                        检查人：{{data.s_Map.inspector_s}}
                        </div>
                    </div>
                <div class="list-mes-item" style="color:green">
                    <div style="padding-top: 5px;">
                    未发现问题。
                    </div>
                </div>
            </a>
            <div  class="cell-right">
                <a href="${rc.contextPath}/inspection/ResultDetail?id={{data.id}}&unit={{data.s_Map.unitId_s}}&user={{data.userType}}"  class="btn btn-primary">查看</a>
            </div>
                {{/if}}


            </div>
            </div>

            {{/each}}
        </div>
    </script>

</section>
<!--底部DIV -->
 <#include "/menu/foot.ftl" />
<!--底部DIV -->

<script src="${rc.contextPath}/ydui_js/ydui.js"></script>
<script src="${rc.contextPath}/ydui_js/ydui-list.js"></script>
<script>
    !function ($) {
    }(jQuery);

    $(function(){
        var unitId = getQueryString("unit");
        var userType = getQueryString("user") || "";
        switch(userType) {
            case "1":
                $("#pageTitle").text("公安民警检查记录");
                break;
            case "2":
                $("#pageTitle").text("主管部门检查记录");
                break;
            case "3":
                $("#pageTitle").text("主体单位检查记录");
                break;
            default:
                break;
        }

        // 副标题
        var myUnit = getUnitById(unitId);
        if(myUnit == null) {
            window.location.href = "${rc.contextPath}/hyList";
        }
        var role = getQueryString("role");
        if(role == null) {
            role = "";
        }
        var roleParam = "&role=" + role;
        $("#unitTitle").text(myUnit.s_Map.unitName_s);
        $("#navbarBack").attr("href", "${rc.contextPath}/inspection/InspGrid?unit="+unitId+roleParam);

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
                    "filter[className]": "InspRecord",
                    "filter[unitId_s_s_EQ]" : unitId,
                    "filter[userType_i_i_EQ]": userType,
                    start: listRequestJson.start,
                    length: listRequestJson.pageSize,
                    "userid":"<@security.authentication property="principal.username" />",
                    "isTaskQuery": "yes"
                },
                success: function (ret) {
                    $.each(ret.content, function(i, item) {
                        item.inspTime_s = $.format.date(item.created_dt, "yyyy-MM-dd HH:mm:ss");
                        item.userType = userType;
                    })
                    typeof callback == 'function' && callback(ret);
                }
            });
        };
        loadScrollTable(listRequestJson,loadMore);
    });


</script>
</body>
</html>