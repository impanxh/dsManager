<#assign security=JspTaglibs["/WEB-INF/tlds/security.tld"] />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <title>场所管理</title>
    <meta content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0" name="viewport" />
    <meta content="yes" name="apple-mobile-web-app-capable" />
    <meta content="black" name="apple-mobile-web-app-status-bar-style" />
    <meta content="telephone=no" name="format-detection" />
    <!-- 引入YDUI样式 -->
    <link rel="stylesheet" href="${rc.contextPath}/ydui_css/ydui.css" />
    <link rel="stylesheet" href="${rc.contextPath}/css/demo.css" />
    <script src="${rc.contextPath}/ydui_js/ydui.flexible.js"></script>
    <script src="${rc.contextPath}/js/jquery-2.0.2.min.js"></script>
    <script src="${rc.contextPath}/js/jquery.form.js"></script>
    <script src="${rc.contextPath}/js/preCaution.js"></script>
    <script src="${rc.contextPath}/js/address.js"></script>
    <script src="${rc.contextPath}/js/common.js"></script>
    <script type="text/javascript" language="javascript"
            src="${rc.contextPath}/js/vue.min.js"></script>
    <script src="${rc.contextPath}/ydui_js/template.js"></script>
<!--底部DIV -->
<!-- 引入city包 -->
</head>
<body>
<section class="g-flexview">
    <header class="m-navbar">
        <a href="javascript:history.back(-1);" class="navbar-item" id="navbarBack"><i class="back-ico"></i></a>
        <div class="navbar-center"><span class="navbar-title" id="unitTitle"></span></div>
    </header>
    <section class="g-scrollview" >
        <div class="list-item" style="margin-bottom: 0.2rem;margin-top: 0.2rem;">
            <div class="list-img">
                <a href="javascript:void(0);">
                    <img src="${rc.contextPath}/images/slider-sample-default.png">
                </a>
            </div>
        </div>

        <div class="m-cell" id="unitProps">
            <a v-bind:href="baseInfoUrl" class="cell-item J_Link" >
                <div class="cell-left"><i class="icon-home-outline" style="font-size: 26px;color:#FF685D;padding-right: 5px;"></i>基本信息</div>
                <div class="cell-right cell-arrow"></div>
            </a>
            <template v-if="userCode == 0">
            <a v-bind:href="secRespUrl" class="cell-item J_Link" >
                <div class="cell-left"><i class="icon-star-outline" style="font-size: 26px;color:#FF685D;padding-right: 5px;"></i>安全责任</div>
                <div class="cell-right cell-arrow"></div>
            </a>
            <a v-bind:href="issueUrl" class="cell-item J_Link" >
                <div class="cell-left"><i class="icon-warn-outline" style="font-size: 26px;color:#FF685D;padding-right: 5px;"></i>隐患纠纷</div>
                <div class="cell-right cell-arrow"></div>
            </a>
             <a v-bind:href="inspectionUrl" class="cell-item J_Link" >
                <div class="cell-left"><i class="icon-compose" style="font-size: 26px;color:#FF685D;padding-right: 5px;"></i>
                    月度检查
                </div>
                <div class="cell-right cell-arrow"></div>
            </a>
            <a v-bind:href="inspRecordUrl" class="cell-item J_Link" >
                <div class="cell-left"><i class="icon-type" style="font-size: 26px;color:#FF685D;padding-right: 5px;"></i>
                    检查记录
                </div>
                <div class="cell-right cell-arrow"></div>
            </a>

                <!--
                <a href="javascript:void(0);" class="cell-item J_Link" >
                    <div class="cell-left"><i class="icon-discount" style="font-size: 26px;color:#FF685D;padding-right: 5px;"></i>
                        其他
                    </div>
                    <div class="cell-right cell-arrow"></div>
                </a>
                -->
            <a v-bind:href="personUserUrl" class="cell-item J_Link"  v-if="isAdminTag">
                <div class="cell-left"><i class="icon-ucenter-outline" style="font-size: 26px;color:#FF685D;padding-right: 5px;"></i>企业用户管理</div>
                <div class="cell-right cell-arrow"></div>
            </a>



            </template>
            <template v-else-if="userCode == 1">
            <a v-bind:href="inspectionUrl" class="cell-item J_Link" >
                <div class="cell-left"><i class="icon-compose" style="font-size: 26px;color:#FF685D;padding-right: 5px;"></i>
                    开始检查
                </div>
                <div class="cell-right cell-arrow"></div>
            </a>
            <a v-bind:href="inspRecordUrl" class="cell-item J_Link" >
                <div class="cell-left"><i class="icon-type" style="font-size: 26px;color:#FF685D;padding-right: 5px;"></i>
                    检查记录
                </div>
                <div class="cell-right cell-arrow"></div>
            </a>
             <a v-bind:href="personUserUrl" class="cell-item J_Link"  v-if="isPlace" >
                <div class="cell-left"><i class="icon-ucenter-outline" style="font-size: 26px;color:#FF685D;padding-right: 5px;"></i>企业用户管理</div>
                <div class="cell-right cell-arrow"></div>
            </a>
                <a v-bind:href="unitBelongUrl" class="cell-item J_Link"  v-if="isPoliceAdmin">
                <div class="cell-left"><i class="icon-ucenter-outline" style="font-size: 26px;color:#FF685D;padding-right: 5px;"></i>归属辖区调整</div>
                <div class="cell-right cell-arrow"></div>
            </a>

                <div class="m-button" style="width: 100%;" v-if="isPlace">
                    <a type="button" id="unregisterBtn" class="btn-block btn-danger" v-on:click="unregi()">注销企业</a>
                </div>

            </template>
             <template v-else-if="userCode == 2">
            <a v-bind:href="inspectionUrl" class="cell-item J_Link" >
                <div class="cell-left"><i class="icon-compose" style="font-size: 26px;color:#FF685D;padding-right: 5px;"></i>
                    开始检查
                </div>
                <div class="cell-right cell-arrow"></div>
            </a>
             <a v-bind:href="inspRecordUrl" class="cell-item J_Link" >
                <div class="cell-left"><i class="icon-type" style="font-size: 26px;color:#FF685D;padding-right: 5px;"></i>
                    检查记录
                </div>
                <div class="cell-right cell-arrow"></div>
            </a>



            </template>

        </div>

    </section>
