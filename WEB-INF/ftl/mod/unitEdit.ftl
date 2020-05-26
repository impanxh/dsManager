<#assign security=JspTaglibs["/WEB-INF/tlds/security.tld"] />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <title>单位信息编辑</title>
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
    <script src="${rc.contextPath}/js/string.format.js"></script>

    <script src="${rc.contextPath}/js/common.js"></script>
</head>
<body>

     <script id="imageTemplate" type="text/html">
        <div>
        <a href="javascript:void(0);" class="list-item" style="width:100%">
            <div class="list-img">
            <img id="top_img" src="{{img}}" />
            </div>
        </a>
       </div>
    </script>


<section class="g-flexview" id="app">
    <header class="m-navbar">
        <a href="javascript:history.back();" class="navbar-item"><i class="back-ico"></i></a>
        <div class="navbar-center"><span class="navbar-title"><h1 class="demo-pagetitle">{{details.s_Map.unitName_s}}</h1></span></div>
    </header>

    <section class="g-scrollview">

            <div class="m-cell" >
                <div class="cell-item">
                    <div class="cell-right ">
                        <div style="display:block;float:left;">
                            <article class="m-list list-theme1" id="imageShow" v-html="cc">

                              {{cc}}

                            </article>
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

        	<form id="msgForm"  method="post">
                <input type="hidden" id="mediaFile_s_s" :value="details.s_Map.mediaFile_s" name="mediaFile_s">
            <div class="m-cell">
            <div class="cell-item">
            	<div class="cell-left"><i class="cell-icon icon-type"></i>行业类型：</div>
                <label class="cell-right ">
                    <select class="cell-select" id="hyType_s" name="hyType_s">
                        <option :value="details.s_Map.hyType_s" > {{details.s_Map.hyid_s}}</option>
                    <#--	<option value="">请选择行业类型</option>
                        <option v-for="w in datas" :value="w.id" > {{w.s_Map.name_s}}</option>-->
                    </select>
                </label>
            </div>

            <div class="cell-item">
            	<div class="cell-left"><i class="cell-icon icon-shield-outline"></i>分管辖区：</div>
                <label class="cell-right ">
                	 <select class="cell-select" id="hySort_s" name="hySort_s">
                        <option :value="details.s_Map.hySort_s" > {{details.s_Map.regionid_s}}</option>
                	 <#--	<option value="">请选择辖区</option>
                	 	<option v-for="v in region"  :value="v.id" >{{v.s_Map.name_s}}</option>-->
    			</select>

                </label>
            </div>
            <!--
            <div class="cell-item">
            	<div class="cell-left">公安编号：</div>
                <div class="cell-right "><input type="text" :value="details.s_Map.policeId_s" id="policeId_s" name="policeId_s" class="cell-input" placeholder="" autocomplete="off" /></div>
            </div>
            -->
            </div>

            <div class="m-cell">
			<div class="cell-item">
				<div class="cell-left"><i class="cell-icon icon-star-outline"></i>单位名称：</div>
                <div class="cell-right "><input type="text" :value="details.s_Map.unitName_s" name="unitName_s" class="cell-input" placeholder="" autocomplete="off" /></div>
            </div>

            <div class="cell-item">
            	<div class="cell-left"><i class="cell-icon icon-location"></i>单位地址：</div>
                <div class="cell-right "><input type="text" :value="details.s_Map.unitAdd_s" name="unitAdd_s" class="cell-input" placeholder="" autocomplete="off" /></div>
            </div>

            <div class="cell-item">
            	<div class="cell-left"><i class="cell-icon icon-compose"></i>单位基本信息：</div>
                <div class="cell-right">
                    <textarea class="cell-textarea" :value="details.s_Map.basicInfo_s" placeholder="" name="basicInfo_s"></textarea>
                </div>
            </div>
			<div class="cell-item">
				<div class="cell-left"><i class="cell-icon icon-phone1"></i>固定电话：</div>
                <div class="cell-right "><input type="text" :value="details.s_Map.ltleNo_s" name="ltleNo_s" class="cell-input" placeholder="" autocomplete="off" /></div>
            </div>
			<div class="cell-item">
				<div class="cell-left"><i class="cell-icon icon-phone1"></i>联系电话<sup>1</sup>：</div>
                <div class="cell-right "><input type="text" :value="details.s_Map.tleNo_s" name="tleNo_s" class="cell-input" placeholder="" autocomplete="off" /></div>
            </div>
            <div class="cell-item">
				<div class="cell-left"><i class="cell-icon icon-phone1"></i>联系电话<sup>2</sup>：</div>
                <div class="cell-right "><input type="text" :value="details.s_Map.tleNoS_s" name="tleNoS_s" class="cell-input" placeholder="" autocomplete="off" /></div>
            </div>
            </div>
            <div class="m-cell">
           <#--  <div class="cell-item">
            	<div class="cell-left">学生数量：</div>
                <div class="cell-right "><input type="number" :value="details.i_Map.stuNum_i" name="stuNum_i" class="cell-input" placeholder="" autocomplete="off" /></div>
            </div>
            <div class="cell-item">
            	<div class="cell-left">教师数量：</div>
                <div class="cell-right "><input type="number" :value="details.i_Map.teaNum_i" name="teaNum_i" class="cell-input" placeholder="" autocomplete="off" /></div>
            </div>
            <div class="cell-item">
            	<div class="cell-left">工作人员数量：</div>
                <div class="cell-right "><input type="number" :value="details.i_Map.worNum_i" name="worNum_i" class="cell-input" placeholder="" autocomplete="off" /></div>
            </div> -->

            <div class="cell-item">
                <div class="cell-left"><i class="cell-icon icon-ucenter-outline"></i>单位人员信息：</div>
                <textarea class="cell-textarea" :value="details.s_Map.unitNum_s" placeholder="" name="unitNum_s"></textarea>
            </div>
            </div>
        </form>

            <div class="m-button" style="width: 100%;">
    			<button type="button" onclick="saveMsg()" id="savebt" class="btn-block btn-primary">保存信息</button>
			</div>
   	</section>
