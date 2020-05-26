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
    <script src="${rc.contextPath}/js/address.js"></script>
    
 <script src="${rc.contextPath}/js/common.js"></script>
    <!-- 引入YDUI脚本 -->
<script type="text/javascript" language="javascript"
	src="${rc.contextPath}/js/vue.min.js"></script>

<script src="${rc.contextPath}/ydui_js/ydui.js"></script>
<script src="${rc.contextPath}/js/string.format.js"></script>
</head>
<body>
<section class="g-flexview">
    <header class="m-navbar">
      <#--  <a href="javascript:history.back();" class="navbar-item"><i class="back-ico"></i></a>-->
        <div class="navbar-center"><span class="navbar-title">我的信息修改</span></div>
    </header>

    <section class="g-scrollview" id="app">

            <form id="msgForm"  method="post" action='/user/u_edit/update'>
            <div class="m-cell" >
             
            <div class="cell-item">
            	<div class="cell-left">登录名：</div>
                <div class="cell-right "><input type="text" id="username"   name="username" class="cell-input" placeholder="" autocomplete="off" /></div>
            </div>
			<div class="cell-item">
				<div class="cell-left">真实姓名：</div>
                <div class="cell-right "><input type="text" id="legalman" name="legalman" class="cell-input" placeholder="" autocomplete="off" /></div>
            </div>

               </div>
               
                 <div class="m-cell" >
             <div class="cell-item">
            	<div class="cell-left">身份证号码：</div>
                <div class="cell-right "><input type="text" id="cards"  name="cards" class="cell-input" placeholder="" autocomplete="off" /></div>
            </div>
            
              <div class="cell-item">
            	<div class="cell-left">联系电话：</div>
                <div class="cell-right "><input type="text" id="phone"  name="phone" class="cell-input" placeholder="" autocomplete="off" /></div>
            </div>
             </div>
			   <div class="m-cell" >
			   <#--
              <div class="cell-item">
            	<div class="cell-left">所属公司：</div>
                <div class="cell-right "><input type="text" id="company" name="company" class="cell-input" placeholder="" autocomplete="off" /></div>
            </div>
            -->
			
			<div class="cell-item">
				<div class="cell-left">邮箱:</div>
                <div class="cell-right "><input type="text" id="region" name="region" class="cell-input" placeholder="" autocomplete="off" /></div>
        </div> 
        
       
        </div>
        
        </form>

            <div class="m-button" style="width: 100%;">
    			<button type="button" onclick="sub()" id="savebt" class="btn-block btn-primary">保存信息</button>
    			 
			</div>
			
			<div class="m-button" style="width: 100%;"    >
			   <input type="button" onclick="zx()"  id = "zx"   class="btn-block btn-warning" value="退出"/>
			</div>
			 
			
			 
   	</section>
</section>
<!--底部DIV -->
 <#include "/menu/foot.ftl" />
<!--底部DIV -->
<script src="${rc.contextPath}/js/jquery.form.js"></script>
<script src="${rc.contextPath}/js/preCaution.js"></script>


<script>

 var _utype ='';
    $(function(){
    var dialog = YDUI.dialog;
    
    if(true){
    	if('<@security.authentication property="principal.username" />'!= getQueryString("u")){
      $('#deleteU').show();
      }
   	 $("#username").attr("readonly","readonly");
   		  $.ajax({
                url: '/user/ajax_u/'+getQueryString("u"),
                type: 'GET',
                async : false,
                data: {
                },
                success: function (ret) {
	                if(isNotNull(ret)){
	                	//$("#id").val(ret.id);
	                	$("#region").val(ret.region);
	                	$("#company").val(ret.company);
	                	$("#phone").val(ret.phone);
	                	$("#cards").val(ret.cards);
	                	$("#legalman").val(ret.legalman);
	                	$("#username").val(ret.username);
	                	_utype = ret.utype;
	                	$('#utype').val(_utype);
	                	if(ret.companyAdminTag  == 'on'){
	                		$('#companyAdminTag').attr("checked", true);
	                	}
						var template1 = "/user/u_edit/update?id="+ret.id;
				    	$('#msgForm').attr("action",  template1);
	                }
                }
            });
    }
    
    });
 
	function sub(){
	 var dialog = YDUI.dialog;
		var num=0;
		var username = $("#username").val();
		var firstName = ($("#firstName").val());
		var password = ($("#password").val());
		var password2 = ($("#password2").val());
		var email=($("#email").val());
		var phone= ($("#phone").val());
		var roles=document.getElementsByName("roles");
		var keyId = ($("#ukey").val());
		//var roles = new Array();
		var company= ($("#company").val());
		var department= ($("#department").val());
		if(username==""){
			dialog.toast('请填写登录名', 'none', 500);
			return;
		}
		if(firstName==""){
				dialog.toast('请填写真实姓名', 'none', 500);
			return;
		}
		 
		if(email==""){
				dialog.toast('请填写身份证号码', 'none', 500);
			return;
		}
		if(phone==""){
				dialog.toast('请填写联系电话', 'none', 500);
			return;
		}
		 
		
		if(company==""){
				dialog.toast('请填写所属公司', 'none', 500);
			return;
		}
		
		$('#savebt').attr("disabled","true");
		$("#savebt").css("background-color", "#85A2AD");
		$('#msgForm').ajaxForm(function(data) {
				if(data.left){
				  dialog.toast("保存成功", 'none', 1000);
				}else {
					dialog.toast(data.errorMessage, 'none', 500);
				} 
					var uptime = window.setTimeout(function(){
					window.location.reload();
					//window.location.href="/placeUser?unit="+getQueryString("unit"),
			   	clearTimeout(uptime);
						},1500)
		}).submit();
	}
	function zx(){
		window.location.href="/logout";
	}


    function saveMsg(){
    	$('#utype').val(getQueryString("unit"));
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
            
           //window.location.href="${rc.contextPath}/placeManage";
				clearTimeout(uptime);
			}, 2000)
		} else {
			dialog.toast("保存失败", 'none', 1000);
		}
	}).submit();
    }
</script>
</body>
</html>