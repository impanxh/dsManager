<#import "../template/template.ftl" as frame> <#global menu="公交车报价表"><@frame.html title="公交详情"
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
		<div class="withdraw-title">公交详情</div>
		<div class="withdrawInputs" style="width: 100%;">
			<@modelObject className="R1_price" filterField="id"    paramName="id">
			
			<#setting datetime_format="yyyy-MM-dd"/>
						<div id="orderedBuses">
							<table id="table_report" style="table-layout:fixed;" class="display compact" cellspacing="0" width="100%">
								<thead>
								
								 		  <tr class="tableTr"> 
										 <th>省份</th>
										 
											 <td>${(model.b2_s )!''}</td>
										 
										   
										 <th>地区</th>
										 
											 <td>${(model.b3_s )!''}</td>
										 
										 </tr>
										  <tr class="tableTr"> 
										 <th>人口(万人)</th>
										 
											 <td>${(model.b4_s )!''}</td>
										 
										   
										 <th>GDP（百万元）</th>
										 
											 <td>${(model.b5_s )!''}</td>
										 
										 </tr>
										  <tr class="tableTr"> 
										 <th>发布形式</th>
										 
											 <td>${(model.b6_s )!''}</td>
										 
										   
										 <th>线路级别</th>
										 
											 <td>${(model.b7_s )!''}</td>
										 
										 </tr>
										  <tr class="tableTr"> 
										 <th>线路</th>
										 
											 <td>${(model.b8_s )!''}</td>
										 
										   
										 <th>车型</th>
										 
											 <td>${(model.b9_s )!''}</td>
										 
										 </tr>
										  <tr class="tableTr"> 
										 <th>车长（米）</th>
										 
											 <td>${(model.b10_s )!''}</td>
										 
										   
										 <th>最小投放周期</th>
										 
											 <td>${(model.b11_s )!''}</td>
										 
										 </tr>
										  <tr class="tableTr"> 
										 <th>刊例价一个月（元/辆）</th>
										 
											 <td>${(model.b12_s )!''}</td>
										 
										   
										 <th>刊例价三个月（元/辆）</th>
										 
											 <td>${(model.b13_s )!''}</td>
										 
										 </tr>
										  <tr class="tableTr"> 
										 <th>刊例价半年（元/辆）</th>
										 
											 <td>${(model.b14_s )!''}</td>
										 
										   
										 <th>刊例价一年（元/辆）</th>
										 
											 <td>${(model.b15_s )!''}</td>
										 
										 </tr>
										  <tr class="tableTr"> 
										 <th>折扣</th>
										 
											 <td>${(model.b16_s )!''}</td>
										 
										   
										 <th>折后价一个月（元/辆）</th>
										 
											 <td>${(model.b17_s )!''}</td>
										 
										 </tr>
										  <tr class="tableTr"> 
										 <th>折后价三个月（元/辆）</th>
										 
											 <td>${(model.b18_s )!''}</td>
										 
										   
										 <th>折后价半年（元/辆）</th>
										 
											 <td>${(model.b19_s )!''}</td>
										 
										 </tr>
										  <tr class="tableTr"> 
										 <th>折后价一年（元/辆）</th>
										 
											 <td>${(model.b20_s )!''}</td>
										 
										   
										 <th>制作费（元/次/辆）</th>
										 
											 <td>${(model.b21_s )!''}</td>
										 
										 </tr>
										  <tr class="tableTr"> 
										 <th>城市公交总数量、线路总数量</th>
										 
											 <td>${(model.b22_s )!''}</td>
										 
										   
										 <th>归属资源方及资源情况</th>
										 
											 <td>${(model.b23_s )!''}</td>
										 
										 </tr>
										  <tr class="tableTr"> 
										 <th>资源方服务等级A/B/C</th>
										 
											 <td>${(model.b24_s )!''}</td>
										 
										   
										 <th>是否合作过-合作时间</th>
										 
											 <td>${(model.b25_s )!''}</td>
										 
										 </tr>
										  <tr class="tableTr"> 
										 <th>是否有第三方广告</th>
										 
											 <td>${(model.b26_s )!''}</td>
										 
										   
										 <th>备注</th>
										 
											 <td>${(model.b27_s )!''}</td>
										 
										 </tr>
										  <tr class="tableTr"> 
										 <th>排查人</th>
										 
											 <td>${(model.b28_s )!''}</td>
										 
										   
										 <th>更新时间</th>
										 
											 <td>${(model.b29_dt?number_to_datetime)!''}</td>
										 
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

 						<div class="withdrawInputs">
                            <div class="touchBtn">
                                显示/隐藏图片信息
                            </div>
                            <div id="imgsBox" style="display:none;">
                                <div class="imgsBox-tips">套车小样</div>
                                <div id="imgListTaoche" class="imgsBox-child"></div>

                                <div class="imgsBox-tips">文件列表</div>
                                <div id="fileList" class="imgsBox-child"></div>
                            </div>
                        </div>

 






 
<#assign nowTag=.now?long>
</@frame.html>