</section>
<!--底部DIV -->
 <#include "/menu/foot.ftl" />
<!--底部DIV -->

     <script src="${rc.contextPath}/ydui_js/ydui.js"></script>
<script>

var dialog = YDUI.dialog;
var path = 'http://'+changeAddr()+'/common/saveModel?UID=<@security.authentication property="principal.username" />&className=';
var placeId = getQueryString("placeId");
var baseMap ;
    	var modVue = new Vue({
            el: '#app',
                data: {
                    datas: {},
                    region:{},
                    details:{},
                    imageUrl:'',
                    cc:{}
                },
                methods: {
                    showData: function () {
                        var _self = this;
                        var baseUrl = 'http://'+changeAddr()+'/common/getModelList?filter[className]=industry&filter[type_s_s]=';
                        $.ajax({
                            type: 'GET',
                            url: baseUrl+'industry',
                            success:function(data) {
                            	console.log(data.content);
                              //  _self.datas = (data.content);
                            }
                        });

                         $.ajax({
                            type: 'GET',
                            url: baseUrl+'region',
                            success:function(data) {
                              //  _self.region = (data.content);
                            }
                        });
                    },

                    showDetails: function (placeId) {
                        var _self2 = this;
                        $.ajax({
                            type: 'GET',
                            url: "http://" + changeAddr() + "/common/queryById?className=Unit&id=" + placeId,
                            success:function(data) {
                            	baseMap =data.s_Map;
                            	   var _iny = queryForObject({"filter[id]":baseMap.hySort_s},'industry');
                            	   if(isNotNull(_iny)){
                            	   		data.s_Map.regionid_s = _iny.s_Map.name_s
                            	   }
                                _self2.details = (data);
                                if( isNotNull(baseMap.mediaFile_s)){
                                    p=template("imageTemplate",{img: '/upload_temp/'+baseMap.mediaFile_s });
                                }else{
                                    p=template("imageTemplate",{img: '/imgs/default.jpg'});
                                    // $('#top_img').attr('src','../default.jpg');
                                    console.log($('#top_img').attr('src'));

                                }
                                 _self2.cc = p;
                            }
                        });

                    }

                }
        })
    $(function(){
        modVue.showData();
        modVue.showDetails(placeId);


    });

    function saveMsg(){
		var dialog = YDUI.dialog;
    	$('#msgForm').attr("action", path+'Unit&checkUniq=Y');
    	var _action = $('#msgForm').attr("action");
    	var checkText=$("#hyType_s").find("option:selected").text();
		var sort_s=$("#hySort_s").find("option:selected").text();
		var template1 = "&hyid_s={0}&regionid_s={1}";
		var p = template1.format(checkText,sort_s);
		var upRow='N';
		if(isNotNull(baseMap)){
			if(baseMap.hySort_s != $("#hySort_s").find("option:selected").val()
			|| baseMap.hyType_s != $("#hyType_s").find("option:selected").val() ){
				upRow = 'Y'
			}
		}

    	$('#msgForm').attr("action", _action + p+'&selectByField=id&id='+placeId);

    	$('#msgForm').ajaxForm(function(data) {
		if (data.status == 200) {
				if(upRow == 'Y'){
					var postData={"selectByField":'unitId_s_s',"unitId_s":placeId,"upRows":'Y'};
					postData.hySort_s = $("#hySort_s").find("option:selected").val() ;
					postData.hyType_s = $("#hyType_s").find("option:selected").val();
				 	 saveDataModel(postData,"issue");
				}
			$('#savebt').attr("disabled","true");
			$("#savebt").css("background-color", "#85A2AD");
			dialog.toast("保存成功", 'none', 2000);
			var uptime = window.setTimeout(function() {
                window.location.href =  "unitDetail?edit=1&placeId=" + placeId,
				clearTimeout(uptime);
			}, 2000)
		} else {
			dialog.toast("保存失败", 'none', 2000);
		}
	}).submit();
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
                $("#mediaFile_s_s").val(file_list);
                $("#imageShow").html(template("imageTemplate",
                        {imageUrl:data.path, mid:data.path.replace(new RegExp("/","g"),'').replace('.','')}));
                        $('#top_img').attr('src','/upload_temp/'+data.path);
                YDUI.dialog.loading.close();
            }
        };
        YDUI.dialog.loading.open('图片上传中');
        setTimeout(function () {
            $("#mediaFileForm").ajaxSubmit(options);
        }, 1000);
    }

</script>
</body>
</html>