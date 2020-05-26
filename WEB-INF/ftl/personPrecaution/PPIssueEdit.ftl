<#assign security=JspTaglibs["/WEB-INF/tlds/security.tld"] />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <title>纠纷隐患管理</title>
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
    <!-- 引入YDUI脚本 -->
    <script src="${rc.contextPath}/ydui_js/template.js"></script>
    <script src="${rc.contextPath}/js/vue.min.js"></script>
    <script src="${rc.contextPath}/js/preCaution.js"></script>
    <script src="${rc.contextPath}/js/address.js"></script>
    <script src="${rc.contextPath}/js/common.js"></script>

</head>
<body>
    <section class="g-flexview">
        <header class="m-navbar">
            <a href="javascript:history.back(-1);" class="navbar-item"><i class="back-ico"></i></a>
            <div class="navbar-center"><span class="navbar-title" id="unitTitle"></span></div>
        </header>

        <section class="g-scrollview">
            <h1 class="demo-pagetitle">纠纷隐患管理</h1>
            <h2 class="demo-detail-title"></h2>
            <input type="hidden" id="issueId" />
            <input type="hidden" id="unitId" />
            <input type="hidden" id="unitName" />
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
                            <option value="隐患" selected="selected">隐患</option>
                            <option value="上报">上报</option>
                        </select>
                    </label>
                </div>
                <div class="cell-item">
                    <div class="cell-left"><i class="cell-icon icon-checkoff"></i>状态：</div>
                    <label class="cell-right ">
                        <select class="cell-select" name="issueStatus_s" id="issueStatus_s">
                            <option value="">请选择状态</option>
                            <option value="未解决" selected="selected">未解决</option>
                            <option value="已解决">已解决</option>
                            <option value="勿需解决">勿需解决</option>
                        </select>

                    </label>
                </div>


                <div class="cell-item">
                    <div class="cell-left"><i class="cell-icon icon-ucenter-outline"></i>上报人：</div>
                    <div class="cell-right "><input type="text" name="reporter_s" id="reporter_s" class="cell-input" placeholder="" autocomplete="off" /></div>
                </div>
                <div class="cell-item">
                    <div class="cell-left"><i class="cell-icon icon-time"></i>发生时间：</div>
                    <div class="cell-right "><input type="datetime-local" min="2017-09-25T00:00" name="occurenceTime_d" id="occurenceTime" class="cell-input" value="" placeholder="" autocomplete="off" /></div>
                </div>

            </div>
            <div class="m-celltitle">详细内容</div>
            <div class="m-cell">
                <div class="cell-item">
                    <div class="cell-right "><textarea class="cell-textarea" placeholder="" name="issueContent_s" id="issueContent_s" ></textarea></div>
                </div>
            </div>

            <div class="m-celltitle">多媒体信息</div>
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
                <div class="cell-item">
                    <video id="videoFile" src="" controls="controls"  width="320" height="240"></video>
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

            <div class="m-celltitle">整改信息</div>
            <div class="m-cell">
                <div class="cell-item">
                    <div class="cell-left"><i class="cell-icon icon-ucenter"></i>责任整改人：</div>
                    <div class="cell-right "><input type="text" name="personLiable_s" id="personLiable_s" class="cell-input" placeholder="" autocomplete="off" /></div>
                </div>
                <div class="cell-item">
                    <div class="cell-left"><i class="cell-icon icon-time"></i>限期整改时间：</div>
                    <div class="cell-right "><input type="datetime-local" min="2017-09-25T00:00" name="deadline_d" id="deadline" class="cell-input" value="" placeholder="" autocomplete="off" /></div>
                </div>
                <div class="cell-item">
                    <div class="cell-left"><i class="cell-icon icon-feedback"></i>整改办法：</div>
                    <div class="cell-right "><textarea class="cell-textarea" placeholder="" name="solution_s" id="solution_s" ></textarea></div>
                </div>
            </div>
            <footer class="m-tabbar">
                <div class="m-button" style="width: 100%;">
                    <button type="button" id="submitBtn" class="btn-block btn-primary">保存信息</button>
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
        });

        $("#issueType_s").change(function(){
            var val = $(this).val();
            if(val == "上报") {
                $("#issueStatus_s").val("勿需解决");
            } else {
                $("#issueStatus_s").val("未解决");
            }
        });
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
                $("#videoFile").attr("src", "/upload_temp/" + data.path);
                YDUI.dialog.loading.close();
            }
        };
        YDUI.dialog.loading.open('视频上传中');
        setTimeout(function () {
            $("#videoForm").ajaxSubmit(options);
        }, 1000);
    }

    // 提交表单信息
    function submit() {
        var params = {
            "issueName_s": $("#issueName_s").val(),
            "issueType_s": $("#issueType_s").val(),
            "issueStatus_s": $("#issueStatus_s").val(),
            "occurenceTime_d": new Date($("#occurenceTime").val()).getTime(),
            "deadline_d": new Date($("#deadline").val()).getTime(),
            "issueContent_s": $("#issueContent_s").val(),
            "solution_s": $("#solution_s").val(),
            "reporter_s": $("#reporter_s").val(),
            "personLiable_s": $("#personLiable_s").val(),
            "mediaFile_s": $("#mediaFile_s").val(),
            "videoFile_s": $("#videoFile_s").val(),
        };

        var settings = {
            "async": false,
            "crossDomain": true,
            "method": "POST",
        }
        var issueId = $("#issueId").val();
        if(issueId != "") {
            params["selectByField"] = "id";
            params["id"] = issueId;
            settings["url"] = "http://" + changeAddr() + "/common/saveModel?className=issue&checkUniq=Y&UID=<@security.authentication property="principal.username" />";
        } else {
            var  unitId_s = $("#unitSelect").val();
            params["unitId_s"] = unitId_s;
              var obj = queryForObject({"filter[id]":unitId_s},'Unit');
              if(isNotNull(obj) && isNotNull(obj.s_Map) ){
	              params.hySort_s = obj.s_Map.hySort_s;
	              params.hyType_s = obj.s_Map.hyType_s;
	              params.code_s = obj.s_Map.code_s;
             	  //params["hySort_s"] = $("#unitSelect").attr('hysort_s');
            	 //params["hyType_s"] = $("#unitSelect").attr('hytype_s');
              }

            //add pxh  采用
            //params["hySort_s"] = $("#unitSelect").attr('hysort_s');
            //params["hyType_s"] = $("#unitSelect").attr('hytype_s');
            settings["url"] = "http://" + changeAddr() + "/common/saveModel?className=issue&checkUniq=N&UID=<@security.authentication property="principal.username" />";
        }
        settings["data"] = params;

        $.ajax(settings).done(function(response) {
            var myUnitId = $("#unitId").val();
            if(myUnitId == "") {
                myUnitId = $("#unitSelect").val();
            }
            window.location.href = "${rc.contextPath}/personPrecaution/PPIssueList?unit=" + myUnitId;
        });
    }

    function getIssue(issueId) {
        $.ajax({
            "url" : "http://" + changeAddr() + "/common/queryById?className=issue&id=" + issueId,
            type : 'GET',
            async : false,
            data : {},
            dataType : 'json',
            success : function(data) {
                if (data != "") {
                    $("#issueId").val(issueId);
                    $("#issueName_s").val(data.s_Map.issueName_s);
                    $("#reporter_s").val(data.s_Map.reporter_s);
                    $("#personLiable_s").val(data.s_Map.personLiable_s);
                    $("#issueContent_s").val(data.s_Map.issueContent_s);
                    $("#solution_s").val(data.s_Map.solution_s);
                    $("#issueType_s").val(data.s_Map.issueType_s);
                    $("#issueStatus_s").val(data.s_Map.issueStatus_s);
                    $("#occurenceTime").val($.format.date(data.d_Map.occurenceTime_d, "yyyy-MM-ddTHH:mm:ss"));
                    $("#deadline").val($.format.date(data.d_Map.deadline_d, "yyyy-MM-ddTHH:mm:ss"));
                    $("#mediaFile_s").val(data.s_Map.mediaFile_s);
                    $("#videoFile_s").val(data.s_Map.videoFile_s);
                    if(data.s_Map.mediaFile_s != null) {
                        var arr = data.s_Map.mediaFile_s.split(',');
                        var imageHtml = '';
                        $.each(arr, function(i,val){
                            if(val != "") {
                                imageHtml += template("imageTemplate", {imageUrl :val ,mid : val.replace(new RegExp("/","g"),'').replace('.','')});
                            }
                        });
                        $("#imageShow").append(imageHtml);
                    }
                    if(data.s_Map.videoFile_s != null) {
                        $("#videoFile").attr("src", "/upload_temp/" + data.s_Map.videoFile_s);
                    }

                    // 副标题
                    var myUnit = getUnitById(data.s_Map.unitId_s)
                    if(myUnit != null) {
                        $("#unitId").val(myUnit.id);
                        $("#unitName").val(myUnit.s_Map.unitName_s);
                        $("#unitTitle").text(myUnit.s_Map.unitName_s);
                    }
                }
            }
        });
    }

    $(document).ready(function() {
        var issueId = getQueryString("id");
        var unitId = getQueryString("unit") || "";
        var unitName = "";
        if(issueId != null) {
            getIssue(issueId);
        } else {
            // 副标题
            var myUnit = getUnitById(unitId)
            if (myUnit != null) {
                $("#unitId").val(unitId);
                $("#unitName").val(myUnit.s_Map.unitName_s);
                $("#unitTitle").text(myUnit.s_Map.unitName_s);
            }
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