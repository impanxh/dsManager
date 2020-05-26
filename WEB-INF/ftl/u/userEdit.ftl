<#import "../template/template.ftl" as frame> <#global menu="用户详情编辑">
<@frame.html title="用户详情编辑" js=["js/jquery-ui/jquery-ui.js",
"js/datepicker.js", "js/jquery.datepicker.region.cn.js", "js/ukey.js",
"js/ukey-keyid.js"]
css=["js/jquery-ui/jquery-ui.css"]>
<link rel="stylesheet" href="/js/zTree/css/zTreeStyle/zTreeStyle.css" type="text/css">
	<script type="text/javascript" src="/js/zTree/js/jquery.ztree.core-3.5.js"></script>
	<script type="text/javascript" src="/js/zTree/js/jquery.ztree.excheck-3.5.js"></script>
	<script type="text/javascript" src="/js/zTree/js/jquery.ztree.exhide-3.5.js"></script>
	<script type="text/javascript" src="/js/zTree/e.js"></script>
<script type="text/javascript">
function go_back(){
	history.go(-1);
}
	i = 2;
	j = 2;
	$(document).ready(function() {
		$("#btn_add2").click(function() {
			$("#newUpload2").append('<div id="div_'+j+'"><input  name="file_'+j+'" type="file"  style="margin-top:10px;"/>' +
					'<input type="button" value="删除" style="margin-top:10px;" onclick="del_2(' + j + ')"/></div>');
			j = j + 1;
		});

	});

	function refreshUKey() {
        loadUKeyInfoFromUKey();
	}

	function del_2(o) {
		document.getElementById("newUpload2").removeChild(
				document.getElementById("div_" + o));
	}


	function sub(){
		var num=0;
		var username = ($("#name").val());
		var firstName = ($("#firstName").val());
		var email=($("#email").val());
		var phone= ($("#phone").val());
		var roles=document.getElementsByName("roles");
		var company= ($("#company").val());
		var department= ($("#department").val());
		var keyId = ($("#ukey").val());
		if(firstName==""){
			jDialog.Alert("请填写真实姓名");
			return;
		}
		 

		if(company==""){
			//jDialog.Alert("请填写所属公司");
			//return;
		}
		if(department==""){
			//jDialog.Alert("请填写行业类型");
			//return;
		}
		/**
		var t  = c2();
  		if(!t){
  		   return ;
  		}**/


		$('#userForm2').ajaxForm(function(data) {
						if(data.left==true){
						    writeUKey(username, "", keyId);
					jDialog.Alert("保存成功");
					c2();
				}else {
					jDialog.Alert(data.right);
				}
			    var uptime = window.setTimeout(function(){
					window.location.href="${rc.contextPath}/user/bodyuserlist?subUType=0",

			   	clearTimeout(uptime);
						},2000)
		}).submit();
	}
function go_back(){
	history.go(-1);
}
</script>

