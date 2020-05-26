<#import "../template/template.ftl" as frame> <#global menu="车内挂版管理"><@frame.html title="车内挂版管理"

js=["js/jquery-ui/jquery-ui.js","js/jquery-dateFormat.js",
"js/jquery-ui/jquery-ui.auto.complete.js","js/datepicker.js","js/SQ.js?t=123","js/jquery.cookie.js","js/jquery-dataTables-checkboxSelect.js","js/jquery-dataTables-fnCounterColumns.js",
"js/jquery.datepicker.region.cn.js","js/progressbar.js","js/production_task.js","js/commonsheet.js","anthonyJS/anthonyMO.js"]
css=["css/sift.css","js/jquery-ui/jquery-ui.css","css/uploadprogess.css","css/jquery-ui-1.8.16.custom.css","js/jquery-ui/jquery-ui.auto.complete.css","css/autocomplete.css","css/jquery.lightbox-0.5.css"]>


<#assign security=JspTaglibs["/WEB-INF/tlds/security.tld"] />

<link rel="stylesheet" type="text/css" href="${rc.contextPath}/css/basecss.css">
<script type="text/javascript" language="javascript" src="/js/export/jquery.dataTables.min.js"></script>
<link rel="stylesheet" type="text/css" href="/js/export/buttons.dataTables.min.css">
<script type="text/javascript" language="javascript" src="/js/export/dataTables.buttons.min.js"></script>
<script type="text/javascript" language="javascript" src="/js/export/jszip.min.js"></script>
<script type="text/javascript" language="javascript" src="/js/export/buttons.html5.min.js"> </script>
<script type="text/javascript" language="javascript"
  src="${rc.contextPath}/js/jquery-dataTables-fnNameOrdering.js"></script>
<script type="text/javascript" language="javascript"
        src="${rc.contextPath}/js/laytpl.js"></script>

 
<!--this file is generator by tools author:pxh mail:impanxh#gmail.com--> 
<style type="text/css">
	.tableTr {width: 100%;height: 40px;}
	table .dataTable {margin-bottom: 20px;}
	.ui-input {width:150px;}
	.withdrawInputs {
		margin: 10 auto;
    	width: 100%;
	}
</style>
<div id="">
	<div class="p20bs color-white-bg border-ec">
		<div class="withdraw-title">车内挂版管理</div>
		<form data-name="withdraw" name="reportMsg" id="reportMsg" class="ui-form"
		method="post"
		enctype="multipart/form-data">
		<input type="hidden" name="className" value="R1_linkplate"/>
		<input type="hidden" id="checkUniq" name="checkUniq" value="N"/>
		<input type="hidden" id="id" name="id" value="<@security.authentication property="principal.userName"/>"/>
  		<input type="hidden" name="selectByField" value="id"/>
		<input type="hidden" name="task_ss" id="task_ss" value="1" />
		<input type="hidden" name="uniqId_s" id ="uniqId_s" value=""/>
		<input type="hidden" name="creator_s" id="creator_s"  value=""/>
		<div class="withdrawInputs" id="baseinfoedit" style="width: 100%; ">
			<div class="inputs" style="float: left;">
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  所属线路</label>
		                    <input class="ui-input updateBusTotal validate[required]" type="text" name="lineName_s"   id="lineName_s">
		                </div>
	          		 
	          		 
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  所属公司</label>
		                    <select class="ui-input validate[required]" type="text" name="company_s" id="company_s" value="" >
		                           			<option value="客一">客一</option>   
		                           			<option value="客一">客一</option>   
		                           			<option value="客三">客三</option>   
		                           			<option value="客四">客四</option>   
		                           			<option value="客九">客九</option>   
                   		   </select>
		                </div>
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  车号</label>
		                    <input class="ui-input updateBusTotal validate[required]" type="text" name="serianumber_s"   id="serianumber_s">
		                </div>
	          		 
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  牌照号</label>
		                    <input class="ui-input updateBusTotal validate[required]" type="text" name="plateNumber_s"   id="plateNumber_s">
		                </div>
	          		 
	          		 
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  车辆性质</label>
		                    <select class="ui-input validate[required]" type="text" name="type_s" id="type_s" value="" >
		                           			<option value="大灯片">大灯片</option>   
		                           			<option value="挂板">挂板</option>   
		                           			<option value="挂板贴">挂板贴</option>   
		                           			<option value="内包车">内包车</option>   
		                           			<option value="未装板">未装板</option>   
                   		   </select>
		                </div>
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  车型</label>
		                    <input class="ui-input updateBusTotal validate[required]" type="text" name="model_s"   id="model_s">
		                </div>
	          		 
			</div>

			<div class="inputs" style="float: right;  margin-right: 80px;">
			
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  挂板数量</label>
		                    <input class="ui-input updateBusTotal validate[required]" type="text" name="number_s"   id="number_s">
		                </div>
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  上刊内容</label>
		                    <input class="ui-input updateBusTotal validate[required]" type="text" name="adcontext_s"   id="adcontext_s">
		                </div>
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  实际上刊时间</label>
		                     <input class="ui-input validate[required,custom[date]] datepicker" type="text" name="start_dt"  id="start_dt">
		                </div>
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  预计下刊时间</label>
		                     <input class="ui-input validate[required,custom[date]] datepicker" type="text" name="end_dt"  id="end_dt">
		                </div>
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  备注</label>
		                    <input class="ui-input updateBusTotal validate[required]" type="text" name="comment_s"   id="comment_s">
		                </div>
   				
			</div>

			</div>
		</form>
        <input type="hidden" id="_modelId" value="0">
			<div class="withdrawInputs" style="text-align: center;">
            <span style="text-align: center; margin-left: 20px;padding-bottom: 10px;">
                <button type="button" id="subutton"
                class="block-btn">保存信息</button>
            </span>
			</div>
		</div>

			<div >
	</div>
    </div>
	<br>
</div>
</div>
 
</@frame.html><#assign nowTag=.now?long><script type="text/javascript" language="javascript" src="/js/e6/func/linkplate_savefunc.js?t=${nowTag}"></script>


