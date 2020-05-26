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
    <script src="${rc.contextPath}/js/common.js"></script>
</head>
<body>
    <section class="g-flexview">
        <header class="m-navbar">
            <a href="javascript:history.back(-1);" class="navbar-item"><i class="back-ico"></i></a>
            <div class="navbar-center"><span class="navbar-title" id="unitTitle"></span></div>
        </header>

        <section class="g-scrollview">
            <h1 class="demo-pagetitle">开始新的检查</h1>
            <h2 class="demo-detail-title"></h2>
            <input type="hidden" id="unitId" />
            <input type="hidden" id="unitName" />
            <input type="hidden" id="inspType" />
            <div class="m-cell">
                <div class="cell-item">
                    <div class="cell-left"><i class="cell-icon icon-type"></i>单位：</div>
                    <label class="cell-right">
                        <select class="cell-select" id="unitSelect">
                            <template v-if="unitName != ''">
                                <option v-bind:value="unitId">{{unitName}}</option>
                            </template>

                            <template v-else="">
                                <option value="">请选择单位</option>
                                <template v-for="unit in unitList">
                                    <option v-bind:value="unit.id" :hysort_s="unit.s_Map.hySort_s" :hytype_s="unit.s_Map.hyType_s">{{unit.s_Map.unitName_s}}</option>
                                </template>
                            </template>
                        </select>
                    </label>
                </div>
            </div>

        </section>
        <footer class="m-tabbar">
            <div class="m-button" style="width: 100%;">
                <button type="button" id="submitBtn" class="btn-block btn-primary">开始检查</button>
            </div>
        </footer>
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
        var dialog = YDUI.dialog;
        $("#submitBtn").on("click", function() {
            dialog.confirm('确认开始新的检查', '是否确定开始做一次新的检查？', [
            {
                txt: '取消',
                color: false,
                callback: function () {
                    dialog.toast('取消', 'none', 500);
                }
            },
            {
                txt: '确定',
                color: true,
                callback: function () {
                    dialog.toast('确定', 'none', 1000);
                    window.location.href = "${rc.contextPath}/inspection/InspGo?unit=" + $("#unitSelect").val() + "&type=" +
                        $("#inspType").val();
                }
            }
            ]);
        })
    }(jQuery);

    $(document).ready(function() {
        var unitId = getQueryString("unit") || "";
        var inspType = getQueryString("type") || "";
        if(inspType != "") {
            $("#inspType").val(inspType);
        }
        // 副标题
        var myUnit = getUnitById(unitId)
        if (myUnit != null) {
            $("#unitId").val(unitId);
            $("#unitName").val(myUnit.s_Map.unitName_s);
            $("#unitTitle").text(myUnit.s_Map.unitName_s);
        }

        var unitVue = new Vue({
            el: '#unitSelect',
            data: {
                unitList: {},
                unitId: $("#unitId").val(),
                unitName: $("#unitName").val()
            },
            methods: {
                showData: function () {
                    var _self = this;
                    $.ajax({
                        type: 'GET',
                        url: 'http://' + changeAddr() + '/common/getModelList',
                        async: false,
                        data: {
                            "filter[className]": "Unit",
                            "length": 1024,
                            "userid":"<@security.authentication property="principal.username" />",
                            "isTaskQuery": "yes"
                        },
                        success: function (data) {
                            _self.unitList = (data.content);
                        }
                    });
                }
            }
        })
        unitVue.showData();
    })
</script>
</body>
</html>