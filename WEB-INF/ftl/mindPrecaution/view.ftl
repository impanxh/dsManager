<#assign security=JspTaglibs["/WEB-INF/tlds/security.tld"] />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <title></title>
    <meta content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0" name="viewport" />
    <meta content="yes" name="apple-mobile-web-app-capable" />
    <meta content="black" name="apple-mobile-web-app-status-bar-style" />
    <meta content="telephone=no" name="format-detection" />
    <!-- 引入YDUI样式 -->
    <link rel="stylesheet" href="${rc.contextPath}/ydui_css/ydui.css" />
    <!-- 引入YDUI自适应解决方案类库 -->
    <script src="${rc.contextPath}/ydui_js/ydui.flexible.js"></script>
</head>
<body>
    <section class="g-flexview">
        <header class="m-navbar">
            <a href="../index.html" class="navbar-item"><i class="back-ico"></i></a>
            <div class="navbar-center"><span class="navbar-title">纠纷隐患信息录入</span></div>
        </header>

        <section class="g-scrollview">

            <input type="hidden" name="unitId_s" id="unitId_s" /> 

            <input type="hidden" name="subDate_dt" id="subDate_dt" />
            <div class="m-cell">
                <div class="cell-item">
                    <div class="cell-left">名称：</div>
                    <label class="cell-right " id="issueName_s"></label>                 
                </div>
                <div class="cell-item">
                   <div class="cell-left">类型：</div>
                   
                    <label class="cell-right " id="issueType_s"></label>
                </label>
            </div>
            <div class="cell-item">
            	<div class="cell-left">状态：</div>
                <label class="cell-right " id="issueStatus_s"></label>
            </div>
            
            <div class="cell-item">
            	<div class="cell-left">发生时间：</div>
                <label class="cell-right " id="issueHappenTime_dt"></label>
            </div>
            <div class="cell-item">
                <div class="cell-left">内容：</div>
                <label class="cell-right " id="issueContent_s"></label>
            </div>

            <div class="cell-item">
            	<div class="cell-left">照片：</div>
                <img class="lazy" id="mediaFile_s" data-url="" style="max-width:100%;"/>
            </div>

            <div class="cell-item">
            	<div class="cell-left">视频：</div>
                <div class="cell-right">
                    <textarea class="cell-textarea" placeholder="" name="uploadVideo_s" id="uploadVideo_s" ></textarea>
                </div>
            </div>
            <div class="cell-item">
                <div class="cell-left">上报人：</div>
                <label class="cell-right " id="reporter_s"></label>
            </div>
            <div class="cell-item">
            	<div class="cell-left">上报时间：</div>
                <label class="cell-right " id="issueReportTime_dt"></label>
               
            </div>
            
        </div>
    </div>

    <footer class="m-tabbar tabbar-fixed">
        <div class="m-button" style="width: 100%;">
            <button type="button" id="submitBtn" class="btn-block btn-primary">编辑信息</button>
        </div>
    </footer>
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
<script src="${rc.contextPath}/js/preCaution.js"></script>
<script src="${rc.contextPath}/js/address.js"></script>
<script>

    !function ($) {
        var dialog = YDUI.dialog;
        $("#submitBtn").on("click", function() {
            window.location.href = "${rc.contextPath}/trouble/edit?id="+unitId;
        })
    }(jQuery);

    function getIssue(unitId) {
        $.ajax({
            "url" : "http://" + changeAddr() + "/common/queryById?className=issue&id=" + unitId,
            type : 'GET',
            async : false,
            data : { },
            dataType : 'json',
            success : function(data) {
                if (data.totalElements != 0) {// 或判断context是否为空
                                                 
                    console.log(data.s_Map.issueName_s);  

                    $("#issueHappenTime_dt").text($.format.date(data.dt_Map.issueHappenTime_dt, "yyyy-MM-dd HH:mm:ss"));
                    $("#issueReportTime_dt").text($.format.date(data.dt_Map.issueReportTime_dt, "yyyy-MM-dd HH:mm:ss"));
                    
                    $("#mediaFile_s").attr("data-url", "/upload_temp/" + data.s_Map.mediaFile_s);     
                    
                    $("#issueName_s").text(data.s_Map.issueName_s);
                    $("#reporter_s").text(data.s_Map.reporter_s);
                    $("#issueContent_s").text(data.s_Map.issueContent_s);
                    $("#issueType_s").text(data.s_Map.issueType_s);
                    $("#issueStatus_s").text(data.s_Map.issueStatus_s);
                    $("#issueHappenTime_dt").text(data.dt_Map.issueHappenTime_dt);


                }
            }
        });
    }
    var unitId;
    $(document).ready(function() {
        var id = getQueryString("id");  

        unitId = id;      

        $("#unitId").val(id);
        
        getIssue(id);

        $("img.lazy").lazyLoad();
    })
</script>
</body>
</html>