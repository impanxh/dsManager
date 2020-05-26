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
    <link rel="stylesheet" href="${rc.contextPath}/css/demo.css" />
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
                    <div class="cell-left"><i class="cell-icon icon-star"></i>名称：</div>
                    <div class="cell-right "><input type="text" name="issueName_s" id="issueName_s" class="cell-input" placeholder="" autocomplete="off" /></div>
                </div>
                <div class="cell-item">
                   <div class="cell-left"><i class="cell-icon icon-type"></i>类型：</div>
                   <label class="cell-right ">
                    <select class="cell-select" name="issueType_s" id="issueType_s">
                        <option value="">请选择类型</option>
                        <option value="纠纷">纠纷</option>
                        <option value="隐患">隐患</option>
                    </select>
                </label>
            </div>
            <div class="cell-item">
            	<div class="cell-left"><i class="cell-icon icon-type"></i>状态：</div>
                <label class="cell-right ">
                <select class="cell-select" name="issueStatus_s" id="issueStatus_s">
                        <option value="">请选择状态</option>
                        <option value="未解决">未解决</option>
                        <option value="已解决">已解决</option>
                    </select>
                    
                </label>
            </div>
            
            <div class="cell-item">
            	<div class="cell-left"><i class="cell-icon icon-time"></i>发生时间：</div>
                <div class="cell-right "><input type="date" name="issueHappenTime_dt" id="issueHappenTime_dt" class="cell-input" value="" placeholder="" autocomplete="off" /></div>
            </div>
            <div class="cell-item">
                <div class="cell-left"><i class="cell-icon icon-compose"></i>内容：</div>
                <div class="cell-right "><textarea class="cell-textarea" placeholder="" name="issueContent_s" id="issueContent_s" ></textarea></div>
            </div>

            <div class="cell-item">
            	<div class="cell-left">上传照片：</div>
                <div class="cell-right ">
                    <form id="mediaFileForm" method="post" enctype="multipart/form-data">
                        <input type="file" name="uploadFile_s" id="uploadFile_s" class="btn btn-warning" onchange="uploadMediaFile()" />
                    </form>
                    <input type="hidden" name="mediaFile_s" id="mediaFile_s" /></div>
            </div>

            <div class="cell-item">
            	<div class="cell-left"><i class="cell-icon icon-video"></i>上传视频：</div>
                <div class="cell-right">
                    <textarea class="cell-textarea" placeholder="" name="uploadVideo_s" id="uploadVideo_s" ></textarea>
                </div>
            </div>
            <div class="cell-item">
                <div class="cell-left"><i class="cell-icon icon-ucenter-outline"></i>上报人：</div>
                <div class="cell-right "><input type="text" name="reporter_s" id="reporter_s" class="cell-input" placeholder="" autocomplete="off" /></div>
            </div>
            <div class="cell-item">
            	<div class="cell-left"><i class="cell-icon icon-time"></i>上报时间：</div>
                <div class="cell-right "><input type="date" name="issueReportTime_dt" id="issueReportTime_dt" class="cell-input" placeholder="" autocomplete="off" /></div>
            </div>
            
        </div>
    </div>

    <footer class="m-tabbar tabbar-fixed">
        <div class="m-button" style="width: 100%;">
            <button type="button" id="submitBtn" class="btn-block btn-primary">保存信息</button>
        </div>
    </footer>
</section>
</section>
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
            dialog.confirm('确认保存', '是否确定保存新的纠纷隐患信息？', [
            {
                txt: '取消',
                color: false,
                callback: function () {
                    dialog.toast('取消保存', 'none', 500);
                }
            },
            {
                txt: '确定',
                color: true,
                callback: function () {
                    dialog.toast('保存信息', 'none', 1000);
                    submit();
                }
            }
            ]);
        })
    }(jQuery);

    // 上传图片或者视频文件
    function uploadMediaFile() {
        var fileName = $("#uploadFile_s").val();
        if (fileName == '') {
            YDUI.dialog.alert("请选择文件");
            return false;
        }

        var imgs = fileName.split(".");
        var suffix = imgs[imgs.length - 1].toLocaleLowerCase();
        var validFileTypes = [ "jpg", "jpeg", "gif", "png"];
        if ($.inArray(suffix, validFileTypes) == -1) {
            YDUI.dialog.alert("请上传['jpg','gif','png','jpeg']格式的文件!");
            return false;
        }
        var options = {
            url : "/upload/saveSimpleFile",
            type : "POST",
            dataType : "json",
            success : function(data) {
                $("#mediaFile_s").val(data.path);
            }
        };
        $("#mediaFileForm").ajaxSubmit(options);
    }

    // 提交表单信息
    function submit() {
        var params = {
            "unitId_s": $("#unitId_s").val(),
            "issueName_s": $("#issueName_s").val(),
            "issueType_s": $("#issueType_s").val(),
            "issueStatus_s": $("#issueStatus_s").val(),
            "issueHappenTime_dt": $("#issueHappenTime_dt").val(),
            "issueContent_s": $("#issueContent_s").val(),
            "reporter_s": $("#reporter_s").val(),
            "issueReportTime_dt": $("#issueReportTime_dt").val(),
            "mediaFile_s": $("#mediaFile_s").val(),
        }

        var settings = {
            "async": false,
            "crossDomain": true,
            "url": "http://" + changeAddr() + "/common/saveModel?className=issue&checkUniq=N&UID=<@security.authentication property="principal.username" />",
            "method": "POST",
            "data": params
        }
        $.ajax(settings).done(function(response) {
            window.location.href = "${rc.contextPath}/trouble/view?id=" + $("#unitId").val();

        });
    }
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

                    $("#issueName_s").val(data.s_Map.issueName_s);
                    $("#reporter_s").val(data.s_Map.reporter_s);
                    $("#issueContent_s").val(data.s_Map.issueContent_s);
                    $("#issueType_s").val(data.s_Map.issueType_s);
                    $("#issueStatus_s").val(data.s_Map.issueStatus_s);
                    $("#issueHappenTime_dt").val(data.dt_Map.issueHappenTime_dt);

                    $("#issueHappenTime_dt").val($.format.date(data.dt_Map.issueHappenTime_dt, "yyyy-MM-dd"));
                    $("#issueReportTime_dt").val($.format.date(data.dt_Map.issueReportTime_dt, "yyyy-MM-dd"));
                    
                    $("#mediaFile_s").attr("data-url", "/upload_temp/" + data.s_Map.mediaFile_s);     
                    
                    


                }
            }
        });
    }

    $(document).ready(function() {
        var unitId = getQueryString("id");

        if(unitId != null)
        {
            getIssue(unitId);
        }
        else
        {
            var d = new Date();
            d = $.format.date(d, "yyyy-MM-dd");
            console.log(d);
            $('#issueReportTime_dt').val(d);
        }

        $("#unitId").val(unitId);
        
    })
</script>
</body>
</html>