<#import "../template/template.ftl" as frame> <#global menu="合同进度表"><@frame.html title="合同进度表"
js=["js/jquery-ui/jquery-ui.js","js/jquery-dateFormat.js",
"js/jquery-ui/jquery-ui.auto.complete.js","js/datepicker.js","js/SQ.js?t=123","js/jquery.cookie.js","js/jquery-dataTables-checkboxSelect.js","js/jquery-dataTables-fnCounterColumns.js",
"js/jquery.datepicker.region.cn.js","js/progressbar.js","js/production_task.js","js/commonsheet.js","anthonyJS/anthonyMO.js"]
css=["css/sift.css","js/jquery-ui/jquery-ui.css","css/uploadprogess.css","css/jquery-ui-1.8.16.custom.css","js/jquery-ui/jquery-ui.auto.complete.css","css/autocomplete.css","css/jquery.lightbox-0.5.css"]>


<#assign security=JspTaglibs["/WEB-INF/tlds/security.tld"] />

<link rel="stylesheet" type="text/css" href="${rc.contextPath}/css/basecss.css">
<link rel="stylesheet" type="text/css" href="/js/export/imageFileStyleShow.css">

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
		<div class="withdraw-title">合同进度表</div>
		<div class="withdrawInputs" style="width: 100%;">
			<@modelObject className="R1_contract" filterField="id"    paramName="id">
			
			<#setting datetime_format="yyyy-MM-dd"/>
						<div id="orderedBuses">
							<table id="table_report" style="table-layout:fixed;" class="display compact" cellspacing="0" width="100%">
								<thead>
								
								 		  <tr class="tableTr"> 
										 <th>客户</th>
										 
											 <td>${(model.c1_s )!''}</td>
										 
										   
										 <th>省</th>
										 
											 <td>${(model.c2_s )!''}</td>
										 
										 </tr>
										  <tr class="tableTr"> 
										 <th>城市【市、县】</th>
										 
											 <td>${(model.c3_s )!''}</td>
										 
										   
										 <th>合同性质</th>
										 
											 <td>${(model.c4_s )!''}</td>
										 
										 </tr>
										  <tr class="tableTr"> 
										 <th>公司名称</th>
										 
											 <td>${(model.c5_s )!''}</td>
										 
										   
										 <th>收件地址</th>
										 
											 <td>${(model.c6_s )!''}</td>
										 
										 </tr>
										  <tr class="tableTr"> 
										 <th>联系人</th>
										 
											 <td>${(model.c7_s )!''}</td>
										 
										   
										 <th>电话</th>
										 
											 <td>${(model.c8_s )!''}</td>
										 
										 </tr>
										  <tr class="tableTr"> 
										 <th>手机</th>
										 
											 <td>${(model.c9_s )!''}</td>
										 
										   
										 <th>媒介合同签订时间</th>
										 
											 <td>${(model.c10_dt?number_to_datetime)!''}</td>
										 
										 </tr>
										  <tr class="tableTr"> 
										 <th>合同</th>
										 
											 <td>${(model.c11_s )!''}</td>
										 
										   
										 <th>大协议</th>
										 
											 <td>${(model.c12_s )!''}</td>
										 
										 </tr>
										  <tr class="tableTr"> 
										 <th>资质证件</th>
										 
											 <td>${(model.营业执照 )!''}</td>
										 
										   
										 <th>资源授权</th>
										 
											 <td>${(model.c14_s )!''}</td>
										 
										 </tr>
										  <tr class="tableTr"> 
										 <th>发布周期</th>
										 
											 <td>${(model.c15_s )!''}</td>
										 
										   
										 <th>上刊日期</th>
										 
											 <td>${(model.c16_s )!''}</td>
										 
										 </tr>
										  <tr class="tableTr"> 
										 <th>下刊日期</th>
										 
											 <td>${(model.c17_s )!''}</td>
										 
										   
										 <th>要求上画时间</th>
										 
											 <td>${(model.c18_dt?number_to_datetime)!''}</td>
										 
										 </tr>
										  <tr class="tableTr"> 
										 <th>画面材质</th>
										 
											 <td>${(model.c19_s )!''}</td>
										 
										   
										 <th>换画制作费（元）</th>
										 
											 <td>${(model.c20_d )!''}</td>
										 
										 </tr>
										  <tr class="tableTr"> 
										 <th>合同总额</th>
										 
											 <td>${(model.c21_d )!''}</td>
										 
										   
										 <th>付款时间首次</th>
										 
											 <td>${(model.c22_s )!''}</td>
										 
										 </tr>
										  <tr class="tableTr"> 
										 <th>付款时间金额</th>
										 
											 <td>${(model.c23_d )!''}</td>
										 
										   
										 <th>付款时间发票或收据</th>
										 
											 <td>${(model.c24_s )!''}</td>
										 
										 </tr>
										  <tr class="tableTr"> 
										 <th>付款时间二次</th>
										 
											 <td>${(model.c25_s )!''}</td>
										 
										   
										 <th>付款时间金额</th>
										 
											 <td>${(model.c26_d )!''}</td>
										 
										 </tr>
										  <tr class="tableTr"> 
										 <th>付款时间发票或收据</th>
										 
											 <td>${(model.c27_s )!''}</td>
										 
										   
										 <th>付款时间三次</th>
										 
											 <td>${(model.c28_s )!''}</td>
										 
										 </tr>
										  <tr class="tableTr"> 
										 <th>付款时间金额</th>
										 
											 <td>${(model.c29_d )!''}</td>
										 
										   
										 <th>付款时间发票</th>
										 
											 <td>${(model.c30_s )!''}</td>
										 
										 </tr>
										  <tr class="tableTr"> 
										 <th>付款时间尾款</th>
										 
											 <td>${(model.c31_d )!''}</td>
										 
										   
										 <th>付款时间金额</th>
										 
											 <td>${(model.c32_d )!''}</td>
										 
										 </tr>
										  <tr class="tableTr"> 
										 <th>付款时间发票或收据</th>
										 
											 <td>${(model.c33_s )!''}</td>
										 
										   
										 <th>刊登车辆</th>
										 
											 <td>${(model.c34_s )!''}</td>
										 
										 </tr>
										  <tr class="tableTr"> 
										 <th>车牌/路线</th>
										 
											 <td>${(model.c35_s )!''}</td>
										 
										   
										 <th>备注</th>
										 
											 <td>${(model.c36_s )!''}</td>
										 
										 </tr>
										  <tr class="tableTr"> 
										 <th>录入人</th>
										 
											 <td>${(model.c37_s )!''}</td>
										 
										   
										 <th>评价</th>
										 
											 <td>${(model.c38_s )!''}</td>
										 
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
                                <div class="imgsBox-tips">资质证明</div>
                                <div id="img1List" class="imgsBox-child"></div>

                               <div class="imgsBox-tips">授权文件</div>
                                <div id="img2List" class="imgsBox-child"></div>
                            </div>
                        </div>




<script type="text/javascript">
  var id = getQueryString("id");
 var obj = queryForObjectV3({ "filter[id]": id }, 'R1_contract');//Use classname (name of table)
                    if (isNotNull(obj)) { 
                        file_imageShow(obj.img1List_s, 'img1List');
						file_imageShow(obj.img2List_s, 'img2List');

					}


  </script>
 






 
<#assign nowTag=.now?long>
</@frame.html>

