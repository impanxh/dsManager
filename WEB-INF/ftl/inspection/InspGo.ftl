<#assign security=JspTaglibs["/WEB-INF/tlds/security.tld"] />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <title>检查</title>
    <meta content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0" name="viewport" />
    <meta content="yes" name="apple-mobile-web-app-capable" />
    <meta content="black" name="apple-mobile-web-app-status-bar-style" />
    <meta content="telephone=no" name="format-detection" />
    <!-- 引入YDUI样式 -->
    <link rel="stylesheet" href="${rc.contextPath}/ydui_css/ydui.css" />
    <link rel="stylesheet" href="${rc.contextPath}/css/demo.css" />
    <link rel="stylesheet" href="${rc.contextPath}/css/swiper.min.css">
    <link rel="stylesheet" href="${rc.contextPath}/css/questionnaire.css">

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
        <h1 class="demo-pagetitle">新的检查</h1>
        <h2 class="demo-detail-title"></h2>
        <input type="hidden" id="unitId">
        <input type="hidden" id="serialNum">
        <input type="hidden" id="hySort">
        <input type="hidden" id="hyType">
        <input type="hidden" id="code">
        <div class="swiper-container">
            <div class="m-cell swiper-wrapper" id="inspBank">
                <!--
                <template v-for="insp in inspList">
                <div class="m-cell swiper-slide">
                    <label class="cell-item">
                        <span class="cell-left">{{insp.s_Map.type_s}}</span>
                    </label>
                    <label class="cell-item">
                        <div class="cell-right">
                            <textarea class="cell-textarea"  style="height:4rem;" readonly="readonly">{{insp.s_Map.content_s}}</textarea>
                        </div>
                    </label>
                    <label class="cell-item">
                        <span class="cell-left">检查通过</span>
                        <label class="cell-right">
                            <input type="radio" v-bind:name="insp.id" value="1" onclick="checkPass($(this))" />
                            <i class="cell-checkbox-icon"></i>
                        </label>
                    </label>
                    <label class="cell-item">
                        <span class="cell-left">发现问题</span>
                        <label class="cell-right">
                            <input type="radio" v-bind:name="insp.id" value="0" onclick="checkReject($(this))"/>
                            <i class="cell-checkbox-icon"></i>
                        </label>
                    </label>
                </div>
                </template>
                -->
            </div>
            <div class="swiper-pagination"></div>
            <div class="maskwhite"></div>
        </div>

        <div class="m-cell" id="newIssue" style="display:none;">
            <h2 class="demo-detail-title">新增隐患或纠纷</h2>
            <input type="hidden" id="originInspId">
            <div class="cell-item">
                <div class="cell-left"><i class="cell-icon icon-star"></i>名称：</div>
                <div class="cell-right "><input type="text" id="issueName" class="cell-input" placeholder="" autocomplete="off" /></div>
            </div>
            <div class="cell-item">
                <div class="cell-left"><i class="cell-icon icon-type"></i>类型：</div>
                <label class="cell-right ">
                    <select class="cell-select" id="issueType">
                        <option value="">请选择类型</option>
                        <option value="纠纷">纠纷</option>
                        <option value="隐患" selected="selected">隐患</option>
                        <option value="上报">上报</option>
                    </select>
                </label>
            </div>
            <div class="cell-item">
                <div class="cell-left"><i class="cell-icon icon-type"></i>详细内容：</div>
                <div class="cell-right "><textarea class="cell-textarea" placeholder="" id="issueContent" ></textarea></div>
            </div>
            <!-- -->

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
                <video id="videoFile" src="" controls="controls" width="320" height="240"></video>
            </div>
            <div class="cell-item">
                <div class="cell-left"></div>
                <div class="cell-right">
                    <div class="divupload">
                        <form id="videoForm" method="post" enctype="multipart/form-data">
                            <div class="divuploadfile">上传视频</div>
                            <input type="file" name="uploadVideo_s" id="uploadVideo_s" class="inputstyle" onchange="uploadVideoFile()" />
                        </form>
                        <input type="hidden" id="videoFile_s" />
                    </div>
                </div>
            </div>
            <!--
            <div class="cell-item">
                <div class="cell-left"> <i class="cell-icon icon-phone3"></i>上传照片：</div>
                <div class="cell-right ">
                    <form id="mediaFileForm" method="post" enctype="multipart/form-data">
                        <input type="file" name="uploadFile_s" id="uploadFile" class="btn btn-warning" onchange="uploadMediaFile()" />
                    </form>
                    <input type="hidden" id="mediaFile" /></div>
            </div>

            <div class="cell-item">
                <div class="cell-left"><i class="cell-icon icon-video"></i>上传视频：</div>
                <div class="cell-right">
                    <form id="videoForm" method="post" enctype="multipart/form-data">
                        <input type="file" name="uploadVideo_s" id="uploadVideo" class="btn btn-warning" onchange="uploadVideoFile()" />
                    </form>
                    <input type="hidden" id="videoFile" /></div>
            </div>
            -->

            <div class="cell-item">
                <div class="cell-left"><i class="cell-icon icon-ucenter"></i>责任整改人：</div>
                <div class="cell-right "><input type="text" name="personLiable_s" id="personLiable" class="cell-input" placeholder="" autocomplete="off" /></div>
            </div>
            <div class="cell-item">
                <div class="cell-left"><i class="cell-icon icon-time"></i>限期整改时间：</div>
                <div class="cell-right "><input type="datetime-local" min="2017-09-25T00:00" name="deadline_d" id="deadline" class="cell-input" value="" placeholder="" autocomplete="off" /></div>
            </div>
            <div class="cell-item">
                <div class="cell-left"><i class="cell-icon icon-feedback"></i>整改办法：</div>
                <div class="cell-right "><textarea class="cell-textarea" placeholder="" name="solution_s" id="solution" ></textarea></div>
            </div>

            <div class="m-button" style="width: 100%;">
                <button type="button" id="submitBtn" class="btn-block btn-primary">保存信息</button>
            </div>
        </div>

        <footer class="m-tabbar tabbar-fixed">
            <a href="javascript:void(0);" class="tabbar-item" id="numok">
        <span class="tabbar-icon">
            <img src="${rc.contextPath}/images/mindok.png">
        </span>
                <span class="tabbar-txt">提交</span>
            </a>
            <a href="javascript:void(0);" class="tabbar-item" id="showall">
        <span class="tabbar-icon">
            <img src="${rc.contextPath}/images/mindnum.png">
            <span id="curnum" class="tabbar-txt">1</span><span class="tabbar-txt">/</span><span id="totNum" class="tabbar-txt"></span>
        </span>
                <span class="tabbar-txt" id="showallTxt">显示</span>
            </a>
            <div class="swiper-button-prev tabbar-item"></div>
            <div class="swiper-button-next tabbar-item"></div>
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
<script src="${rc.contextPath}/ydui_js/template.js"></script>
<script src="${rc.contextPath}/js/vue.min.js"></script>
<script src="${rc.contextPath}/js/preCaution.js"></script>
<script src="${rc.contextPath}/js/address.js"></script>
<script src="${rc.contextPath}/js/swiper.min.js"></script>
<script type="text/javascript">
    // Initialize the swiper
    var mySwiper = new Swiper('.swiper-container', {
        pagination:'.swiper-pagination',
        prevButton:'.swiper-button-prev',
        nextButton:'.swiper-button-next',
        paginationType:'custom',
        paginationCustomRender: function (mySwiper, current, total) {
            $("#totNum").text(total);//总页码
            return '<span class="tabbar-txt">' + current + ' of ' + total + '</span>';
        },
        onSlideChangeStart: function(swiper) {
          $("#newIssue").css("display", "none");
        },
        onSlideChangeEnd: function(swiper){
            $("#newIssue").css("display", "none");
            $("#curnum").text(swiper.activeIndex+1);//当前页
        }
    });

    var inspectResult = {};
    function checkPass(obj) {
        inspectResult[obj.attr("name")] = 1;
        $("#newIssue").css("display", "none");
    }

    function checkReject(obj) {
        var inspId = obj.attr("name");
        inspectResult[inspId] = 0;
        $("#originInspId").val(inspId);
        $("#newIssue").css("display", "block");
        YDUI.dialog.toast('往下滚动，提交新的隐患或者纠纷', 'none', function(){
        });
    }
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
    function submitIssue() {
        var issueStatus = "未解决";
        var issueType = $("#issueType").val();
        if(issueType == "上报") {
            issueStatus = "勿需解决";
        }
        var params = {
            "unitId_s": $("#unitId").val(),
            "hySort_s": $("#hySort").val(),
            "hyType_s": $("#hyType").val(),
            "code_s": $("#code").val(),
            "issueStatus_s": issueStatus,
            "issueName_s": $("#issueName").val(),
            "issueType_s": $("#issueType").val(),
            "occurenceTime_d": new Date().getTime(),
            "issueContent_s": $("#issueContent").val(),
            "personLiable_s": $("#personLiable").val(),
            "solution_s": $("#solution").val(),
            "deadline_d": new Date($("#deadline").val()).getTime(),
            "reporter_s": "<@security.authentication property="principal.username" />",
            "mediaFile_s": $("#mediaFile_s").val(),
            "videoFile_s": $("#videoFile_s").val(),
            "serialNum_s": $("#serialNum").val(),
            "originInspId_s": $("#originInspId").val()
        };

        var settings = {
            "url": "http://" + changeAddr() + "/common/saveModel?className=issue&checkUniq=N&UID=<@security.authentication property="principal.username" />",
            "async": false,
            "crossDomain": true,
            "method": "POST",
            "data": params,
        }

        $.ajax(settings).done(function(response) {
            $("#issueName").val("");
            $("#issueContent").val("");
            $("#mediaFile_s").val("");
            $("#uploadFile_s").val("");
            $("#uploadVideo_s").val("");
            $("#videoFile_s").val("");
            $("#originInspId").val("");
            $("#imageShow").html("");
            $("#newIssue").css("display", "none");
            mySwiper.slideNext();
            mySwiper.onResize();

        });
    }

    function submit() {
        var failureInsp = 0;
        $.each(inspectResult, function (key, val) {
            if(val != 1) {
                failureInsp++;
            }
        })
        var now = new Date();
        var params = {
          "unitId_s": $("#unitId").val(),
          "unitName_s": $("#unitTitle").text(),
          "hySort_s": $("#hySort").val(),
          "hyType_s": $("#hyType").val(),
          "code_s": $("#code").val(),
          "inspTime_s": $.format.date(now, "yyyy-MM-dd HH:mm:ss"),
          "inspector_s": "<@security.authentication property="principal.username" />",
          "inspRecord_s": JSON.stringify(inspectResult),
          "failureInsp_i": failureInsp,
          "serialNum_s": $("#serialNum").val()
        }

        var settings = {
            "url": "http://" + changeAddr() + "/common/saveModel?className=Inspection&checkUniq=N&UID=<@security.authentication property="principal.username" />",
            "async": false,
            "crossDomain": true,
            "method": "POST",
            "data": params,
        }
        $.ajax(settings).done(function(response) {
            window.location.href = "${rc.contextPath}/inspection/InspList?unit=" + $("#unitId").val();
        });
    }

    function insertInspSlides(inspList) {
       $.each(inspList, function(i, item){
           var oneSlide = '<div class="swiper-slide">' +
                   '<label class="cell-item">' +
                   '<span class="cell-left">'+ item.s_Map.type_s + '</span>' +
                   '</label>' +
                   '<label class="cell-item"><div class="cell-right">' +
                   '<textarea class="cell-textarea"  style="height:4rem;" readonly="readonly">'+ item.s_Map.content_s +'</textarea>' +
                   '</div></label>' +
                   '<label class="cell-item">' +
                   '<span class="cell-left">检查通过</span>' +
                   '<label class="cell-right">' +
                   '<input type="radio" name="'+ item.id +'" value="1" onclick="checkPass($(this))" />' +
                   '<i class="cell-checkbox-icon"></i></label></label>' +
                   '<label class="cell-item">' +
                   '<span class="cell-left">发现问题</span>' +
                   '<label class="cell-right">' +
                   '<input type="radio" name="'+ item.id +'" value="0" onclick="checkReject($(this))"/>' +
                   '<i class="cell-checkbox-icon"></i>' +
                   '</label></label><label class="cell-item"/></div>';

           mySwiper.appendSlide(oneSlide);
       });
    }

    function retrieveInsps(hyType, inspType) {
        $.ajax({
            type: 'GET',
            url: 'http://' + changeAddr() + '/common/getModelList',
            async: false,
            data: {
                "filter[className]": "InspectionBank",
                "length": 1024,
                "filter[template_s_s_EQ]": hyType,
                //"filter[type_s_s]": inspType,
                "userid":"<@security.authentication property="principal.username" />",
                "isTaskQuery": "yes"
            },
            success: function (data) {
                if(data.totalElements > 0) {
                    insertInspSlides(data.content);
                }
            }
        });
    }

    !function ($) {
        var dialog = YDUI.dialog;

        //点击底部出现题目数
        $("#showall").on("click", function(){
            $(".maskwhite").toggle();
            $(".swiper-pagination").toggle();

            var showAllTxt = $("#showallTxt").text();
            if(showAllTxt == "显示") {
                $("#showallTxt").text("隐藏");
            } else {
                $("#showallTxt").text("显示");
            }
        });

        $("#numok").on("click", function() {
            $(".swiper-pagination").hide();
            var allNum = parseInt($("#totNum").text());
            var checkNum = Object.keys(inspectResult).length;
            // TODO 检查是否完成所有题目
            if(checkNum < allNum) {
                dialog.alert("您尚未完成全部检查记录。共有["+ allNum + "]条检查记录，您已完成[" + checkNum + "]条");
            } else {
                dialog.confirm('提交检查记录', '是否确定提交检查记录？', [
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
                            submit();
                        }
                    }
                ]);
            }
        });
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
                        submitIssue();
                    }
                }
            ]);
        })
    }(jQuery);

    $(document).ready(function() {
        var unitId = getQueryString("unit") || "";
        // 副标题
        var myUnit = getUnitById(unitId)
        if (myUnit == null) {
            YDUI.dialog.toast('参数错误：无效的单位编码', 'error', 3000, function () {
                window.location.href = "${rc.contextPath}/placeManage";
            });
        }

        var timeStamp = new Date().getTime();
        $("#serialNum").val(timeStamp);
        $("#unitId").val(unitId);
        $("#unitTitle").text(myUnit.s_Map.unitName_s);
        $("#hySort").val(myUnit.s_Map.hySort_s);
        $("#hyType").val(myUnit.s_Map.hyType_s);
        $("#code").val(myUnit.s_Map.code_s);

        var inspType = getQueryString("type") || "";
        retrieveInsps(myUnit.s_Map.hyType_s, inspType);
//        var inspVue = new Vue({
//            el: '#inspBank',
//            data: {
//                inspList: {},
//            },
//            mounted: function(){
//               this.$nextTick(function() {
//                   this.showData();
//               })
//
//            },
//            methods: {
//                showData: function () {
//                    var _self = this;
//                    $.ajax({
//                        type: 'GET',
//                        url: 'http://' + changeAddr() + '/common/getModelList',
//                        async: false,
//                        data: {
//                            "filter[className]": "InspectionBank",
//                            "length": 1024,
//                            "template_s": myUnit.s_Map.hyType_s,
//                            "userid":"<@security.authentication property="principal.username" />",
//                            "isTaskQuery": "yes"
//                        },
//                        success: function (data) {
//                            _self.inspList = (data.content);
//                        }
//                    });
//                }
//            }
//        })

    })
</script>
</body>
</html>

