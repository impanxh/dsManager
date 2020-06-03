<#import "../template/template.ftl" as frame> <#global menu="基础信息"><@frame.html title="基础信息"
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
		<div class="withdraw-title">基础信息</div>
		<div class="withdrawInputs" style="width: 100%;">
			<@modelObject className="R1_base" filterField="id"    paramName="id">
			
			<#setting datetime_format="yyyy-MM-dd"/>
						<div id="orderedBuses">
							<table id="table_report" style="table-layout:fixed;" class="display compact" cellspacing="0" width="100%">
								<thead>
								
								 		  <tr class="tableTr"> 
										 <th>地区</th>
										 
											 <td>${(model.a2_s )!''}</td>
										 
										   
										 <th>县（市）</th>
										 
											 <td>${(model.a3_s )!''}</td>
										 
										 </tr>
										  <tr class="tableTr"> 
										 <th>GDP(百万元) </th>
										 
											 <td>${(model.a4_s )!''}</td>
										 
										   
										 <th>县域人口（万人）</th>
										 
											 <td>${(model.a5_i )!''}</td>
										 
										 </tr>
										  <tr class="tableTr"> 
										 <th>覆盖乡镇</th>
										 
											 <td>${(model.a6_s )!''}</td>
										 
										   
										 <th>运管所 电话</th>
										 
											 <td>${(model.a7_s )!''}</td>
										 
										 </tr>
										  <tr class="tableTr"> 
										 <th>是否有合作</th>
										 
											 <td>${(model.a8_s )!''}</td>
										 
										   
										 <th>联系情况</th>
										 
											 <td>${(model.a9_s )!''}</td>
										 
										 </tr>
										  <tr class="tableTr"> 
										 <th>媒体类型</th>
										 
											 <td>${(model.a10_s )!''}</td>
										 
										   
										 <th>公交公司</th>
										 
											 <td>${(model.a11_s )!''}</td>
										 
										 </tr>
										  <tr class="tableTr"> 
										 <th>联系人</th>
										 
											 <td>${(model.a12_s )!''}</td>
										 
										   
										 <th>职位</th>
										 
											 <td>${(model.a13_s )!''}</td>
										 
										 </tr>
										  <tr class="tableTr"> 
										 <th>电话</th>
										 
											 <td>${(model.a14_s )!''}</td>
										 
										   
										 <th>手机／小灵通</th>
										 
											 <td>${(model.a15_s )!''}</td>
										 
										 </tr>
										  <tr class="tableTr"> 
										 <th>传真</th>
										 
											 <td>${(model.a16_s )!''}</td>
										 
										   
										 <th>其它联系方式</th>
										 
											 <td>${(model.a17_s )!''}</td>
										 
										 </tr>
										  <tr class="tableTr"> 
										 <th>代理公司</th>
										 
											 <td>${(model.a18_s )!''}</td>
										 
										   
										 <th>联系人</th>
										 
											 <td>${(model.a19_s )!''}</td>
										 
										 </tr>
										  <tr class="tableTr"> 
										 <th>职位</th>
										 
											 <td>${(model.a20_s )!''}</td>
										 
										   
										 <th>电话</th>
										 
											 <td>${(model.a21_s )!''}</td>
										 
										 </tr>
										  <tr class="tableTr"> 
										 <th>手机</th>
										 
											 <td>${(model.a22_s )!''}</td>
										 
										   
										 <th>传真</th>
										 
											 <td>${(model.a23_s )!''}</td>
										 
										 </tr>
										  <tr class="tableTr"> 
										 <th>其它联系方式</th>
										 
											 <td>${(model.a24_s )!''}</td>
										 
										   
										 <th>城内/城乡</th>
										 
											 <td>${(model.a25_s )!''}</td>
										 
										 </tr>
										  <tr class="tableTr"> 
										 <th>公交车数量</th>
										 
											 <td>${(model.a26_s )!''}</td>
										 
										   
										 <th>可刊登公交车数量</th>
										 
											 <td>${(model.a27_s )!''}</td>
										 
										 </tr>
										  <tr class="tableTr"> 
										 <th>一年报价（元/年/辆）</th>
										 
											 <td>${(model.a28_s )!''}</td>
										 
										   
										 <th>半年报价（元/年/辆）</th>
										 
											 <td>${(model.a29_s )!''}</td>
										 
										 </tr>
										  <tr class="tableTr"> 
										 <th>制作安装费/换画费用</th>
										 
											 <td>${(model.a30_d )!''}</td>
										 
										   
										 <th>制作周期</th>
										 
											 <td>${(model.a31_s )!''}</td>
										 
										 </tr>
										  <tr class="tableTr"> 
										 <th>谈判后价格</th>
										 
											 <td>${(model.a32_d )!''}</td>
										 
										   
										 <th>车型</th>
										 
											 <td>${(model.a33_s )!''}</td>
										 
										 </tr>
										  <tr class="tableTr"> 
										 <th>车长</th>
										 
											 <td>${(model.a34_s )!''}</td>
										 
										   
										 <th>发布位置（勾选即可）</th>
										 
											 <td>${(model.a35_s )!''}</td>
										 
										 </tr>
										 
							 <tr class="tableTr"> 
										 <th>排查人</th>
										 
											 <td>${(model.a41_s )!''}</td>
										 
										   
										 <th>时间</th>
										 
											 <td>${(model.a42_dt?number_to_datetime)!''}</td>
										 
										 </tr>

										   <tr id="yewubz" class="tableTr" style="height:80px;">
												<th>备注</th>

												<td id="ts" colspan="3" class="break" width="861px">${(model.a39_s )!''}</td>

											</tr>

											  <tr id="yewubz" class="tableTr" style="height:80px;">
												<th>收件地址</th>

												<td id="ts" colspan="3" class="break" width="861px">${(model.a40_s )!''}</td>

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

