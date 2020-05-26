<#assign security=JspTaglibs["/WEB-INF/tlds/security.tld"] />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <title>查阅检查记录</title>
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

</head>
<body>
<section class="g-flexview">
    <header class="m-navbar">
        <a href="javascript:history.back(-1);" class="navbar-item" id="navbarBack"><i class="back-ico"></i></a>
        <div class="navbar-center"><span class="navbar-title" id="unitTitle"></span></div>
        <a href="${rc.contextPath}/inspection/InspStart" class="navbar-item" id="inspAdd" style="color:yellowgreen"><b>重新检查</b></a>
    </header>

    <section class="g-scrollview">
        <h1 class="demo-pagetitle">查阅检查记录</h1>
        <h2 class="demo-detail-title"></h2>
        <input type="hidden" id="inspId">
        <div class="m-list" id="Inspection">
            <div class="m-cell">
                <div class="cell-item">
                    <div class="cell-left"><i class="cell-icon icon-type"></i>检查单位：</div>
                    <div class="cell-right">
                    <label class="cell-textarea" style="height:auto;text-align:left">{{unitName}}</label>   
                    </div>                 
                </div>
                <div class="cell-item">
                    <div class="cell-left"><i class="cell-icon icon-star"></i>检查人：</div>
                    <div class="cell-right">
                    <label class="cell-textarea" style="height:auto;text-align:left" >{{inspector}}</label>
                    </div>
                </div>
                
                <div class="cell-item">
                    <div class="cell-left"><i class="cell-icon icon-checkoff"></i>检查时间：</div>
                    <div class="cell-right">
                    <label class="cell-textarea" style="height:auto;text-align:left">{{inspTime}}</label>
                    </div>
                </div>
            </div>
            <div class="m-celltitle">检查结果</div>
            <div class="m-cell">
                <div class="list-item" v-if="foundIssue != 0">
                    <template v-for="insp in inspList">
                        <div class="m-cell">
                            <div class="cell-item">
                                <div class="cell-left" style="color:red"><b>检查内容：</b></div>

                                <div class="cell-right">
                                    <label class="cell-textarea" style="color:red;height:auto;text-align:left" >{{insp.content}}</label>
                                </div>
                            </div>


                            <div class="cell-item">
                            <div class="cell-left">发现问题：</div>
                            <div class="cell-right">
                                <label class="cell-textarea" style="height:auto;text-align:left">{{insp.issue.issueName}}
                                </label>
                                
                                <label style="color:lightseagreen;width:100px;"><a v-bind:href="insp.issue.issueUrl">查看详细</a></label>
                                
                            </div>
                                
                            </div>
                            <div class="cell-item">
                                <div class="cell-left">详细描述：</div>
                                <div class="cell-right">
                                <label class="cell-textarea"  style="height:auto;min-height: 1rem;text-align:left">{{insp.issue.issueContent}}</label>
                                </div>
                            </div>
                            <div class="cell-item">
                                <div class="cell-left">类型：</div>
                                <div class="cell-right">
                                <label class="cell-textarea" style="height:auto;text-align:left">{{insp.issue.issueType}}</label>
                                </div>

                            </div>
                            <div class="cell-item">
                                <div class="cell-left">状态：</div>
                                <div class="cell-right">
                                <label class="cell-textarea" style="height:auto;text-align:left">{{insp.issue.issueStatus}}</label>
                                </div>
                            </div>

                            <div class="cell-item">
                                <div class="cell-left">发生时间：</div>
                                <div class="cell-right">
                                <label class="cell-textarea" style="height:auto;text-align:left">{{insp.issue.occurenceTime}}</label>
                                </div>
                            </div>
                        </div>
                    </template>
                </div>
                <div class="cell-item" v-else>
                    <div class="cell-left" style="color:green"><i class="cell-icon icon-good"></i>没有发现问题</div>
                    <div class="cell-right"/>
                </div>
            </div>
        </div>
   	</section>
</section>
<!--底部DIV -->
 <#include "/menu/foot.ftl" />
<!--底部DIV -->

