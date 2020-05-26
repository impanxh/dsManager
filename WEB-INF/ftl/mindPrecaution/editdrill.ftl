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
    <script src="/js/common.js"></script>
     <script src="/ydui_js/template.js"></script>
    
</head>
<body>
    <section class="g-flexview">
        <header class="m-navbar">
            <a href="javascript:history.back(-1);" class="navbar-item"><i class="back-ico"></i></a>
            <div class="navbar-center"><span class="navbar-title">消防演练信息</span></div>
        </header>

        <section class="g-scrollview">
            <input type="hidden" name="id" id="id" />
            <input type="hidden" name="unitId_s" id="unitId_s" />           

            <input type="hidden" name="subDate_dt" id="subDate_dt" />
            <div class="m-cell">
                <div class="cell-item">
                    <div class="cell-left"><i class="cell-icon icon-star"></i>标题：</div>
                    <div class="cell-right "><input type="text" name="issueName_s" id="issueName_s" class="cell-input" placeholder="" autocomplete="off" /></div>
                </div>
            </div>
            <div class="m-celltitle">消防演练内容</div>
            <div class="m-cell">
                <div class="cell-item">
                    <div class="cell-left"><i class="cell-icon icon-compose"></i>内容：</div>
                    <div class="cell-right "><textarea class="cell-textarea" placeholder="" name="issueContent_s" id="issueContent_s" ></textarea></div>
                </div>

             </div>

            <div class="m-celltitle">多媒体信息</div>
            <div class="m-cell">

                <div class="cell-item">
                   
                   <div class="cell-right">
                   <div style="display:block;float:left;">
                   <article class="m-list list-theme1" id ="imageShow">
                   <#--
                    <a href="#" class="list-item">
                        <div class="list-img">
                            <img class="lazy" id="mediaFile" data-url="" />
                        </div>
                    </a>-->
                    </article>
                    
       	<script id="imageTemplete" type="text/html">
       				<div id =  '{{mid}}'>
      				 <a href="#" class="list-item" style="width:90%">
                        <div class="list-img">
                            <img class="lazy" id="mediaFile" src="/upload_temp/{{imageUrl}}" />
                            <a href='#' onclick='del("{{imageUrl}}","{{mid}}")'>删除图片</a>
                        </div>
                    </a>
                    </div>
   		 </script>

                    </div> 
                    </div>
                </div>
                <div class="cell-item">
                   <div class="cell-left"></div>
                   <div class="cell-right">
                    <div class="divupload">
                    <form id="mediaFileForm" method="post" enctype="multipart/form-data">                    
                        <div class="divuploadfile">添加图片</div>
                        <input type="file" name="uploadFile_s" id="uploadFile_s" class="inputstyle" onchange="uploadMediaFile()" />
                    
                    </form>
                    <input type="hidden" name="mediaFile_s" id="mediaFile_s" />
                    </div>
                    </div>
                </div>

                <div class="cell-item">
                    <video id="videoFile" src="" controls="controls"></video>
                </div>

                <div class="cell-item">
                   <div class="cell-left"></div>
                   <div class="cell-right">
                    <div class="divupload">
                        <form id="videoForm" method="post" enctype="multipart/form-data">
                            <div class="divuploadfile">上传视频</div>
                            <input type="file" name="uploadVideo_s" id="uploadVideo_s" class="inputstyle" onchange="uploadVideoFile()" />
                        </form>
                        <input type="hidden" name="videoFile_s" id="videoFile_s" />
                    </div>
                    </div>
                </div>
            </div>
        <div class="m-celltitle">发布信息</div>
        <div class="m-cell">
            <div class="cell-item">
                <div class="cell-left"><i class="cell-icon icon-ucenter-outline"></i>发布人：</div>
                <div class="cell-right "><input type="text" name="reporter_s" id="reporter_s" class="cell-input" placeholder="" autocomplete="off" /></div>
            </div>
            <div class="cell-item">
            	<div class="cell-left"><i class="cell-icon icon-time"></i>
                    发布时间：</div>
                    <div class="cell-right "><input type="date" name="issueReportTime_dt" id="issueReportTime_dt" class="cell-input" placeholder="" autocomplete="off" /></div>
                </div>

            </div>
            <footer class="m-tabbar">
            <div class="m-button" style="width: 100%;">
                <button type="button" id="submitBtn" class="btn-block btn-primary">保存信息</button>
            </div>
        </footer>
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
<script src="${rc.contextPath}/js/preCaution.js"></script>
<script src="${rc.contextPath}/js/address.js"></script>
<script>
    !function ($) {
        var dialog = YDUI.dialog;
        $("#submitBtn").on("click", function() {
            dialog.confirm('确认保存', '是否确定保存消防演练信息？', [
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
                var file_list = $("#mediaFile_s").val();
                file_list   =  file_list== '' ? data.path :  file_list + "," + data.path;
                $("#mediaFile_s").val(file_list);
                $("#imageShow").append(   template("imageTemplete", {imageUrl : data.path,mid : data.path.replace(new RegExp("/","g"),'').replace('.','') })  );
                
                
            }
        };
        $("#mediaFileForm").ajaxSubmit(options);
    }

    function uploadVideoFile() {
        var fileName = $("#uploadVideo_s").val();
        if (fileName == '') {
            YDUI.dialog.alert("请选择文件");
            return false;
        }

        var imgs = fileName.split(".");
        var suffix = imgs[imgs.length - 1].toLocaleLowerCase();
        var validFileTypes = [ "mp4", "mov", "m4a"];
        if ($.inArray(suffix, validFileTypes) == -1) {
            YDUI.dialog.alert("请上传['mp4','mov','m4a']格式的文件!");
            return false;
        }
        var options = {
            url : "/upload/saveSimpleFile",
            type : "POST",
            dataType : "json",
            success : function(data) {
                $("#videoFile_s").val(data.path);
                $("#videoFile").attr("src", "/upload_temp/" + data.s_Map.videoFile_s);
            }
        };
        $("#videoForm").ajaxSubmit(options);
    }

    
     function del(imageurl,mid) {
        var dialog = YDUI.dialog;
        dialog.confirm('确认删除', '是否确定删除图片？', [
            {
                txt: '取消',
                color: false,
                callback: function () {
                    dialog.toast('取消删除', 'none', 500);
                }
            },
            {
                txt: '确定',
                color: true,
                callback: function () {
                    dialog.toast('删除成功', 'none', 1000);
                    var file_list = $("#mediaFile_s").val();
                    file_list   =  file_list.replace(imageurl+",",'');
                    file_list   =  file_list.replace(imageurl,'');
                    $("#mediaFile_s").val(file_list);
                    $("#"+mid).html(''); 
                }
            }
            ]);     
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
             "videoFile_s": $("#videoFile_s").val(),
        }

        if(editflag == 0) 
        {
            var settings = {
                "async": false,
                "crossDomain": true,
                "url": "http://" + changeAddr() + "/common/saveModel?className=FireDrill&checkUniq=N&UID=<@security.authentication property="principal.username" />",
                "method": "POST",
                "data": params
            }
        }
        else{

            params["selectByField"] = "id";
            params["id"] = $("#id").val();

            var settings = {
                "async": false,
                "crossDomain": true,
                "url": "http://" + changeAddr() + "/common/saveModel?className=FireDrill&checkUniq=Y&UID=<@security.authentication property="principal.username" />",
                "method": "POST",
                "data": params
            }
        }
        $.ajax(settings).done(function(response) {
            window.location.href = "${rc.contextPath}/mindPrecaution/listdrill?unit="+$("#unitId_s").val();

        });
    }
    
    
    function getIssue(unitId) {
        $.ajax({
            "url" : "http://" + changeAddr() + "/common/queryById?className=FireDrill&id=" + unitId,
            type : 'GET',
            async : false,
            data : { },
            dataType : 'json',
            success : function(data) {
                if (data.totalElements != 0) {// 或判断context是否为空

                    console.log(data.s_Map.issueName_s);  

                    $("#id").val(data.id);
                    $("#unitId_s").val(data.s_Map.unitId_s);
                    $("#issueName_s").val(data.s_Map.issueName_s);
                    $("#reporter_s").val(data.s_Map.reporter_s);
                    $("#issueContent_s").val(data.s_Map.issueContent_s);
                    $("#issueType_s").val(data.s_Map.issueType_s);
                    $("#issueStatus_s").val(data.s_Map.issueStatus_s);
                    $("#issueHappenTime_dt").val(data.dt_Map.issueHappenTime_dt);

                    $("#issueHappenTime_dt").val($.format.date(data.dt_Map.issueHappenTime_dt, "yyyy-MM-dd"));
                    $("#issueReportTime_dt").val($.format.date(data.dt_Map.issueReportTime_dt, "yyyy-MM-dd"));
                    
                    $("#mediaFile").attr("data-url", "/upload_temp/" + data.s_Map.mediaFile_s); 
                    $("#mediaFile_s").val(data.s_Map.mediaFile_s);

                    $("#videoFile_s").val(data.s_Map.videoFile_s);

	                   if(isNotNull(data.s_Map.mediaFile_s)){
	                   		var arr = data.s_Map.mediaFile_s.split(',');
	                   		var imageHtml = '';
	                   		$.each(arr, function(i,val){        
						            imageHtml += template("imageTemplete", {imageUrl :val ,mid : val.replace(new RegExp("/","g"),'').replace('.','')});
						      }); 
	               			 $("#imageShow").append(imageHtml);
	                   }

                    if(data.s_Map.videoFile_s != null) {
                        $("#videoFile").attr("src", "/upload_temp/" + data.s_Map.videoFile_s);
                    }
                   
                   
                    
                    
                
                }
            }
        });
    }

    var editflag=0;
    $(document).ready(function() {
        var id = getQueryString("id"); //this is a recordid,not unit id

        var unitid = getQueryString("unit");

        console.log(id);
        console.log(unitid);

        if(id != null)
        {
            getIssue(id);
            editflag = 1;
        }
        else
        {

            editflag = 0;
            var d = new Date();
            d = $.format.date(d, "yyyy-MM-dd");
            console.log(d);
            $('#issueReportTime_dt').val(d);
            $('#unitId_s').val(unitid);
        }        

        $("img.lazy").lazyLoad();
        
    })
</script>
</body>
</html>