<#assign security=JspTaglibs["/WEB-INF/tlds/security.tld"] />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <title>人防</title>
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
    <script src="${rc.contextPath}/js/common.js"></script>
    <script src="${rc.contextPath}/js/preCaution.js"></script>
    <script src="${rc.contextPath}/js/address.js"></script>
<script src="${rc.contextPath}/js/uploadword.js"></script>
    <script src="${rc.contextPath}/ydui_js/template.js"></script>

<style type="text/css">
.list-img {
    margin: 20px 0px;

}
</style>
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
        <h1 class="demo-pagetitle">人防信息</h1>
        <h2 class="demo-detail-title" ></h2>
        <input type="hidden" name="unitId_s" id="unitId" />
        <input type="hidden" id="ppId" />
        <div class="m-cell">
            <label class="cell-item">
                <span class="cell-left"> <i class="cell-icon icon-star"></i>名称：</span>
                <label class="cell-right" style="text-align: left;font-size:16px;margin-top: 5px;margin-bottom: 5px;" id="itemName"></label>
            </label>
            <label class="cell-item">
                <span class="cell-left"> <i class="cell-icon icon-clock"></i>更新时间：</span>
                <label class="cell-right " id="updated"></label>
            </label>
        </div>
        <div class="m-celltitle">详细描述</div>
        <div class="m-cell">
            <div class="cell-item">
                <div class="cell-right">
                    <textarea  id="detailDesc" class="cell-textarea" readonly="readonly" ></textarea>
                </div>
            </div>
        </div>
        <div class="m-celltitle">图片信息</div>
        <div class="m-cell">
            <article style="width:100%;" class="m-list list-theme1" id ="imageShow">
            </article>
            <script id="imageTemplate" type="text/html">
                
                    <div class="list-img" style="text-align: -webkit-center;">                     
                        <img class="list-img-img" src="/upload_temp/{{imageUrl}}" id="{{mid}}" style="margin: 0 auto;" onclick="removeClassN(this);getImgTimestamp(this)"/>
                    </div>
               
            </script>
        </div>

        <div class="m-celltitle">文档信息</div>
        <div class="m-cell">
            <article style="width:100%;" class="m-list list-theme1" id ="wordShow">
            </article>
            <script id="wordTemplate" type="text/html">
                <a href="javascript:void(0);" class="list-item" style="width:90%">
                    <div class="list-word">
                        <span class="list-img-span" onclick="down('{{imageUrl}}','{{filename}}')"> {{filename}}  </span>
                    </div>
                    <hr/>
                </a>

            </script>
        </div>
            <!--
            <div class="cell-item">
                <div class="cell-left">录入时间：</div>
                <div class="cell-right "><input type="datetime-local" id="entryTime" class="cell-input" value="2017-09-21T08:08" placeholder="" autocomplete="off" /></div>
            </div>
            -->

            <div class="m-button" style="width: 100%;">
                <button type="button" id="recreateBtn" class="btn-block btn-primary" style="display:block">信息更新</button>
                <button type="button" id="raiseIssueBtn" class="btn-block btn-primary" style="display:none">录入问题</button>
            </div>
    <!--    </form> -->
   	</section>
</section>
<!--底部DIV -->
 <#include "/menu/foot.ftl" />
<!--底部DIV -->

<!-- 引入YDUI脚本 -->
<script src="${rc.contextPath}/ydui_js/ydui.js"></script>

