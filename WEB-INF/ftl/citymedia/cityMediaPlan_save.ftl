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
		<div class="withdraw-title">付款进度表</div>
		<form data-name="withdraw" name="reportMsg" id="reportMsg" class="ui-form"
		method="post"
		enctype="multipart/form-data">
		<input type="hidden" name="className" value="R1_plan"/>
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
		                    <input class="ui-input updateBusTotal validate[required]" type="text" name="d1_s"   id="d1_s">
		                </div>
	          		 
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  省份</label>
		                    <input class="ui-input updateBusTotal validate[required]" type="text" name="d2_s"   id="d2_s">
		                </div>
	          		 
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  县（市）</label>
		                    <input class="ui-input updateBusTotal validate[required]" type="text" name="d3_s"   id="d3_s">
		                </div>
	          		 
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  合同性质</label>
		                    <input class="ui-input updateBusTotal validate[required]" type="text" name="d4_s"   id="d4_s">
		                </div>
	          		 
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  联系人</label>
		                    <input class="ui-input updateBusTotal validate[required]" type="text" name="d5_s"   id="d5_s">
		                </div>
	          		 
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  公司名称</label>
		                    <input class="ui-input updateBusTotal validate[required]" type="text" name="d6_s"   id="d6_s">
		                </div>
	          		 
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  银行</label>
		                    <input class="ui-input updateBusTotal validate[required]" type="text" name="d7_s"   id="d7_s">
		                </div>
	          		 
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  银行账号</label>
		                    <input class="ui-input updateBusTotal validate[required]" type="text" name="d8_s"   id="d8_s">
		                </div>
	          		 
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  合同总额（元）</label>
		                    <input class="ui-input updateBusTotal validate[required]" type="text" name="d9_d"   id="d9_d">
		                </div>
	          		 
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  发票类型</label>
		                    <input class="ui-input updateBusTotal validate[required]" type="text" name="d10_s"   id="d10_s">
		                </div>
	          		 
			</div>

			<div class="inputs" style="float: right;  margin-right: 80px;">
			
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  首付款（元）</label>
		                    <input class="ui-input updateBusTotal validate[required]" type="text" name="d11_d"   id="d11_d">
		                </div>
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  付款日期</label>
		                     <input class="ui-input validate[required,custom[date]] datepicker" type="text" name="d12_dt"  id="d12_dt" placeholder="yyyy-mm-dd">
		                </div>
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  二次付款</label>
		                    <input class="ui-input updateBusTotal validate[required]" type="text" name="d13_d"   id="d13_d">
		                </div>
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  付款日期</label>
		                     <input class="ui-input validate[required,custom[date]] datepicker" type="text" name="d14_dt"  id="d14_dt" placeholder="yyyy-mm-dd">
		                </div>
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  三次付款</label>
		                    <input class="ui-input updateBusTotal validate[required]" type="text" name="d15_d"   id="d15_d">
		                </div>
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  付款日期</label>
		                     <input class="ui-input validate[required,custom[date]] datepicker" type="text" name="d16_dt"  id="d16_dt" placeholder="yyyy-mm-dd">
		                </div>
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  尾款</label>
		                    <input class="ui-input updateBusTotal validate[required]" type="text" name="d17_d"   id="d17_d">
		                </div>
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  付款日期</label>
		                     <input class="ui-input validate[required,custom[date]] datepicker" type="text" name="d18_dt"  id="d18_dt" placeholder="yyyy-mm-dd">
		                </div>
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  备注</label>
		                    <input class="ui-input updateBusTotal validate[required]" type="text" name="d19_s"   id="d19_s">
		                </div>
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  录入人</label>
		                    <input class="ui-input updateBusTotal validate[required]" type="text" name="d20_s"   id="d20_s">
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
 
</@frame.html><#assign nowTag=.now?long><script type="text/javascript" language="javascript" src="/js/e6/func/cityMediaPlan_savefunc.js?t=${nowTag}"></script>


