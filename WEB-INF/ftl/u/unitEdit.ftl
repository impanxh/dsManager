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

<!-- 引入jQuery 2.0+ -->
<script src="${rc.contextPath}/js/jquery-2.0.2.min.js"></script>
    <!-- 引入YDUI自适应解决方案类库 -->
    <script src="${rc.contextPath}/ydui_js/ydui.flexible.js"></script>
    <script src="${rc.contextPath}/js/common.js"></script>
    <script src="${rc.contextPath}/js/address.js"></script>

    <!-- 引入YDUI脚本 -->
<script type="text/javascript" language="javascript"
	src="${rc.contextPath}/js/vue.min.js"></script>

<script src="${rc.contextPath}/ydui_js/ydui.js"></script>
<script src="${rc.contextPath}/js/string.format.js"></script>
</head>
<body>
<section class="g-flexview">
    <header class="m-navbar">
        <a href="javascript:history.back();" class="navbar-item"><i class="back-ico"></i></a>
        <div class="navbar-center"><span class="navbar-title">基本信息录入</span></div>
    </header>

    <section class="g-scrollview" id="app">
        
        	<form id="msgForm"  method="post">
            <div class="m-cell">
            <div class="cell-item">
            	<div class="cell-left">行业类型：</div>
                <label class="cell-right ">
                    <select class="cell-select" id="hyType_s" name="hyType_s">
                        <option :value="details.s_Map.hyType_s" > {{details.s_Map.hyid_s}}</option>
                    	<option value="">请选择行业类型</option>
                        <option v-for="w in datas" :value="w.id" > {{w.s_Map.name_s}}</option>
                    </select>
                </label>
            </div>

            <div class="cell-item">
            	<div class="cell-left">辖区：</div>
                <label class="cell-right ">
                	 <select class="cell-select" id="hySort_s" name="hySort_s"> 
                        <option :value="details.s_Map.hySort_s" > {{details.s_Map.regionid_s}}</option>
                	 	<option value="">请选择辖区</option>
                	 	<option v-for="v in region"  :value="v.id" >{{v.s_Map.name_s}}</option>
    			</select> 				

                </label>
            </div>
            <div class="cell-item">
            	<div class="cell-left">公安编号：</div>
                <div class="cell-right "><input type="text" :value="details.s_Map.policeId_s" id="policeId_s" name="policeId_s" class="cell-input" placeholder="" autocomplete="off" /></div>
            </div>
            </div>

            <div class="m-cell">
			<div class="cell-item">
				<div class="cell-left">单位名称：</div>
                <div class="cell-right "><input type="text" :value="details.s_Map.unitName_s" name="unitName_s" class="cell-input" placeholder="" autocomplete="off" /></div>
            </div>

            <div class="cell-item">
            	<div class="cell-left">单位地址：</div>
                <div class="cell-right "><input type="text" :value="details.s_Map.unitAdd_s" name="unitAdd_s" class="cell-input" placeholder="" autocomplete="off" /></div>
            </div>

            <div class="cell-item">
            	<div class="cell-left">单位基本信息：</div>
                <div class="cell-right">
                    <textarea class="cell-textarea" :value="details.s_Map.basicInfo_s" placeholder="" name="basicInfo_s"></textarea>
                </div>
            </div>
			<div class="cell-item">
				<div class="cell-left">联系电话：</div>
                <div class="cell-right "><input type="text" :value="details.i_Map.tleNo_i" name="tleNo_i" class="cell-input" placeholder="" autocomplete="off" /></div>
            </div>
            </div>
            <div class="m-cell">
            <div class="cell-item">
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
            </div>
            </div>
        </form>

            <div class="m-button" style="width: 100%;">
    			<button type="button" onclick="saveMsg()" id="savebt" class="btn-block btn-primary">重新录入信息</button>
			</div>
   	</section>
</section>
<script src="${rc.contextPath}/js/jquery.form.js"></script>
<script src="${rc.contextPath}/js/preCaution.js"></script>
<!-- 引入city包 -->
<script src="${rc.contextPath}/ydui_js/ydui.citys.js"></script>



 




<script>
var dialog = YDUI.dialog;
var path = 'http://'+changeAddr()+'/common/saveModel?className=';
var placeId = getQueryString("placeId");
var baseMap ; 
    	var modVue = new Vue({
            el: '#app',
                data: {
                    datas: {},
                    region:{},
                    details:{}
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
                                _self.datas = (data.content);
                            }
                        });
                        
                         $.ajax({
                            type: 'GET',
                            url: baseUrl+'region',
                            success:function(data) {
                                _self.region = (data.content); 
                            }
                        });
                    },

                    showDetails: function (placeId) {
                        var _self2 = this;
                        $.ajax({
                            type: 'GET',
                            url: "http://" + changeAddr() + "/common/queryById?className=Unit&id=" + placeId,
                            success:function(data) {
                            	console.log(data.s_Map);
                            	baseMap =data.s_Map;
                                _self2.details = (data);
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
			// $('#savebt').attr("disabled","true");
			// $("#savebt").css("background-color", "#85A2AD");
			dialog.toast("保存成功", 'none', 2000);
			var uptime = window.setTimeout(function() {
                javascript:history.back();
				clearTimeout(uptime);
			}, 2000)
		} else {
			dialog.toast("保存失败", 'none', 2000);
		}
	}).submit();
    }
</script>
</body>
</html>