<script>
    !function ($) {
        var dialog = YDUI.dialog;
        $("#recreateBtn").on("click", function() {
            dialog.confirm('人防信息更新', '是否确定要更新人防信息', [
                {
                    txt: '取消',
                    color: false,
                    callback: function () {
                        dialog.toast('取消更新', 'none', 500);
                    }
                },
                {
                    txt: '确定',
                    color: true,
                    callback: function () {
                        dialog.toast('开始更新', 'none', 1000);
                        window.location.href = "${rc.contextPath}/personPrecaution/PPEdit?unit=" + $("#unitId").val() +
                            "&ppId=" + $("#ppId").val();
                    }
                }
            ]);
        })

		

        $("#raiseIssueBtn").on("click", function() {
            dialog.confirm('录入纠纷隐患信息', '是否确定要录入纠纷隐患信息', [
                {
                    txt: '取消',
                    color: false,
                    callback: function () {
                        dialog.toast('取消录入', 'none', 500);
                    }
                },
                {
                    txt: '确定',
                    color: true,
                    callback: function () {
                        dialog.toast('开始录入', 'none', 1000);
                        window.location.href = "${rc.contextPath}/personPrecaution/PPIssueEdit?unit=" + $("#unitId").val();
                    }
                }
            ]);
        })
    }(jQuery);


    function getLatestTechPrecaution(unitId, itemName) {
        $.ajax({
            url : "http://" + changeAddr() + "/common/getModelList",
            type : 'GET',
            async : false,
            data : {
                "filter[className]": "TechPrecaution",
                "length": 1024,
                "filter[unitId_s_s_EQ]" : unitId,
                "filter[itemName_s_s_EQ]": itemName
            },
            dataType : 'json',
            success : function(data) {
                if(data.totalElements > 0) {
                    var result = data.content[0];
                    if(data.totalElements > 1) {
                        for(var i=1; i< data.totalElements-1; i++) {
                            if(result.created_dt < data.content[i].created_dt) {
                                result = data.content[i];
                            }
                        }
                    }

                    $("#created").text($.format.date(result.created_dt, "yyyy-MM-dd HH:mm:ss"));
                    $("#detailDesc").text(result.s_Map.detailDesc_s);
                    if(isNotNull(result.s_Map.mediaFile_s)){
                        var arr = result.s_Map.mediaFile_s.split(',');
                        var imageHtml = '';
                        $.each(arr, function(i,val){
                            if(val != "") {
                                imageHtml += template("imageTemplate", {imageUrl:val});
                            }
                        });
                        $("#imageShow").append(imageHtml);
                    }
                }
            }
        });
    }
    $(document).ready(function() {
//        var userType = queryUserGroup('<@security.authentication property="principal.username" />');
//        if(isNotNull(userType) && isNotNull(userType[1])) {
//            $("#recreateBtn").css("display", "none");
//            $("#raiseIssueBtn").css("display", "block");
//        } else {
//            $("#recreateBtn").css("display", "block");
//            $("#raiseIssueBtn").css("display", "none");
//        }

        var unitId = getQueryString("unit");
        // 副标题
        var myUnit = getUnitById(unitId);
        if(myUnit != null) {
            $("#unitId").val(unitId);
            $("#unitTitle").text(myUnit.s_Map.unitName_s);
        }

//        var itemName = getQueryString("item");
//        $("#itemName").text(itemName);
//        getLatestTechPrecaution(unitId, itemName);

        var ppId = getQueryString("ppId");
        var myPP = getPrecautionById("PersonPrecaution", ppId)
        if( myPP != null) {
            $("#ppId").val(ppId);
            $("#itemName").text(myPP.s_Map.itemName_s);
            $("#updated").text($.format.date(myPP.updated_dt, "yyyy-MM-dd HH:mm:ss"));
            $("#detailDesc").val(myPP.s_Map.detailDesc_s);
            if(isNotNull(myPP.s_Map.mediaFile_s)){
            
          	  var _WORDJSON_MAP = {};
            	if(isNotNull(myPP.s_Map.wordInfo_s)){
            		_WORDJSON_MAP =  JSON.parse(myPP.s_Map.wordInfo_s);
            	}
            	
                var arr = myPP.s_Map.mediaFile_s.split(',');
                var imageHtml = '';
                var wordHtml = '';
                $.each(arr, function(i,val){
                    if(val != "" &&   val.indexOf(".doc")==-1) {
                        imageHtml += template("imageTemplate", {imageUrl:val, mid:val.replace(new RegExp("/","g"),'').replace('.','')});
                    }
                });

                  $.each(arr, function(i,val){
                    if(val != "" &&  val.indexOf(".doc")!=-1 ) {
                        wordHtml += template("wordTemplate", {imageUrl:val , filename:_WORDJSON_MAP[val] });
                    }
                });


                $("#imageShow").append(imageHtml);
                $("#wordShow").append(wordHtml);
            }
        }
    })
</script>
</body>
</html>