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
		<div class="withdraw-title">基础信息</div>
		<form data-name="withdraw" name="reportMsg" id="reportMsg" class="ui-form"
		method="post"
		enctype="multipart/form-data">
		<input type="hidden" name="className" value="R1_price"/>
		<input type="hidden" id="checkUniq" name="checkUniq" value="N"/>
		<input type="hidden" id="id" name="id" value="<@security.authentication property="principal.user.id"/>"/>
  		<input type="hidden" name="selectByField" value="id"/>
		<input type="hidden" name="task_ss" id="task_ss" value="1" />
		<input type="hidden" name="uniqId_s" id ="uniqId_s" value=""/>
		<input type="hidden" name="creator_s" id="creator_s"  value=""/>
		<div class="withdrawInputs" id="baseinfoedit" style="width: 100%; ">
			<div class="inputs" style="float: left;">
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  省份</label>
                            <select data-is="isAmount isEnough" onchange="provincechange()" class="province validate[required]" name="b2_s" id="b2_s" autocomplete="off" disableautocomplete="" style="width: 220px; height: 35px;">
                            <option>请选择省份</option>
                            </select>
		                </div>
	          		 
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  地区</label>
                            <select data-is="isAmount isEnough" class="city validate[required]" name="b3_s" id="b3_s" autocomplete="off" disableautocomplete="" style="width: 220px; height: 35px;">
                            <option>请选择地区</option>
                            </select>
		                </div>
	          		 
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  人口(万人)</label>
		                    <input class="ui-input updateBusTotal validate[required]" type="text" name="b4_s"   id="b4_s">
		                </div>
	          		 
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  GDP（百万元）</label>
		                    <input class="ui-input updateBusTotal validate[required]" type="text" name="b5_s"   id="b5_s">
		                </div>
	          		 
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  发布形式</label>
                            <select data-is="isAmount isEnough" class="validate[required]" name="b6_s" id="b6_s" autocomplete="off" disableautocomplete="" style="width: 220px; height: 35px;">
								<option value="双层全包">双层全包</option>
								<option value="双层三侧">双层三侧</option>
								<option value="双层两侧">双层两侧</option>
								<option value="单层全包">单层全包</option>
								<option value="单层半全包">单层半全包</option>
								<option value="单层三侧">单层三侧</option>
								<option value="单层两侧">单层两侧</option>
							</select>
		                </div>
	          		 
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  线路级别</label>
		                    <input class="ui-input updateBusTotal validate[required]" type="text" name="b7_s"   id="b7_s">
		                </div>
	          		 
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  线路</label>
                            <textarea rows="4" cols="30" data-is="isAmount isEnough validate[required]" style="resize: none;" name="b8_s" id="b8_s"></textarea>
		                </div>
	          		 
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  车型</label>
                            <select data-is="isAmount isEnough" class="validate[required]" name="b9_s" id="b9_s" autocomplete="off" disableautocomplete="" style="width: 220px; height: 35px;">
								<option value="双层巴士">双层巴士</option>
								<option value="单层巴士">单层巴士</option>
								<option value="单层中巴">单层中巴</option>
								<option value="单层小巴">单层小巴</option>
							</select>

		                </div>
	          		 
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  车长（米）</label>
		                    <input class="ui-input updateBusTotal validate[required]" type="text" name="b10_s"   id="b10_s">
		                </div>
	          		 
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  最小投放周期</label>
                            <select data-is="isAmount isEnough" class="validate[required]" name="b11_s" id="b11_s" autocomplete="off" disableautocomplete="" style="width: 220px; height: 35px;">
								<option value="1个月">1个月</option>
								<option value="3个月">3个月</option>
								<option value="9个月">9个月</option>
								<option value="12个月">12个月</option>
							</select>
		                </div>
	          		 
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  刊例价一个月（元/辆）</label>
		                    <input class="ui-input updateBusTotal validate[required]" type="text" name="b12_s"   id="b12_s">
		                </div>
	          		 
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  刊例价三个月（元/辆）</label>
		                    <input class="ui-input updateBusTotal validate[required]" type="text" name="b13_s"   id="b13_s">
		                </div>
	          		 
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  刊例价半年（元/辆）</label>
		                    <input class="ui-input updateBusTotal validate[required]" type="text" name="b14_s"   id="b14_s">
		                </div>
	          		 
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  刊例价一年（元/辆）</label>
		                    <input class="ui-input updateBusTotal validate[required]" type="text" name="b15_s"   id="b15_s">
		                </div>
	          		 
			</div>

			<div class="inputs" style="float: right;  margin-right: 80px;">
			
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  折扣</label>
		                    <input class="ui-input updateBusTotal validate[required]" type="text" name="b16_s"   id="b16_s">
		                </div>
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  折后价一个月（元/辆）</label>
		                    <input class="ui-input updateBusTotal validate[required]" type="text" name="b17_s"   id="b17_s">
		                </div>
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  折后价三个月（元/辆）</label>
		                    <input class="ui-input updateBusTotal validate[required]" type="text" name="b18_s"   id="b18_s">
		                </div>
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  折后价半年（元/辆）</label>
		                    <input class="ui-input updateBusTotal validate[required]" type="text" name="b19_s"   id="b19_s">
		                </div>
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  折后价一年（元/辆）</label>
		                    <input class="ui-input updateBusTotal validate[required]" type="text" name="b20_s"   id="b20_s">
		                </div>
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  制作费（元/次/辆）</label>
		                    <input class="ui-input updateBusTotal validate[required]" type="text" name="b21_s"   id="b21_s">
		                </div>
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  城市公交总数量、线路总数量</label>
		                    <input class="ui-input updateBusTotal validate[required]" type="text" name="b22_s"   id="b22_s">
		                </div>
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  归属资源方及资源情况</label>
		                    <input class="ui-input updateBusTotal validate[required]" type="text" name="b23_s"   id="b23_s">
		                </div>
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  资源方服务等级A/B/C</label>
		                    <input class="ui-input updateBusTotal validate[required]" type="text" name="b24_s"   id="b24_s">
		                </div>
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  是否合作过-合作时间</label>
		                    <textarea rows="4" cols="30" data-is="isAmount isEnough"
					  		  style="resize: none;" id="b25_s" name="b25_s"></textarea>
		                </div>
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  是否有第三方广告</label>
		                    <input class="ui-input updateBusTotal validate[required]" type="text" name="b26_s"   id="b26_s">
		                </div>
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  备注</label>
                            <textarea rows="4" cols="30" data-is="isAmount isEnough validate[required]" style="resize: none;" name="b27_s" id="b27_s"></textarea>
		                </div>
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  排查人</label>
		                    <input class="ui-input updateBusTotal validate[required]" type="text" name="b28_s"   id="b28_s">
		                </div>
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  更新时间</label>
		                     <input class="ui-input validate[required,custom[date]] datepicker" type="text" name="b29_dt"  id="b29_dt" placeholder="yyyy-mm-dd">
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
 
</@frame.html><#assign nowTag=.now?long><script type="text/javascript" language="javascript" src="/js/e6/func/cityMediaPrice_savefunc.js?t=${nowTag}"></script>


