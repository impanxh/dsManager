<#assign security=JspTaglibs["/WEB-INF/tlds/security.tld"] />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <title>工作小组列表</title>
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
        <a href="javascript:history.back(-1);" class="navbar-item" id="navbarBack"><i class="back-ico"></i></a>
        <div class="navbar-center"><span class="navbar-title" id="unitTitle"></span></div>
        <a href="${rc.contextPath}/personPrecaution/PPWG" class="navbar-item" id="groupAdd" style="color:yellowgreen"><b>添加小组</b></a>
    </header>

    <section class="g-scrollview">

        <h1 class="demo-pagetitle">工作小组列表</h1>
        <h2 class="demo-detail-title"></h2>
        <div class="m-cell"  id="Group">
            <a href="javascript:void(0);" class="cell-item"  v-for="g in groupList" v-on:click="gotoAnGroup(g)">
                    <div class="cell-left">{{g.s_Map.groupName_s}}</div>
                    <div class="cell-right cell-arrow"></div>
            </a>
        </div>
   	</section>
</section>
<!--底部DIV -->
 <#include "/menu/foot.ftl" />
<!--底部DIV -->
<!-- 引入jQuery 2.0+ -->
<script src="${rc.contextPath}/js/jquery-2.0.2.min.js"></script>
<script src="${rc.contextPath}/js/jquery.form.js"></script>
<script src="${rc.contextPath}/js/jquery-dateFormat.js"></script>
<!-- 引入city包 -->
<script src="${rc.contextPath}/ydui_js/ydui.citys.js"></script>
<!-- 引入YDUI脚本 -->
<script src="${rc.contextPath}/ydui_js/ydui.js"></script>
<script src="${rc.contextPath}/js/vue.min.js"></script>
<script src="${rc.contextPath}/js/preCaution.js"></script>
<script src="${rc.contextPath}/js/address.js"></script>
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
            $("#unitTitle").text(myUnit.s_Map.unitName_s);
            $("#groupAdd").attr("href", "/personPrecaution/PPWG?unit="+unitId);
            $("#navbarBack").attr("href", "${rc.contextPath}/personPrecaution/PPIndex?unit="+unitId);
        }
        //vue.js 循环数据
        var modVue = new Vue({
            el: '#Group',
            data: {
                groupList: {}
            },
            methods: {
                showData: function () {
                    var _self = this;
                    if(unitId != null  && unitId != "") {
                        $.ajax({
                            type: 'GET',
                            url: 'http://' + changeAddr() + '/common/getModelList',
                            async: false,
                            data: {
                                "filter[className]": "PersonPrecaution",
                                "length": 1024,
                                "filter[unitId_s_s_EQ]": unitId,
                                "filter[type_s_s]": "WORKGROUP"
                            },
                            success: function (data) {
                                _self.groupList = (data.content);
                            }
                        });
                    }
                },
                gotoAnGroup:function(mygroup) {
                    window.location.href = "${rc.contextPath}/personPrecaution/PPWG?unit=" + mygroup.s_Map.unitId_s +
                            "&group=" + mygroup.id;
                }
            }
        })
        modVue.showData();
    });
</script>
</body>
</html>