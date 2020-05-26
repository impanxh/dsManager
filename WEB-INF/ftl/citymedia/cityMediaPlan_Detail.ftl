<#import "../template/template.ftl" as frame> <#global menu="付款进度表"><@frame.html title="付款进度表"
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
		<div class="withdraw-title">付款进度表</div>
		<div class="withdrawInputs" style="width: 100%;">
			<@modelObject className="R1_plan" filterField="id"    paramName="id">
			
			<#setting datetime_format="yyyy-MM-dd"/>
						<div id="orderedBuses">
							<table id="table_report" style="table-layout:fixed;" class="display compact" cellspacing="0" width="100%">
								<thead>
								
								 		  <tr class="tableTr"> 
										 <th>客户</th>
										 
											 <td>${(model.d1_s )!''}</td>
										 
										   
										 <th>省份</th>
										 
											 <td>${(model.d2_s )!''}</td>
										 
										 </tr>
										  <tr class="tableTr"> 
										 <th>县（市）</th>
										 
											 <td>${(model.d3_s )!''}</td>
										 
										   
										 <th>合同性质</th>
										 
											 <td>${(model.d4_s )!''}</td>
										 
										 </tr>
										  <tr class="tableTr"> 
										 <th>联系人</th>
										 
											 <td>${(model.d5_s )!''}</td>
										 
										   
										 <th>公司名称</th>
										 
											 <td>${(model.d6_s )!''}</td>
										 
										 </tr>
										  <tr class="tableTr"> 
										 <th>银行</th>
										 
											 <td>${(model.d7_s )!''}</td>
										 
										   
										 <th>银行账号</th>
										 
											 <td>${(model.d8_s )!''}</td>
										 
										 </tr>
										  <tr class="tableTr"> 
										 <th>合同总额（元）</th>
										 
											 <td>${(model.d9_d )!''}</td>
										 
										   
										 <th>发票类型</th>
										 
											 <td>${(model.d10_s )!''}</td>
										 
										 </tr>
										  <tr class="tableTr"> 
										 <th>首付款（元）</th>
										 
											 <td>${(model.d11_d )!''}</td>
										 
										   
										 <th>付款日期</th>
										 
											 <td>${(model.d12_dt?number_to_datetime)!''}</td>
										 
										 </tr>
										  <tr class="tableTr"> 
										 <th>二次付款</th>
										 
											 <td>${(model.d13_d )!''}</td>
										 
										   
										 <th>付款日期</th>
										 
											 <td>${(model.d14_dt?number_to_datetime)!''}</td>
										 
										 </tr>
										  <tr class="tableTr"> 
										 <th>三次付款</th>
										 
											 <td>${(model.d15_d )!''}</td>
										 
										   
										 <th>付款日期</th>
										 
											 <td>${(model.d16_dt?number_to_datetime)!''}</td>
										 
										 </tr>
										  <tr class="tableTr"> 
										 <th>尾款</th>
										 
											 <td>${(model.d17_d )!''}</td>
										 
										   
										 <th>付款日期</th>
										 
											 <td>${(model.d18_dt?number_to_datetime)!''}</td>
										 
										 </tr>
										  <tr class="tableTr"> 
										 <th>备注</th>
										 
											 <td>${(model.d19_s )!''}</td>
										 
										   
										 <th>录入人</th>
										 
											 <td>${(model.d20_s )!''}</td>
										 
										 </tr>
										   
									
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

