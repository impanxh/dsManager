<#assign security=JspTaglibs["/WEB-INF/tlds/security.tld"] />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <title>纠纷隐患</title>
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
    <script src="${rc.contextPath}/ydui_js/template.js"></script>
    <script src="${rc.contextPath}/js/common.js"></script>
    <script src="${rc.contextPath}/js/preCaution.js"></script>
    <script src="${rc.contextPath}/js/address.js"></script>

</head>
<body>
    <section class="g-flexview">
        <header class="m-navbar">
            <a href="javascript:history.back(-1);" class="navbar-item"><i class="back-ico"></i></a>
            <div class="navbar-center"><span class="navbar-title" id="unitTitle"></span></div>
        </header>

        <section class="g-scrollview">
            <h1 class="demo-pagetitle">纠纷隐患</h1>
            <h2 class="demo-detail-title"></h2>
            <input type="hidden" id="issueId" />

            <div class="m-cell">
                <div class="cell-item">
                    <div class="cell-left"><i class="cell-icon icon-star"></i>名称：</div>
                    <label class="cell-right " id="issueName"></label>
                </div>
                <div class="cell-item">
                    <div class="cell-left"><i class="cell-icon icon-type"></i>类型：</div>
                    <label class="cell-right " id="issueType"></label>
                    </label>
                </div>
                <div class="cell-item">
                    <div class="cell-left"><i class="cell-icon icon-checkoff"></i>状态：</div>
                    <label class="cell-right " id="issueStatus"></label>
                </div>

                <div class="cell-item">
                    <div class="cell-left"><i class="cell-icon icon-time"></i>发生时间：</div>
                    <label class="cell-right " id="occurenceTime"></label>
                </div>

            </div>

            <div class="m-celltitle">详细内容</div>
            <div class="m-cell">
                <div class="cell-item">
                    <label class="cell-textarea" style="height: auto; min-height: 1rem" id="issueContent"></label>
                </div>
             </div>

            <div class="m-celltitle">多媒体信息</div>
            <div class="m-cell">
                <article class="m-list list-theme1" id="imageShow">
                </article>
                <script id="imageTemplate" type="text/html">
                    <a href="javascript:void(0);" class="list-item" style="width:90%">
                        <div class="list-img">
                            <img src="/upload_temp/{{imageUrl}}" />
                        </div>
                    </a>
                </script>
            </div>
            <div class="m-cell">
                <div class="cell-item">
                    <video id="videoFile" src="" controls="controls" width="320" height="240"></video>
                </div>
            </div>
            <div class="m-cell">
                <div class="cell-item">
                    <div class="cell-left"><i class="cell-icon icon-ucenter-outline"></i>上报人：</div>
                    <label class="cell-right " id="reporter"></label>
                </div>
                <div class="cell-item">
                    <div class="cell-left"><i class="cell-icon icon-time"></i>上报时间：</div>
                    <label class="cell-right " id="created"></label>
                </div>
            </div>
            <div class="m-celltitle">整改信息</div>
            <div class="m-cell">
                <div class="cell-item">
                    <div class="cell-left"><i class="cell-icon icon-ucenter"></i>责任整改人：</div>
                    <label class="cell-right " id="personLiable"></label>
                </div>
                <div class="cell-item">
                    <div class="cell-left"><i class="cell-icon icon-time"></i>限期整改时间：</div>
                    <label class="cell-right " id="deadline"></label>
                </div>
                <div class="cell-item">
                    <div class="cell-left"><i class="cell-icon icon-feedback"></i>整改办法：</div>
                    <label class="cell-textarea" style="height:auto;min-height: 1rem" id="solution"></label>
                </div>
            </div>

        <footer class="m-tabbar">
            <div class="m-button" style="width: 100%;">
                <button type="button" id="submitBtn" class="btn-block btn-primary">编辑信息</button>
            </div>
        </footer>
        </section>
</section>

<!--底部DIV -->
 <#include "/menu/foot.ftl" />
<!--底部DIV -->

    <script src="${rc.contextPath}/ydui_js/ydui.js"></script>
<script>
    !function ($) {
        var dialog = YDUI.dialog;
        $("#submitBtn").on("click", function() {
            window.location.href = "${rc.contextPath}/personPrecaution/PPIssueEdit?id=" + $("#issueId").val() ;
        })
    }(jQuery);

    function getIssue(issueId) {
        $.ajax({
            "url" : "http://" + changeAddr() + "/common/queryById?className=issue&id=" + issueId,
            type : 'GET',
            async : false,
            data : { },
            dataType : 'json',
            success : function(data) {
                if (data != "") {// 或判断context是否为空
                    $("#issueId").val(issueId);
                    $("#occurenceTime").text($.format.date(data.d_Map.occurenceTime_d, "yyyy-MM-dd HH:mm:ss"));
                    $("#deadline").text($.format.date(data.d_Map.deadline_d, "yyyy-MM-dd HH:mm:ss"));
                    $("#created").text($.format.date(data.created_dt, "yyyy-MM-dd HH:mm:ss"));
                    $("#issueName").text(data.s_Map.issueName_s);
                    $("#reporter").text(data.s_Map.reporter_s);
                    $("#personLiable").text(data.s_Map.personLiable_s);
                    $("#issueContent").text(data.s_Map.issueContent_s);
                    $("#solution").text(data.s_Map.solution_s);
                    $("#issueType").text(data.s_Map.issueType_s);
                    $("#issueStatus").text(data.s_Map.issueStatus_s);
                    if(data.s_Map.mediaFile_s != null) {
                        var arr = data.s_Map.mediaFile_s.split(',');
                        var imageHtml = '';
                        $.each(arr, function(i,val){
                            if(val != "") {
                                imageHtml += template("imageTemplate", {imageUrl:val});
                            }
                        });
                        $("#imageShow").append(imageHtml);
                    }

                    if(data.s_Map.videoFile_s != null) {
                        $("#videoFile").attr("src", "/upload_temp/" + data.s_Map.videoFile_s);
                    } else {
                        $("#videoFile").css("display", "none");
                    }

                    // 副标题
                    var myUnit = getUnitById(data.s_Map.unitId_s)
                    if(myUnit != null) {
                        //$("#unitId").val(unitId);
                        $("#unitTitle").text(myUnit.s_Map.unitName_s);
                    }
                }
            }
        });
    }

    $(document).ready(function() {
        var id = getQueryString("id");
        getIssue(id);
    })
</script>
</body>
</html>