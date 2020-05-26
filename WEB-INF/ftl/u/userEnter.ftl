<#import "../template/template.ftl" as frame>
<#if subUType = 0><#global _sT="车身用户列表"><#else><#global _sT="上下刊用户列表"> </#if>


<#global menu="${_sT}">
<@frame.html title="${_sT}_用户添加" js=["js/jquery-ui/jquery-ui.js",
"js/datepicker.js", "js/jquery.datepicker.region.cn.js", "js/ukey.js",
"js/ukey-keyid.js"]
css=["js/jquery-ui/jquery-ui.css"]>
<link rel="stylesheet" href="/js/zTree/css/zTreeStyle/zTreeStyle.css" type="text/css">
	<script type="text/javascript" src="/js/zTree/js/jquery.ztree.core-3.5.js"></script>
	<script type="text/javascript" src="/js/zTree/js/jquery.ztree.excheck-3.5.js"></script>
	<script type="text/javascript" src="/js/zTree/js/jquery.ztree.exhide-3.5.js"></script>
	<script type="text/javascript" src="/js/zTree/f.js"></script>

<script type="text/javascript">
function go_back(){
	history.go(-1);
}
    $(document).ready(function() {
        $("#userForm2").validationEngine({
            validationEventTrigger:"blur",  //触发的事件  validationEventTriggers:"keyup blur",
            inlineValidation: true,//是否即时验证，false为提交表单时验证,默认true
            success :  false,//为true时即使有不符合的也提交表单,false表示只有全部通过验证了才能提交表单,默认false
            promptPosition: "centerRight",//提示所在的位置，topLeft, topRight, bottomLeft,  centerRight, bottomRight
            showOneMessage: true,
            maxErrorsPerField: 1,
            //failure : function() { alert("验证失败，请检查。");  }//验证失败时调用的函数
            //success : function() { callSuccessFunction() },//验证通过时调用的函数
        });

        $('.c').click(function() {
            var w = $(this).val();
            if(w=='screen'){
            	$("#c1").show();
            	$("#c2").hide();
            	$("#utype").val("screen")
            }else if(w=='admin') {
            	$("#c2").show();
            	$("#c1").hide();
            	$("#utype").val("admin")
            }
        });


    });

	function refreshUKey() {
        loadUKeyInfoFromUKey();
	}
</script>

<script type="text/javascript">
	i = 2;
	j = 2;
	$(document)
			.ready(
					function() {

						$("#btn_add2")
								.click(
										function() {
											$("#newUpload2")
													.append(
															'<div id="div_'+j+'"><input  name="file_'+j+'" type="file"  style="margin-top:10px;"/><input type="button" value="删除" style="margin-top:10px;" onclick="del_2('
																	+ j
																	+ ')"/></div>');
											j = j + 1;
										});

					});

	function del_2(o) {
		document.getElementById("newUpload2").removeChild(
				document.getElementById("div_" + o));
	}


	function sub(){
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
			jDialog.Alert("请填写登录名");
			return;
		}
		if(firstName==""){
			jDialog.Alert("请填写真实姓名");
			return;
		}
		if(password==""){
			jDialog.Alert("密码不能为空");
			return;
		}
		if(! (password == password2 )){
			jDialog.Alert("两次输入密码需一致");
			return;
		}
		 
		for(var i=0;i<roles.length;i++)
 		{
 			if(roles[i].checked)
  			num++;
  			else
  			num=num;
  		}
 		if(num<=0){
  			//jDialog.Alert("请选择至少一个角色");
  			//return;
  		}
  		/**
  		var t  = c2();
  		if(!t){
  		   return ;
  		}*/

		if(company==""){
			//jDialog.Alert("请填写所属公司");
			//return;
		}
		if(department==""){
		//	jDialog.Alert("请填写行业类型");
			//return;
		}
		$('#userForm2').ajaxForm(function(data) {
				if(data.error ==1){
                    writeUKey(username, "", keyId);
					jDialog.Alert("用户添加成功");

				}else {
					jDialog.Alert(data.errorMessage);
				}

					var uptime = window.setTimeout(function(){
					window.location.href="${rc.contextPath}/user/bodyuserlist?subUType=0",
			   	clearTimeout(uptime);
						},2000)
		}).submit();
	}
</script>