<script src="${rc.contextPath}/js/jquery-dateFormat.js"></script>
<script src="${rc.contextPath}/js/jquery.form.js"></script>
<script src="${rc.contextPath}/js/preCaution.js"></script>
<script src="${rc.contextPath}/js/address.js"></script>
<!-- 引入city包 -->
<script src="${rc.contextPath}/ydui_js/ydui.js"></script>
<script src="${rc.contextPath}/ydui_js/ydui.citys.js"></script>
<!-- 引入YDUI脚本 -->
<script src="${rc.contextPath}/js/vue.min.js"></script>
<script>
    !function ($) {
    }(jQuery);

    function getInspectionDetails() {
        var inspDetails = {};
        $.ajax({
            type: 'GET',
            url: 'http://' + changeAddr() + '/common/getModelList',
            async: false,
            data: {
                "filter[className]": "InspectionBank",
                "length": 1024,
                "userid":"<@security.authentication property="principal.username" />",
                "isTaskQuery": "yes"
            },
            success: function (data) {
                if (data.totalElements > 0) {
                    $.each(data.content, function(i, item){
                        inspDetails[item.id + "_content"] = item.s_Map.content_s;
                        inspDetails[item.id + "_type"] = item.s_Map.type_s;
                    })
                }
            }
        });

        return inspDetails;
    }

    function getIssuesBySerialNum(serialNum) {
        var issueDict = {};
        $.ajax({
            type: 'GET',
            url: 'http://' + changeAddr() + '/common/getModelList',
            async: false,
            data: {
                "filter[className]": "issue",
                "length": 1024,
                "filter[serialNum_s_s_EQ]": serialNum
            },
            success: function (data) {
                if(data.totalElements > 0) {
                    $.each(data.content, function(i, item) {
                        if(item.s_Map.originInspId_s != null) {
                            var params = {
                                "issueId": item.id,
                                "issueUrl": "${rc.contextPath}/personPrecaution/PPIssueView?id=" + item.id,
                                "issueName": item.s_Map.issueName_s,
                                "issueContent": item.s_Map.issueContent_s,
                                "issueType": item.s_Map.issueType_s,
                                "issueStatus": item.s_Map.issueStatus_s,
                                "occurenceTime": $.format.date(item.d_Map.occurenceTime_d, "yyyy-MM-dd HH:mm:ss")

                            };
                            issueDict[item.s_Map.originInspId_s] = params
                        }
                    });
                }
            }
        });
        return issueDict;
    }

    function getInspectionById(inspId) {
        var insp = null;
        $.ajax({
            "url" : "http://" + changeAddr() + "/common/queryById?className=Inspection&id=" + inspId,
            type : 'GET',
            async : false,
            data : { },
            dataType : 'json',
            success : function(data) {
                if (data.id != null) {
                    insp = data;
                }
            }
        });
        return insp;
    }

    $(function(){
        var inspId = getQueryString("id");

        var myInsp = getInspectionById(inspId);
        if(myInsp == null) {
            YDUI.dialog.toast('参数错误：无效的检查记录编码', 'error', 2000, function () {
                window.location.href = "${rc.contextPath}/inspection/inspList";
            });
        }

        // 副标题
        //$("#unitId").val(unitId);
        $("#unitTitle").text(myInsp.s_Map.unitName_s);
        $("#inspAdd").attr("href", "/inspection/InspStart?unit="+ myInsp.s_Map.unitId_s);

        var myIssueDict = getIssuesBySerialNum(myInsp.s_Map.serialNum_s);
        var inspVue = new Vue({
            el: '#Inspection',
            data: {
                inspList: [],
                foundIssue: 0,
                inspector: myInsp.s_Map.inspector_s,
                unitName: myInsp.s_Map.unitName_s,
                inspTime: myInsp.s_Map.inspTime_s
            },
            mounted: function(){
                this.$nextTick(function() {
                    this.showData();
                })
            },
            methods: {
                showData: function () {
                    var _self = this;
                    var myInspDetails = getInspectionDetails();
                    var myInspResults = JSON.parse(myInsp.s_Map.inspRecord_s);
                    $.each(myInspResults, function(key, val){
                        if(val != 1) {
                            var param = {
                                "id": key,
                                "type": myInspDetails[key+"_type"],
                                "content": myInspDetails[key+"_content"],
                                "result": val,
                                "issue": myIssueDict[key]
                            };
                            _self.inspList.push(param);
                            _self.foundIssue += 1;
                        }
                    })
                },
            }
        })
    });

</script>
</body>
</html>