<div class="withdraw-wrap color-white-bg fn-clear">

	<form data-name="withdraw" name="userForm2" id="userForm2"
		class="ui-form" method="post" action="update"
		enctype="multipart/form-data">
		<div class="withdraw-title fn-clear">
			<span>用户信息编辑</span> <a class="block-btn" style="margin-top: -5px;"
				href="javascript:void(0);" onclick="go_back()">返回</a>
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
					<label class="ui-label mt10">登录名:</label> <input
						readonly="readonly" class="ui-input" type="text" name="username"
						id="name" data-is="isAmount isEnough" autocomplete="off"
						disableautocomplete="" value="${userDetail.username!''}">


				</div>
				<p class="ui-term-placeholder"></p>
				<div class="ui-form-item">
					<label class="ui-label mt10"><span class="ui-form-required">*</span>真实姓名:</label>
					<input class="ui-input" type="text" name="legalman" id="firstName"
						data-is="isAmount isEnough" autocomplete="off"
						disableautocomplete="" value="${userDetail.legalman!''}">
				</div>



				<div class="ui-form-item">
					<label class="ui-label mt10"><span class="ui-form-required"></span>身份证号码:</label>
					<input class="ui-input" type="text" name="cards" id="email"
						data-is="isAmount isEnough" autocomplete="off"
						disableautocomplete="" value="${userDetail.cards!''}">
				</div>

				<div class="ui-form-item">
					<label class="ui-label mt10"><span class="ui-form-required"></span>联系电话:</label>
					<input class="ui-input validate[required,custom[phone]]"
						type="text" name="phone" id="phone" data-is="isAmount isEnough"
						autocomplete="off" disableautocomplete=""
						value="${userDetail.phone!''}">
				</div>
				<input type="hidden" name="ustats" value="${userDetail.ustats!''}">

				<!--
				<div class="ui-form-item">
					<label class="ui-label mt10"><span class="ui-form-required">*</span>所属组:</label>


					  <#if groupsList?exists>
					   <#list groupsList?keys as vkey> <input type="checkbox" value="${vkey}"
						name="roles"<#if uGroup?seq_contains(vkey)>checked </#if>
					   /> ${groupsList[vkey]}&nbsp;&nbsp; <#if vkey_index % 4 == 0 &&
					   vkey_index!=0><br></#if>
					  </#list>
					  </#if>

				</div>
				-->
				<div class="ui-form-item">
					<label class="ui-label mt10"> 人员描述:</label>
					<input class="ui-input" type="text" name="company" id="company"
						data-is="isAmount isEnough" autocomplete="off"
						disableautocomplete="" value="${userDetail.company!''}">
				</div>

	<!--
				<div class="ui-form-item">
					<label class="ui-label mt10"><span class="ui-form-required">*</span>行业类型:</label>
					<input class="ui-input" type="text" name="industry"
						id="department" data-is="isAmount isEnough" autocomplete="off"
						disableautocomplete="" value="${userDetail.industry!''}">
				</div>
				-->
				<div class="ui-form-item">
					<label class="ui-label mt10"> 邮箱:</label>
					<input class="ui-input" type="text" name="region"
						id="region" data-is="isAmount isEnough" autocomplete="off"
						disableautocomplete="" value="${userDetail.region!''}">
				</div>
				<!--
				<div class="ui-form-item">
					<label class="ui-label mt10"><span class="ui-form-required">*</span>账户类型:</label>
					<input class="ui-input" type="text" name="utype"
						id="utype" data-is="isAmount isEnough" autocomplete="off"
						disableautocomplete="" value="${userDetail.utype!''}">
				</div>
				-->

				<div class="ui-form-item" >
					<label class="ui-label mt10"><span class="ui-form-required">*</span>选择权限:</label>

 
					
					<span class="role-list">
						 <span id="c2" >   <div style="width:100px;float: left;"><input
							type="checkbox" value="source" name="roles" id="roles"   <#if userDetail.utype?contains("source")> checked=checked   </#if> />资源管理 
							 </div> 
							 <div style="width:100px;float: left;"><input
							type="checkbox" value="contract" name="roles" id="roles"  <#if userDetail.utype?contains("contract")> checked=checked   </#if> />合同管理
							</div> 
							 <div style="width:100px;float: left;"><input
							type="checkbox" value="sys_userList" name="roles" id="roles" <#if userDetail.utype?contains("sys_userList")> checked=checked   </#if>  /> 用户管理
							</div>  
							</span>
					</span>





				</div>

				<#--

				<div class="ui-form-item" id = "roleOPer">
					<label class="ui-label mt10"><span class="ui-form-required">*</span>辖区选择:</label>
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


			</div>
			<div class="ui-form-item widthdrawBtBox" style="padding:0px;">
				<input type="button" id="subWithdraw" class="block-btn"
					onclick="sub();" value="确认修改">


			</div>
			<div class="worm-tips">
				<div class="tips-title">
					<span class="icon"></span> 温馨提示
				</div>
				<ol>
					<li>1.请输入正确的邮箱地址及联系电话。</li>
					<li>2.如果您填写的信息不正确可能会导致后续操作失败。</li>
					<li>3.平台禁止洗钱、信用卡套现、虚假交易等行为，一经发现并确认，将终止该账户的使用。</li>
				</ol>
			</div>
	</form>
</div>
</@frame.html>
