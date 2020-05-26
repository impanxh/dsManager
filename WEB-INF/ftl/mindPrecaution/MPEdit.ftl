<#assign security=JspTaglibs["/WEB-INF/tlds/security.tld"] />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <title>新增心防</title>
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
    <script src="${rc.contextPath}/js/exif.js"></script>
    <script src="${rc.contextPath}/js/jquery-2.0.2.min.js"></script>
    <script src="${rc.contextPath}/js/jquery.form.js"></script>
    <script src="${rc.contextPath}/js/jquery-dateFormat.js"></script>
    <!-- 引入YDUI脚本 -->
    <script src="${rc.contextPath}/ydui_js/template.js"></script>
    <script src="${rc.contextPath}/js/common.js"></script>
    <script src="${rc.contextPath}/js/preCaution.js"></script>
    <script src="${rc.contextPath}/js/address.js"></script>
    <script src="${rc.contextPath}/js/uploadword.js"></script>

</head>
<body>
<section class="g-flexview">
    <header class="m-navbar">
        <a href="javascript:history.back(-1);" class="navbar-item"><i class="back-ico"></i></a>
        <div class="navbar-center"><span class="navbar-title" id="unitTitle"></span></div>
    </header>

    <section class="g-scrollview">
        <!--
        <form data-name="withdraw" name="submitForm" id="submitForm" class="ui-form"
              method="post" action=""
              enctype="multipart/form-data">
              -->
        <h1 class="demo-pagetitle">更新心防</h1>
        <h2 class="demo-detail-title" ></h2>
        <input type="hidden" name="unitId_s" id="unitId" />
        <input type="hidden" id="mpId" />
        <div class="m-cell">
            <div class="cell-item">
                <div class="cell-left"> <i class="cell-icon icon-star"></i>名称：</div>
                <label class="cell-right " style="text-align: left;font-size:16px;margin-top: 5px;margin-bottom: 5px;" id="itemName"></label>
            </div>
        </div>
        <div class="m-celltitle">补充说明</div>
        <div class="m-cell">
            <div class="cell-item">
                <div class="cell-right">
                    <textarea  name="detailDesc" id="detailDesc" class="cell-textarea" placeholder="请追加补充说明"></textarea>
                </div>
            </div>
        </div>
        <div class="m-celltitle">图片信息</div>
        <div class="m-cell">
            <div class="cell-item">
                <div class="cell-right ">

                        <article style="width:100%;margin-bottom:20px;" class="m-list list-theme1" id ="imageShow">
                        </article>
                        <script id="imageTemplate" type="text/html">
                            <div id="{{mid}}">
                                <div class="list-img">
                                        <img onclick="removeClassN(this)" class="list-img-img" src="/upload_temp/{{imageUrl}}" style="margin: 0 auto;" />
                                        <button onclick='del("{{imageUrl}}","{{mid}}")' type="button">删除图片</button>
                                </div>
                            </div>
                        </script>

                         <script id="wordTemplate" type="text/html">
                            <div id="{{mid}}">
                                    <div class="list-img">
                                        <span onclick="down('{{imageUrl}}','{{filename}}')"> {{filename}}  </span>
                                        <button class="list-img-button" onclick='del("{{imageUrl}}","{{mid}}","word")' type="button">删除文档</button>
                                    </div>
                            </div>
                        </script>

                </div>
            </div>

            <div class="cell-item">
                <div class="cell-left"></div>
                <div class="cell-right">

                   <div class="divupload">
                        <form id="wordForm" method="post" enctype="multipart/form-data">
                            <div class="divuploadfile" >添加word文档</div>
                            <input type="file" name="uploadWordFile_s" id="uploadWordFile_s" class="inputstyle" onchange="uploadWordFile()" />
                        </form>
                        <input type="hidden" name="mediaFile_s" id="mediaFile" />
                    </div>


                    <div class="divupload" style="margin-left: 5px;">
                        <form id="mediaFileForm" method="post" enctype="multipart/form-data">
                            <div class="divuploadfile">添加图片</div>
                            <input type="file" name="uploadFile_s" id="uploadFile_s" class="inputstyle" onchange="uploadMediaFile()" />
                        </form>
                        <input type="hidden" name="mediaFile_s" id="mediaFile" />
                    </div>
                </div>
            </div>
        </div>

        <!--
        <div class="cell-item">
            <div class="cell-left">录入时间：</div>
            <div class="cell-right "><input type="datetime-local" id="entryTime" class="cell-input" value="2017-09-21T08:08" placeholder="" autocomplete="off" /></div>
        </div>
        -->

            <div class="m-button" style="width: 100%;">
                <button type="button" id="submitBtn" class="btn-block btn-primary">保存信息</button>
            </div>
    <!--    </form> -->
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
            dialog.confirm('确认保存', '是否确定保存新的心防信息', [
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
                        dialog.toast('保存心防信息', 'none', 1000);
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
                var file_list = $("#mediaFile").val();
                file_list =  file_list== '' ? data.path :  file_list + "," + data.path;
                $("#mediaFile").val(file_list);
                $("#imageShow").append(template("imageTemplate",
                        {imageUrl:data.path, mid:data.path.replace(new RegExp("/","g"),'').replace('.','')}));
                YDUI.dialog.loading.close();
            }
        };
        YDUI.dialog.loading.open('图片上传中');
        setTimeout(function () {
            $("#mediaFileForm").ajaxSubmit(options);
        }, 1000);
    }

    function del(imageurl, mid) {
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
                    var file_list = $("#mediaFile").val();
                    file_list   =  file_list.replace(imageurl+",",'');
                    file_list   =  file_list.replace(imageurl,'');
                    $("#mediaFile").val(file_list);
                    $("#"+mid).html('');
                }
            }
        ]);
    }

    // 提交表单信息
    function submit() {
        var params = {
            "selectByField": "id",
            "id": $("#mpId").val(),
            "unitId_s": $("#unitId").val(),
            "itemName_s": $("#itemName").text(),
            "mediaFile_s": $("#mediaFile").val(),   "wordInfo_s": JSON.stringify(WORDJSON_MAP),
            "detailDesc_s": $("#detailDesc").val(),
        }

        var settings = {
            "async": false,
            "crossDomain": true,
            "url": "http://" + changeAddr() + "/common/saveModel?className=MindPrecaution&checkUniq=Y&UID=<@security.authentication property="principal.username" />",
            "method": "POST",
            "data": params
        }
        $.ajax(settings).done(function(response) {
            window.location.href = "${rc.contextPath}/mindPrecaution/MPList?unit=" + $("#unitId").val();

       });
    }

    $(document).ready(function() {
        var unitId = getQueryString("unit");
        // 副标题
        var myUnit = getUnitById(unitId);
        if(myUnit != null) {
            $("#unitId").val(unitId);
            $("#unitTitle").text(myUnit.s_Map.unitName_s);
        }

//        var itemName = getQueryString("item");
//        if(itemName != null && itemName != "") {
//            $("#itemName").val(itemName);
//            $("#itemName").attr("readonly", "readonly");
//        }


        var mpId = getQueryString("mpId");
        var myTP = getPrecautionById("MindPrecaution", mpId);
        if( myTP != null) {
            $("#mpId").val(mpId);
            $("#itemName").text(myTP.s_Map.itemName_s);
            $("#detailDesc").val(myTP.s_Map.detailDesc_s);
            if(myTP.s_Map.mediaFile_s != null) {

            var _WORDJSON_MAP = {};
            	if(isNotNull(myTP.s_Map.wordInfo_s)){
            		_WORDJSON_MAP =  JSON.parse(myTP.s_Map.wordInfo_s);
            		WORDJSON_MAP = _WORDJSON_MAP;
            	}

                var arr = myTP.s_Map.mediaFile_s.split(',');
                var imageHtml = '';
                $.each(arr, function(i,val){
                    if(val != "") {
                       if(val.indexOf(".doc")!=-1){
                    		 imageHtml += template("wordTemplate", {filename:_WORDJSON_MAP[val],imageUrl :val ,mid : val.replace(new RegExp("/","g"),'').replace('.','')});
                    	}else {
                       	 imageHtml += template("imageTemplate", {imageUrl :val ,mid : val.replace(new RegExp("/","g"),'').replace('.','')});
                        }
                    }
                });
                $("#mediaFile").val(myTP.s_Map.mediaFile_s);
                $("#imageShow").append(imageHtml);
            }
        }
    })
</script>
</body>
</html>