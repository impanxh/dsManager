<#import "../template/template.ftl" as frame> <#global menu="角色管理">
<@frame.html title="编辑角色" js=["js/jquery-ui/jquery-ui.js",
"js/jquery-ui/jquery-ui.auto.complete.js","js/datepicker.js",
"js/jquery.datepicker.region.cn.js","js/progressbar.js","js/rolecommon.js"]
css=["js/jquery-ui/jquery-ui.css","css/uploadprogess.css","css/jquery-ui-1.8.16.custom.css","js/jquery-ui/jquery-ui.auto.complete.css","css/autocomplete.css"]>

<script type="text/javascript">
function go_back(){
	history.go(-1);
}
	$(document).ready(function() {
	$("#checkAll").click(function(){
	 	 if(this.checked){
           $("#list :checkbox").prop("checked", true);
         }else{
            $("#list :checkbox").prop("checked", false);
         }
	 
	
		<#--
         if($(this).attr("checked")=="checked"){
            $("input[name='checkone']:checkbox").attr("checked",true);
         }else{
            $("input[name='checkone']:checkbox").attr("checked",false);
         }
         -->
       });
        loadsch();
        addfunction();
         $("#c2AL").click(function(){
			         if(this.checked){
		           $("#c2ALDiv :checkbox").prop("checked", true);
		         }else{
		            $("#c2ALDiv :checkbox").prop("checked", false);
		         }
	       });
	       
        
	});
	
	function addfunction(){
				 $.ajax({
		    			url:'http://'+changeAddr()+'/common/getModelList?filter[className]=industry&filter[type_s_s]=region&length=1000&order[0][code_s_s]=asc',
		    			type:"GET",
		    			async:false,
		    			dataType:"json",
		    			success:function(data){
		    				var f='';
		    				   $.each( data.content, function(index, data)
							  {   index++;
							 	 var template1 ='<input type="checkbox" value="{0}" name="region" id="region" />{1} &nbsp;&nbsp; ';
								  f+=  template1.format(data.id,data.s_Map.name_s);
								  if (index %3 == 0 && index!=0){
								     f+='<br>';
								  }
							  });
							  $("#c1").html(f);
		    			}
		       });  
		       
		        $.ajax({
		    			url:'http://'+changeAddr()+'/common/getModelList?filter[className]=industry&filter[type_s_s]=industry&length=100',
		    			type:"GET",
		    			async:false,
		    			dataType:"json",
		    			success:function(data){
		    				var f='';
		    				   $.each( data.content, function(index, data)
							  {  index++;
							 	 var template1 ='<input type="checkbox" value="{0}" name="industry" id="region" />{1} &nbsp;&nbsp; ';
								  f+=  template1.format(data.id,data.s_Map.name_s);
								  if (index %5 == 0 && index!=0){
								     f+='<br>';
								  }
							  });
							  $("#c2").html(f);
		    			}
		       }); 
		        var funcode=$("#funcode").val().replace("bd_2_", "");
		       var obj = queryForObject({"filter[gid_s_s_EQ]":funcode},'role_config');
		       if(isNotNull(obj)){
			       	if(isNotNull(obj.s_Map)&& isNotNull(obj.s_Map.region_s)){
			       	var arr1 = obj.s_Map.region_s.split(",");
				          $("[name='region']").each(function(){     
				           var id = $(this).attr("value") ;
						     if($.inArray(id, arr1)!=-1  )     
						   {     
						          $(this).attr("checked",'true');   
						   }   
						   });  
			       	}
			       	if(isNotNull(obj.s_Map)&& isNotNull(obj.s_Map.schId_s)){
			       	 $("#sch_id").val(obj.s_Map.schId_s);
			       	 }
			       	if(isNotNull(obj.s_Map)&& isNotNull(obj.s_Map.industry_s)){
			       	var arr1 = obj.s_Map.industry_s.split(",");
				          $("[name='industry']").each(function(){     
				           var id = $(this).attr("value") ;
						     if($.inArray(id, arr1)!=-1  )     
						   {     
						          $(this).attr("checked",'true');   
						   }   
						   });  
			       	}
		       }
		       
		       
	}
	
	

	function sub(){
		if (!$("#userForm2").validationEngine('validateBeforeSubmit'))
            return;
		 var rolename=$("#name").val();
		 var funcode=$("#funcode").val();
		 var fundesc=$("#fundesc").val();
        	var o = document.getElementsByName("checkone");
        	var dIds='';
        	for(var i=0;i<o.length;i++){
                if(o[i].checked)
                dIds+=o[i].value+',';   
           }
           if(dIds==""){
        	   layer.msg("请选择权限");
        	   return false;
           }
   		var param={"ids":dIds,"rolename":rolename,"funcode":funcode,"fundesc":fundesc};
		layer.confirm('确定修改吗？', {icon: 3}, function(index){
    		layer.close(index);
		    if(true){
		    	 $.ajax({
		    			url:"${rc.contextPath}/user/editRole/${actIdGroup.id!''}",
		    			type:"POST",
		    			async:false,
		    			dataType:"json",
		    			data:param,
		    			success:function(data){
		    			if (data.left == true) {
		    			
		    			var region=[],industry=[];
		    				$("input[name='region']:checkbox:checked").each(function(){ 
								region.push($(this).val()); 
							}) 
							$("input[name='industry']:checkbox:checked").each(function(){ 
								industry.push($(this).val()); 
							}) 
		    				var _region = region.join(",");
		    				var _industry = industry.join(",");
		    				console.log("_region:"+_region);
		    				console.log("_industry:"+_industry);
		    				
							  var settings = {
					        "async" : false,
					        "crossDomain" : true,
					        "url" : "http://" + changeAddr() + "/common/delByField?className=role_config"   ,
					        "method" : "GET",
					        "data" : {'dByField':'gid_s_s','value':funcode}
					    }
					    $.ajax(settings).done(function(response) {
					    	console.log(response);
				    		var postData={"schId_s": $("#sch_id").val(),"region_s":_region,"industry_s":_industry,"gid_s":funcode,"checkUniq":'N'};
			 				saveDataModel(postData,"role_config");
					    });
					    
					    <!-- -->
		    					layer.msg(data.right);
		    					var uptime = window.setTimeout(function(){
		    						 <#if actIdGroup.rev = 3> 
					window.location.href="${rc.contextPath}/user/role_list";
					<#else>window.location.href="${rc.contextPath}/user/skrole_list"; </#if> 
			   	clearTimeout(uptime);
						},2000)
		    					
		    				} else {
		    					layer.msg(data.right,{icon: 5});
		    				}
		    			}
		       });  
		       }
		});		
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
			<span>编辑角色</span> <a class="block-btn" style="margin-top: -5px;"
				href="javascript:void(0);" onclick="go_back()">返回</a>
		</div>
		<div class="withdrawInputs">
			<div class="inputs">

				<div class="ui-form-item">
					<label class="ui-label mt10"><span class="ui-form-required">*</span>角色名称:</label>
					<input class="ui-input validate[required]" type="text" id="name"
						value="${actIdGroup.name!''}" data-is="isAmount isEnough"
						autocomplete="off" disableautocomplete="" value="">

				</div>
				<div class="ui-form-item">
					<label class="ui-label mt10"><span class="ui-form-required">*</span>辖区简码:</label>
					<input class="ui-input validate[required]" type="text" id="funcode"
						readonly="readonly" value="${showId!''}"
						data-is="isAmount isEnough" autocomplete="off"
						disableautocomplete="" value="" readonly>
				</div>
				
				
				<div class="ui-form-item">
					<label class="ui-label mt10"><span class="ui-form-required">*</span>
						派出所选择: </label>
					<div>
					 
						<span id="c1">   
						</span>
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
				
				<#--
				<div class="ui-form-item">
					<label class="ui-label mt10"><span class="ui-form-required">*</span>
						学校选择: </label>
					<div>
						<span id="c3">  
						</span>
					</div>
				</div>
				-->
				
				
				<div class="ui-form-item"  >
					<label class="ui-label mt10"><span class="ui-form-required">*</span>权限:</label>
					<input type="checkbox" id="checkAll" />全选<br>
					<div class="recommand timer">
						<div class="re-box2 clearfix" id = "list">
							<#if functions?exists>							
							
							
							<div class="select-items clearfix">
								<font color="red"> 资源管理</font>&nbsp;<br> <#list functions
								as item> <#if item.funcode?index_of("res")!=-1> <input
									type="checkbox" value="${item.id}" name="checkone"<#if
								funcIDList?seq_contains(item.id)>checked </#if>/>${item.name} <br>
								</#if> </#list> <br>
							</div>
							 
							 
							<div class="select-items clearfix">
								<font color="red">用户角色管理</font>&nbsp;<br> <#list functions
								as item> <#if item.funcode?index_of("sys_userList")!=-1 ||
								item.funcode?index_of("body_roleManager")!=-1 ||
								item.funcode?index_of("sk_roleManager")!=-1> <input
									type="checkbox" value="${item.id}" name="checkone"<#if
								funcIDList?seq_contains(item.id)>checked </#if> />${item.name} <br>
								</#if> </#list> <br>  
							</div>
							 
						</div>
					</div>

					</#if>
				</div>
			</div>

			<div class="ui-form-item widthdrawBtBox">
				<input type="button" id="subWithdraw" class="block-btn"
					onclick="sub();" value="确认">
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