</section>
<!--底部DIV -->
 <#include "/menu/foot.ftl" />

<script src="${rc.contextPath}/ydui_js/ydui.js"></script>
<script>

//    !function ($) {
//        var dialog = YDUI.dialog;
//        $("#unregisterBtn").on("click", function() {
//            console.log(unitId);
//            dialog.confirm('确认注销', '是否确定注销这个单位？', [
//                {
//                    txt: '取消',
//                    color: false,
//                    callback: function () {
//                        dialog.toast('取消注销', 'none', 500);
//                    }
//                },
//                {
//                    txt: '确定',
//                    color: true,
//                    callback: function () {
//                        dialog.toast('注销成功', 'none', 1000);
//                        window.location.href = "${rc.contextPath}/placeManage";
//                    }
//                }
//            ]);
//        })
//    } (jQuery);

    function GotoBase(itemName) {
            window.location.href = "${rc.contextPath}/placeManage";
        }



    function getUnit(unitId) {
        $.ajax({
            "url" : "http://" + changeAddr() + "/common/queryById?className=Unit&id=" + unitId,
            type : 'GET',
            async : false,
            data : { },
            dataType : 'json',
            success : function(data) {
                if (data != "") {
                    $("#unitTitle").text(data.s_Map.unitName_s);
                    $("#navbarBack").attr("href", "${rc.contextPath}/placeManage?unit="+ data.s_Map.hyType_s);
                }
            }
        });
    }
    !function ($) {
    }(jQuery);
    $(function(){
        var userEnum = 0;
        var isAdminTag = false ;
        var isPlace = false ;//增加民警
        var isPoliceAdmin = false ;//判断是否是所长 第3个不是*的 特指一个局的所长
        var userType = queryUserGroup('<@security.authentication property="principal.username" />');
        if(isNotNull(userType[1])) {
            isPoliceAdmin = userType[1] == "*00" && userType[2] != "*";
             isPlace = userType[3] != "*";
            if(userType[1] == "*" || userType[1] == "*00") {
                userEnum = 1;
            } else {
                userEnum = 2;
            }
        }

        if(isNotNull(userType.utag) && userType.utag == 'on'){
        	isAdminTag = true;
        }
//        if(isNotNull(s) && s[1] == '*'){
//        }

        var forceRole = getQueryString("role");
        var roleParam = "";
        if(forceRole == "self") {
            userEnum = 0;
            roleParam = "&role=self"
        }
        var unitId = getQueryString("unit");
        if(unitId == null || unitId == "") {
            YDUI.dialog.alert("参数错误");
            window.location.href = "${rc.contextPath}/hyList";
        }
        getUnit(unitId);

        var placeVue = new Vue({
            el: '#unitProps',
            data: {
                userCode: userEnum,
                isAdminTag: isAdminTag,isPoliceAdmin:isPoliceAdmin,isPlace:isPlace,
                baseInfoUrl: "unitDetail?edit=1&placeId=" + unitId,
                secRespUrl: "/responsibility/SecurityResp?unit=" + unitId + roleParam,
                issueUrl: "/personPrecaution/PPIssueList?unit=" + unitId + roleParam,
                inspectionUrl: "/inspection/Inspect?unit=" + unitId + roleParam,
                inspRecordUrl: "/inspection/InspGrid?unit=" + unitId + roleParam,
                personUserUrl: "/placeUser?unit=" + unitId,
                unitBelongUrl: "/unitBelong?edit=1&placeId=" + unitId,
            },
            mounted: function(){
                this.$nextTick(function() {
                    this.showData();
                })
            },
            methods: {
                showData:function() {
                },
                unregi:function() {
                    var dialog = YDUI.dialog;
                    dialog.confirm('确认注销', '是否确定注销这个单位？', [
                        {
                            txt: '取消',
                            color: false,
                            callback: function () {
                                dialog.toast('取消注销', 'none', 500);
                            }
                        },
                        {
                            txt: '确定',
                            color: true,
                            callback: function () {
                                var params = {
                                    "selectByField": "id",
                                    "id": unitId,
                                    "unregistered_i": 1,
                                };
                                var settings = {
                                    "async": false,
                                    "crossDomain": true,
                                    "url": "http://" + changeAddr() + "/common/saveModel?className=Unit&checkUniq=Y&UID=<@security.authentication property="principal.username" />",
                                    "method": "POST",
                                    "data": params
                                };
                                $.ajax(settings).done(function(response) {
                                    dialog.toast('注销成功', 'none', 1000);
                                    window.location.href = "${rc.contextPath}/hyList";
                                })
                            }
                        }
                    ]);
                },
            },
        })
    })
</script>
</body>
</html>