<#assign security=JspTaglibs["/WEB-INF/tlds/security.tld"] />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <title>单位信息录入</title>
    <meta content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0" name="viewport" />
    <meta content="yes" name="apple-mobile-web-app-capable" />
    <meta content="black" name="apple-mobile-web-app-status-bar-style" />
    <meta content="telephone=no" name="format-detection" />
    <!-- 引入YDUI样式 -->
    <link rel="stylesheet" href="${rc.contextPath}/ydui_css/ydui.css" />
    <link rel="stylesheet" href="${rc.contextPath}/css/demo.css" />
    <!-- 引入YDUI自适应解决方案类库 -->
    <script src="${rc.contextPath}/ydui_js/ydui.flexible.js"></script>
    <script src="${rc.contextPath}/js/common.js"></script>
</head>
<body>
<section class="g-flexview">
    <header class="m-navbar">
        <a href="javascript:history.back();" class="navbar-item"><i class="back-ico"></i></a>
        <div class="navbar-center"><span class="navbar-title">基本信息录入</span></div>
    </header>

    <section class="g-scrollview" id="app">


            <div class="m-cell" >
                <div class="cell-item">
                    <div class="cell-right ">
                        <div style="display:block;float:left;">
                            <article class="m-list list-theme1" id ="imageShow">
                            </article>
                            <script id="imageTemplate" type="text/html">
                                <div>
                                    <a href="javascript:void(0);" class="list-item" style="width:90%">
                                        <div class="list-img">
                                            <img id="top_img" src="/upload_temp/" />
                                        </div>
                                    </a>
                                </div>
                            </script>
                            <br><br>
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

            <form id="msgForm"  method="post" action=''>
                <input type="hidden" id="mediaFile_s_s" name="mediaFile_s">
            <div class="m-cell" >
            <div class="cell-item">
            	<div class="cell-left">行业类型：</div>
                <label class="cell-right ">
                    <select class="cell-select" id="hyType_s" name="hyType_s">
                    	<#--<option value="">请选择行业类型</option>-->
                        <option v-for="w in datas" :value="w.id" > {{w.s_Map.name_s}}</option>
                    </select>
                </label>
            </div>

            <div class="cell-item">
            	<div class="cell-left">所属派出区：</div>
                <label class="cell-right ">
                	 <select class="cell-select" id="hySort_s" name="hySort_s"> 
                	 	<option value="">请选择辖区</option>
                	 	<option v-for="v in region"  :value="v.id" >{{v.s_Map.name_s}}</option>
    			</select> 			
               
                </label>
            </div>
            <#--
            <div class="cell-item">
            	<div class="cell-left">公安编号：</div>
                <div class="cell-right "><input type="text" id="policeId_s" name="policeId_s" class="cell-input" placeholder="" autocomplete="off" /></div>
            </div>
            -->
            </div>
        <div class="m-cell">
			<div class="cell-item">
				<div class="cell-left">单位名称：</div>
                <div class="cell-right "><input type="text" name="unitName_s" class="cell-input" placeholder="" autocomplete="off" /></div>
            </div>

            <div class="cell-item">
            	<div class="cell-left">单位地址：</div>
                <div class="cell-right "><input type="text" name="unitAdd_s" class="cell-input" placeholder="" autocomplete="off" /></div>
            </div>

            <div class="cell-item">
            	<div class="cell-left">单位基本信息：</div>
                <div class="cell-right">
                    <textarea class="cell-textarea" placeholder="" name="basicInfo_s"></textarea>
                </div>
            </div>
			<div class="cell-item">
				<div class="cell-left">联系电话：</div>
                <div class="cell-right "><input type="text" name="tleNo_i" class="cell-input" placeholder="" autocomplete="off" /></div>
            </div>
        </div>
        <div class="m-cell">
            <div class="cell-item">
                <div class="cell-left">单位人员信息：</div>
                <div class="cell-right "><input type="text" name="unitNum_s" class="cell-input" placeholder="" autocomplete="off" /></div>
            </div>
        </div>
        <input type="hidden" id="code_s" name="code_s"   />
         <input type="hidden" id="uniqId_s" name="uniqId_s"   />
        </form>

            <div class="m-button" style="width: 100%;">
    			<button type="button" onclick="saveMsg()" id="savebt" class="btn-block btn-primary">保存信息</button>
			</div>
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
<script src="${rc.contextPath}/ydui_js/template.js"></script>
<script src="${rc.contextPath}/js/vue.min.js"></script>
<script src="${rc.contextPath}/js/preCaution.js"></script>
<script src="${rc.contextPath}/js/address.js"></script>
<script src="${rc.contextPath}/js/string.format.js"></script>


<script>


    	var modVue = new Vue({
            el: '#app',
                data: {
                    datas: {},
                    region:{},
                    details:{}
                },
                methods: {
                    showData: function () {
                    
                     var s = queryUserGroup('<@security.authentication property="principal.username" />');
                        console.log(s);
                        
                        
                        var _self = this;
                        var baseUrl = 'http://'+changeAddr()+'/common/getModelList?filter[className]=industry&filter[type_s_s]=';
                        $.ajax({
                            type: 'GET',
                            
                            url: baseUrl+'industry&filter[id]='+getQueryString("industry") ,
                            success:function(data) {
                            	console.log(data.content);
                                _self.datas = (data.content);
                            }
                        });
                        
                         $.ajax({
                            type: 'GET',
                            url: baseUrl+'region&filter[code_s_s_EQ]='+(isNotNull(s)?s[2]:''),
                            success:function(data) {
                                _self.region = (data.content); 
                            }
                        });
                    }

                }
        })

    $(function(){
    var dialog = YDUI.dialog;
    	var path = 'http://'+changeAddr()+'/common/saveModel?className=';

    		$('#msgForm').attr("action", path+'Unit&checkUniq=N');
    		modVue.showData();
    });
	
    function saveMsg(){
    	var uniqId_s =  getUnid();
    	 $('#uniqId_s').val(uniqId_s);
        var dialog = YDUI.dialog;
    	var _action = $('#msgForm').attr("action");
    	var checkText=$("#hyType_s").find("option:selected").text();
		var sort_s=$("#hySort_s").find("option:selected").text();
		var template1 = "&hyid_s={0}&regionid_s={1}";
		var p = template1.format(checkText,sort_s);
    	
    	$('#msgForm').attr("action", _action + p);
    	console.log($('#msgForm').attr("action"));
    	
    	
    	$('#msgForm').ajaxForm(function(data) {
		if (data.status == 200) {
			$('#savebt').attr("disabled","true");
			$("#savebt").css("background-color", "#85A2AD");
			var uptime = window.setTimeout(function() {
            dialog.toast("保存成功", 'none', 1000);
            window.location.href="${rc.contextPath}/placeManage?unit="+getQueryString("industry");
				clearTimeout(uptime);
			}, 2000)
		} else {
			dialog.toast("保存失败", 'none', 1000);
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