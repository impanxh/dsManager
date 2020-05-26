<#assign security=JspTaglibs["/WEB-INF/tlds/security.tld"] />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <title>工作小组</title>
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
        <a href="javascript:history.back(-1);" class="navbar-item"><i class="back-ico"></i></a>
        <div class="navbar-center"><span class="navbar-title" id="unitTitle"></span></div>
    </header>

    <section class="g-scrollview">
        <h1 class="demo-pagetitle">工作小组</h1>
        <h2 class="demo-detail-title"></h2>
        <input type="hidden" name="unitId_s" id="unitId" />
        <input type="hidden"  id="groupId" />
        <input type="hidden" name="subDate_dt" id="subDate" />
        <div class="m-cell">
            <div class="cell-item">
                <div class="cell-left"> <i class="cell-icon icon-star"></i>名称：</div>
                <div class="cell-right "><input type="text" name="groupName_s" id="groupName" class="cell-input" placeholder="请输入小组名称" autocomplete="off" /></div>
            </div>
        </div>
        <div class="m-celltitle">详细描述</div>
        <div class="m-cell">
            <div class="cell-item">
                <div class="cell-right">
                    <textarea  name="detailDesc" id="detailDesc" class="cell-textarea" placeholder="请详细描述小组成员信息"></textarea>
                </div>
            </div>
        </div>
        <div class="m-celltitle">图片信息</div>
        <div class="m-cell">
            <div class="cell-item">
                <div class="cell-right ">
                    <div style="display:block;float:left;">
                        <article class="m-list list-theme1" id ="imageShow">
                        </article>
                        <script id="imageTemplate" type="text/html">
                            <div id="{{mid}}">
                                <a href="javascript:void(0);" class="list-item" style="width:90%">
                                    <div class="list-img">
                                        <img src="/upload_temp/{{imageUrl}}" />
                                        <a href='javascript:void(0);' onclick='del("{{imageUrl}}","{{mid}}")'>删除图片</a>
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
        </div>

        <footer class="m-tabbar tabbar-fixed">
            <div class="m-button" style="width: 100%;">
                <button type="button" id="submitBtn" class="btn-block btn-primary">保存信息</button>
            </div>
        </footer>
    <!--    </form> -->
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
<script src="${rc.contextPath}/ydui_js/template.js"></script>
<script src="${rc.contextPath}/js/common.js"></script>
<script src="${rc.contextPath}/js/preCaution.js"></script>
<script src="${rc.contextPath}/js/address.js"></script>
<script>
    !function ($) {
        var dialog = YDUI.dialog;
        $("#submitBtn").on("click", function() {
            dialog.confirm('确认保存', '是否保存工作小组信息', [
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
                        dialog.toast('保存工作小组信息', 'none', 1000);
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
                file_list =  file_list== '' ? data.path :  file_list + "," + data.path;
                $("#mediaFile_s").val(file_list);
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
            "unitId_s": $("#unitId").val(),
            "type_s": "WORKGROUP",
            "groupName_s": $("#groupName").val(),
            "detailDesc_s": $("#detailDesc").val(),
            "mediaFile_s": $("#mediaFile_s").val()
        }

        var groupId = $("#groupId").val();
        var settings = {
            "async": false,
            "crossDomain": true,
            "method": "POST",
        }
        if(groupId != "") {
            params["selectByField"] = "id";
            params["id"] = groupId;
            settings["url"] = "http://" + changeAddr() + "/common/saveModel?className=PersonPrecaution&checkUniq=Y&UID=<@security.authentication property="principal.username" />";
        } else {
            settings["url"] = "http://" + changeAddr() + "/common/saveModel?className=PersonPrecaution&checkUniq=N&UID=<@security.authentication property="principal.username" />";
        }
        settings["data"] = params;

        $.ajax(settings).done(function(response) {
            window.location.href = "${rc.contextPath}/personPrecaution/PPWGList?unit=" + $("#unitId").val();
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

        var groupId = getQueryString("group");
        if(groupId != null) {
            $.ajax({
                type: 'GET',
                url: 'http://' + changeAddr() + '/common/queryById?className=PersonPrecaution&id=' + groupId,
                async : false,
                data : {},
                success:function(data) {
                    if(data != "") {
                        $("#groupId").val(groupId);
                        $("#groupName").val(data.s_Map.groupName_s);
                        $("#detailDesc").text(data.s_Map.detailDesc_s);
                        $("#mediaFile_s").val(data.s_Map.mediaFile_s);
                        if(isNotNull(data.s_Map.mediaFile_s)){
                            var arr = data.s_Map.mediaFile_s.split(',');
                            var imageHtml = '';
                            $.each(arr, function(i,val){
                                if(val != "") {
                                    imageHtml += template("imageTemplate", {imageUrl :val ,mid : val.replace(new RegExp("/","g"),'').replace('.','')});
                                }
                            });
                            $("#imageShow").append(imageHtml);
                        }
                    }
                }
            });

        }
    })
</script>
</body>
</html>