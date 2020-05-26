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
<script type="text/javascript" language="javascript" src="${rc.contextPath}/js/jquery-dataTables-fnNameOrdering.js"></script>
<script type="text/javascript" language="javascript" src="${rc.contextPath}/js/laytpl.js"></script>
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
		<div class="withdrawInputs" style="width: 100%;">
			<@modelObject className="R1_linkplate" filterField="id"    paramName="id">
						<div id="orderedBuses">
							<table id="table_report" style="table-layout:fixed;" class="display compact" cellspacing="0" width="100%">
								<thead>
								
								 		  <tr class="tableTr"> 
										 <th>所属线路</th><td>${(model.lineName_s )!''}</td>
										   
										 <th>所属公司</th><td>${(model.company_s )!''}</td>
										 </tr>
										  <tr class="tableTr"> 
										 <th>车号</th><td>${(model.serianumber_s )!''}</td>
										   
										 <th>牌照号</th><td>${(model.plateNumber_s )!''}</td>
										 </tr>
										  <tr class="tableTr"> 
										 <th>车辆性质</th><td>${(model.type_s )!''}</td>
										   
										 <th>车型</th><td>${(model.model_s )!''}</td>
										 </tr>
										  <tr class="tableTr"> 
										 <th>挂板数量</th><td>${(model.number_s )!''}</td>
										   
										 <th>上刊内容</th><td>${(model.adcontext_s )!''}</td>
										 </tr>
										  <tr class="tableTr"> 
										 <th>实际上刊时间</th><td>${(model.start_dt )!''}</td>
										   
										 <th>预计下刊时间</th><td>${(model.end_dt )!''}</td>
										 </tr>
										  <tr class="tableTr"> 
										 <th>备注</th><td>${(model.comment_s )!''}</td>
										   
									
									  </tr>
								</thead>
							</table>
						</div>
			</@modelObject>
		</div>
	</div>
	<br>
</div>



 






 
<#assign nowTag=.now?long>
</@frame.html>

