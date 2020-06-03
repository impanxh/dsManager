<#import "../template/template.ftl" as frame> <#global menu="合同进度表"><@frame.html title="合同进度表"

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
		<div class="withdraw-title">合同进度表</div>
		<form data-name="withdraw" name="reportMsg" id="reportMsg" class="ui-form"
		method="post"
		enctype="multipart/form-data">
		<input type="hidden" name="className" value="R1_contract"/>
		<input type="hidden" id="checkUniq" name="checkUniq" value="N"/>
		<input type="hidden" id="id" name="id" value="<@security.authentication property="principal.user.id"/>"/>
  		<input type="hidden" name="selectByField" value="id"/>
		<input type="hidden" name="task_ss" id="task_ss" value="1" />
		<input type="hidden" name="uniqId_s" id ="uniqId_s" value=""/>
		<input type="hidden" name="creator_s" id="creator_s"  value=""/>
		<div class="withdrawInputs" id="baseinfoedit" style="width: 100%; ">
			<div class="inputs" style="float: left;">
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  客户</label>
		                    <input class="ui-input updateBusTotal validate[required]" type="text" name="c1_s"   id="c1_s">
		                </div>
	          		 
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  省</label>
		                    <input class="ui-input updateBusTotal validate[required]" type="text" name="c2_s"   id="c2_s">
		                </div>
	          		 
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  城市【市、县】</label>
		                    <input class="ui-input updateBusTotal validate[required]" type="text" name="c3_s"   id="c3_s">
		                </div>
	          		 
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  合同性质</label>
		                    <input class="ui-input updateBusTotal validate[required]" type="text" name="c4_s"   id="c4_s">
		                </div>
	          		 
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  公司名称</label>
		                    <input class="ui-input updateBusTotal validate[required]" type="text" name="c5_s"   id="c5_s">
		                </div>
	          		 
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  收件地址</label>
		                    <input class="ui-input updateBusTotal validate[required]" type="text" name="c6_s"   id="c6_s">
		                </div>
	          		 
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  联系人</label>
		                    <input class="ui-input updateBusTotal validate[required]" type="text" name="c7_s"   id="c7_s">
		                </div>
	          		 
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  电话</label>
		                    <input class="ui-input updateBusTotal validate[required]" type="text" name="c8_s"   id="c8_s">
		                </div>
	          		 
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  手机</label>
		                    <input class="ui-input updateBusTotal validate[required]" type="text" name="c9_s"   id="c9_s">
		                </div>
	          		 
	          		 
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  媒介合同签订时间</label>
		                     <input class="ui-input validate[required,custom[date]] datepicker" type="text" name="c10_dt"  id="c10_dt" placeholder="yyyy-mm-dd">
		                </div>
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  合同</label>
		                    <input class="ui-input updateBusTotal validate[required]" type="text" name="c11_s"   id="c11_s">
		                </div>
	          		 
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  大协议</label>
		                    <input class="ui-input updateBusTotal validate[required]" type="text" name="c12_s"   id="c12_s">
		                </div>
	          		 
	          		 
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  资源授权</label>
		                    <input class="ui-input updateBusTotal validate[required]" type="text" name="c14_s"   id="c14_s">
		                </div>
	          		 
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  发布周期</label>
		                    <input class="ui-input updateBusTotal validate[required]" type="text" name="c15_s"   id="c15_s">
		                </div>
	          		 
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  上刊日期</label>
		                    <input class="ui-input updateBusTotal validate[required]" type="text" name="c16_s"   id="c16_s">
		                </div>
	          		 
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  下刊日期</label>
		                    <input class="ui-input updateBusTotal validate[required]" type="text" name="c17_s"   id="c17_s">
		                </div>
	          		 
	          		 
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  要求上画时间</label>
		                     <input class="ui-input validate[required,custom[date]] datepicker" type="text" name="c18_dt"  id="c18_dt" placeholder="yyyy-mm-dd">
		                </div>
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  画面材质</label>
		                    <input class="ui-input updateBusTotal validate[required]" type="text" name="c19_s"   id="c19_s">
		                </div>
	          		 
			</div>

			<div class="inputs" style="float: right;  margin-right: 80px;">
			
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  换画制作费（元）</label>
		                    <input class="ui-input updateBusTotal validate[required]" type="text" name="c20_d"   id="c20_d">
		                </div>
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  合同总额</label>
		                    <input class="ui-input updateBusTotal validate[required]" type="text" name="c21_d"   id="c21_d">
		                </div>
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  付款时间首次</label>
		                    <input class="ui-input updateBusTotal validate[required]" type="text" name="c22_s"   id="c22_s">
		                </div>
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  付款时间金额</label>
		                    <input class="ui-input updateBusTotal validate[required]" type="text" name="c23_d"   id="c23_d">
		                </div>
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  付款时间发票或收据</label>
		                    <input class="ui-input updateBusTotal validate[required]" type="text" name="c24_s"   id="c24_s">
		                </div>
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  付款时间二次</label>
		                    <input class="ui-input updateBusTotal validate[required]" type="text" name="c25_s"   id="c25_s">
		                </div>
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  付款时间金额</label>
		                    <input class="ui-input updateBusTotal validate[required]" type="text" name="c26_d"   id="c26_d">
		                </div>
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  付款时间发票或收据</label>
		                    <input class="ui-input updateBusTotal validate[required]" type="text" name="c27_s"   id="c27_s">
		                </div>
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  付款时间三次</label>
		                    <input class="ui-input updateBusTotal validate[required]" type="text" name="c28_s"   id="c28_s">
		                </div>
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  付款时间金额</label>
		                    <input class="ui-input updateBusTotal validate[required]" type="text" name="c29_d"   id="c29_d">
		                </div>
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  付款时间发票</label>
		                    <input class="ui-input updateBusTotal validate[required]" type="text" name="c30_s"   id="c30_s">
		                </div>
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  付款时间尾款</label>
		                    <input class="ui-input updateBusTotal validate[required]" type="text" name="c31_d"   id="c31_d">
		                </div>
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  付款时间金额</label>
		                    <input class="ui-input updateBusTotal validate[required]" type="text" name="c32_d"   id="c32_d">
		                </div>
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  付款时间发票或收据</label>
		                    <input class="ui-input updateBusTotal validate[required]" type="text" name="c33_s"   id="c33_s">
		                </div>
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  刊登车辆</label>
		                    <input class="ui-input updateBusTotal validate[required]" type="text" name="c34_s"   id="c34_s">
		                </div>
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  车牌/路线</label>
		                    <input class="ui-input updateBusTotal validate[required]" type="text" name="c35_s"   id="c35_s">
		                </div>
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  备注</label>
		                    <input class="ui-input updateBusTotal validate[required]" type="text" name="c36_s"   id="c36_s">
		                </div>
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  录入人</label>
		                    <input class="ui-input updateBusTotal validate[required]" type="text" name="c37_s"   id="c37_s">
		                </div>
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  评价</label>
		                    <input class="ui-input updateBusTotal validate[required]" type="text" name="c38_s"   id="c38_s">
		                </div>
   				
			</div>

			</div>

			<input type="hidden" name="img1List_s" id="img1ListId" />
			<input type="hidden" name="img2List_s" id="img2ListId" />


		</form>

		<#--  添加图片开始  -->
			<div class="withdrawInputs" style="margin-top:7%;">
			<div class="file-box">
			<form id="imgForm1" method="post" enctype="multipart/form-data" >
                <input class="file-btn" name="imgFile"
					style="margin-top: -5px;" id="fileid1" type="file" href="javascript:void(0);"
					onchange="uploadImgs(1)" />  资质证明
			</form>
            </div>

			<div id="imgsBox1">
            </div>
            </br>

			 <div class="file-box">
                <form id="imgForm2" method="post" enctype="multipart/form-data" >
                    <input class="file-btn" name="imgFile" style="margin-top: -5px;" id="fileid2" 
                    type="file" href="javascript:void(0);" onchange="uploadImgs('2')" />  授权文件 
                </form>
            </div>
            <div id="imgsBox2">
            </div>






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
 
</@frame.html><#assign nowTag=.now?long><script type="text/javascript" language="javascript" src="/js/e6/func/cityMediaContract_savefunc.js?t=${nowTag}"></script>