<div class="withdraw-wrap color-white-bg fn-clear">

	<form data-name="withdraw" name="userForm2" id="userForm2"
		class="ui-form" method="post" action="save"
		enctype="multipart/form-data">
		<div class="withdraw-title fn-clear">
			<span>用户添加信息录入</span> <input type="hidden" name="utype" id="utype"
				value="admin">
				 <input type="hidden" name="subUtype" id="utype"
				value="${subUType}">
				<a class="block-btn"
				style="margin-top: -5px;" href="javascript:void(0);"
				onclick="go_back()">返回</a>
			<!--
            <ul class="fn-clear">
              <li class="first"><a class="addBank fn-right" href="/account/userBank!toAdd.action">xxxx</a></li>
              <li><a class="mgmtBank fn-right" id="mgmtBank" href="/account/info!bank.action">xxxx</a></li>
            </ul>
            -->
		</div>
		<div class="withdrawInputs">
			<div class="inputs">

				<div class="ui-form-item">
					<label class="ui-label mt10"><span class="ui-form-required">*</span>登录名:</label>
					<input
						class="ui-input validate[required,custom[noSpecialLetterChinese],ajax[ajaxUserCall]]"
						type="text" name="username" id="username"
						data-is="isAmount isEnough" autocomplete="off"
						disableautocomplete="" placeholder="6-12位中英文、数字、下划线">


				</div>
				<p class="ui-term-placeholder"></p>
				<div class="ui-form-item">
					<label class="ui-label mt10"><span class="ui-form-required">*</span>真实姓名:</label>
					<input
						class="ui-input  validate[required,custom[chinese],minSize[2],maxSize[12],ajax[ajaxUserCall]]"
						type="text" name="legalman" id="firstName"
						data-is="isAmount isEnough" autocomplete="off"
						disableautocomplete="" placeholder="2-12位中英文">
				</div>

				<div class="ui-form-item">
					<label class="ui-label mt10"><span class="ui-form-required">*</span>密码:</label>
					<input class="ui-input validate[required,minSize[6],maxSize[20]]"
						type="password" name="password" id="password"
						data-is="isAmount isEnough" autocomplete="off"
						disableautocomplete="" placeholder="请输入6-20位密码">
				</div>

				<div class="ui-form-item">
					<label class="ui-label mt10"><span class="ui-form-required">*</span>请确认密码:</label>
					<input class="ui-input validate[required,equals[password]]"
						type="password" data-is="isAmount isEnough" type="text"
						name="password2" id="password2" data-is="isAmount isEnough"
						autocomplete="off" disableautocomplete="" placeholder="请再输入一次密码">
				</div>

				<div class="ui-form-item">
					<label class="ui-label mt10"><span class="ui-form-required"></span>身份证号码:</label>
					<input class="ui-input "
						type="text" name="cards" id="email" data-is="isAmount isEnough"
						autocomplete="off" disableautocomplete="" placeholder="请输入身份证号码">
				</div>

				<div class="ui-form-item">
					<label class="ui-label mt10"><span class="ui-form-required"></span>联系电话:</label>
					<input class="ui-input validate[custom[phone]]"
						type="text" name="phone" id="phone" data-is="isAmount isEnough"
						autocomplete="off" disableautocomplete="" placeholder="请输入联系电话">
				</div>
				<!--
				<div class="ui-form-item">
					<label class="ui-label mt10"><span class="ui-form-required">*</span>
						角色选择: </label>
					<div>

						<span id="c1"> <#if groupsList?exists> <#list
							groupsList?keys as vkey> <input type="checkbox" value="${vkey}"
							name="roles" id="roles" />${groupsList[vkey]} &nbsp;&nbsp; <#if
							vkey_index % 4 == 0 && vkey_index!=0> <br> </#if> </#list>
							</#if>
						</span>
					</div>
				</div>
				-->
				<div class="ui-form-item">
					<label class="ui-label mt10"> 人员描述:</label>
					<input class="ui-input  " type="text"
						name="company" id="company" data-is="isAmount isEnough"
						autocomplete="off" disableautocomplete="" placeholder="请输入人员描述">
				</div>
				<!--
				<div class="ui-form-item">
					<label class="ui-label mt10"><span class="ui-form-required">*</span>行业类型:</label>
					<input class="ui-input validate[required]" type="text"
						name="industry" id="department" data-is="isAmount isEnough"
						autocomplete="off" disableautocomplete="" placeholder="行业类型（学校、医院）">
				</div>-->

				<div class="ui-form-item">
					<label class="ui-label mt10"> 邮箱:</label>
					<input class="ui-input  " type="text"
						name="region" id="region" data-is="isAmount isEnough"
						autocomplete="off" disableautocomplete="" placeholder="邮箱">
				</div>


				<div class="ui-form-item" >
					<label class="ui-label mt10"><span class="ui-form-required">*</span>权限选择:</label>


					<span class="role-list">
						 <span id="c2" >   <div style="width:100px;float: left;"><input
							type="checkbox" value="source" name="roles" id="roles" />资源管理
							 </div> 
							 <div style="width:100px;float: left;"><input
							type="checkbox" value="contract" name="roles" id="roles" />合同管理
							</div> 
							 <div style="width:100px;float: left;"><input
							type="checkbox" value="sys_userList" name="roles" id="roles" /> 用户管理
							</div>  
							</span>
					</span>




				</div>

				<!--

				<div class="ui-form-item" id = "roleOPer">
					<label class="ui-label mt10"><span class="ui-form-required">*</span>省份选择:</label>
					<div class="zTreeDemoBackground left">
						<ul id="treeDemo" class="ztree"></ul>
						</div>
				</div>


				<div class="ui-form-item" id = "c2ALDiv">
				<input type="checkbox" id="c2AL" />全选<br>
					<label class="ui-label mt10"><span class="ui-form-required">*</span>
						行业选择: </label>
					<div>
						<span id="c2">
						</span>
					</div>
				</div>
				-->


				<!--
				<div class="ui-form-item">
					<label class="ui-label mt10"><span class="ui-form-required">*</span>账户类型:</label>
					<input class="ui-input validate[required]" type="text"
						name="utype" id="utype" data-is="isAmount isEnough"
						autocomplete="off" disableautocomplete="" placeholder="账户类型">
				</div>
				-->
			</div>
			<div class="ui-form-item widthdrawBtBox">
				<input type="button" id="subWithdraw" class="block-btn"
					onclick="sub();" value="创建用户">
			</div>
		</div>
		<div class="worm-tips">
			<div class="tips-title">
				<span class="icon"></span> 温馨提示
			</div>
			<ol>
				<li>1.请输入正确的姓名、电话及公司信息。</li>
				<li>2.请赋予相应的员工权限。</li>
			</ol>
		</div>
	</form>
</div>

</@frame.html>
