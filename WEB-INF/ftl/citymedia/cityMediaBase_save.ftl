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
		<input type="hidden" name="className" value="R1_base"/>
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
                            <select data-is="isAmount isEnough" onchange="provincechange()" class="province validate[required]" name="a2_s" id="a2_s" autocomplete="off" disableautocomplete="" style="width: 220px; height: 35px;">
                            <option>请选择省份</option>
                            </select>
		                </div>
	          		 
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  地区</label>
                            <select data-is="isAmount isEnough" class="city validate[required]" name="a3_s" id="a3_s" autocomplete="off" disableautocomplete="" style="width: 220px; height: 35px;">
                            <option>请选择地区</option>
                            </select>
		                </div>
	          		 
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  GDP(百万元) </label>
		                    <input class="ui-input updateBusTotal validate[required]" type="text" name="a4_s"   id="a4_s">
		                </div>
	          		 
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  县域人口（万人）</label>
		                    <input class="ui-input updateBusTotal validate[required]" type="text" name="a5_i"   id="a5_i">
		                </div>
	          		 
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  覆盖乡镇</label>
		                    <input class="ui-input updateBusTotal validate[required]" type="text" name="a6_s"   id="a6_s">
		                </div>
	          		 
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  运管所 电话</label>
		                    <input class="ui-input updateBusTotal validate[required]" type="text" name="a7_s"   id="a7_s">
		                </div>
	          		 
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  是否有合作</label>
		                    <input class="ui-input updateBusTotal validate[required]" type="text" name="a8_s"   id="a8_s">
		                </div>
	          		 
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  联系情况</label>
		                    <input class="ui-input updateBusTotal validate[required]" type="text" name="a9_s"   id="a9_s">
		                </div>
	          		 
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  媒体类型</label>
		                    <input class="ui-input updateBusTotal validate[required]" type="text" name="a10_s"   id="a10_s">
		                </div>
	          		 
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  公交公司</label>
		                    <input class="ui-input updateBusTotal validate[required]" type="text" name="a11_s"   id="a11_s">
		                </div>
	          		 
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  联系人</label>
		                    <input class="ui-input updateBusTotal validate[required]" type="text" name="a12_s"   id="a12_s">
		                </div>
	          		 
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  职位</label>
		                    <input class="ui-input updateBusTotal validate[required]" type="text" name="a13_s"   id="a13_s">
		                </div>
	          		 
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  电话</label>
		                    <input class="ui-input updateBusTotal validate[required]" type="text" name="a14_s"   id="a14_s">
		                </div>
	          		 
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  手机／小灵通</label>
		                    <input class="ui-input updateBusTotal validate[required]" type="text" name="a15_s"   id="a15_s">
		                </div>
	          		 
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  传真</label>
		                    <input class="ui-input updateBusTotal validate[required]" type="text" name="a16_s"   id="a16_s">
		                </div>
	          		 
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  其它联系方式</label>
		                    <input class="ui-input updateBusTotal validate[required]" type="text" name="a17_s"   id="a17_s">
		                </div>
	          		 
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  代理公司</label>
		                    <input class="ui-input updateBusTotal validate[required]" type="text" name="a18_s"   id="a18_s">
		                </div>
	          		 
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  联系人</label>
		                    <input class="ui-input updateBusTotal validate[required]" type="text" name="a19_s"   id="a19_s">
		                </div>
	          		 
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  职位</label>
		                    <input class="ui-input updateBusTotal validate[required]" type="text" name="a20_s"   id="a20_s">
		                </div>
	          		 
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  电话</label>
		                    <input class="ui-input updateBusTotal validate[required]" type="text" name="a21_s"   id="a21_s">
		                </div>
	          		 
			</div>

			<div class="inputs" style="float: right;  margin-right: 80px;">
			
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  手机</label>
		                    <input class="ui-input updateBusTotal validate[required]" type="text" name="a22_s"   id="a22_s">
		                </div>
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  传真</label>
		                    <input class="ui-input updateBusTotal validate[required]" type="text" name="a23_s"   id="a23_s">
		                </div>
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  其它联系方式</label>
		                    <input class="ui-input updateBusTotal validate[required]" type="text" name="a24_s"   id="a24_s">
		                </div>
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  城内/城乡</label>
		                    <input class="ui-input updateBusTotal validate[required]" type="text" name="a25_s"   id="a25_s">
		                </div>
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  公交车数量</label>
		                    <input class="ui-input updateBusTotal validate[required]" type="text" name="a26_s"   id="a26_s">
		                </div>
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  可刊登公交车数量</label>
		                    <input class="ui-input updateBusTotal validate[required]" type="text" name="a27_s"   id="a27_s">
		                </div>
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  一年报价（元/年/辆）</label>
		                    <input class="ui-input updateBusTotal validate[required]" type="text" name="a28_s"   id="a28_s">
		                </div>
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  半年报价（元/年/辆）</label>
		                    <input class="ui-input updateBusTotal validate[required]" type="text" name="a29_s"   id="a29_s">
		                </div>
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  制作安装费/换画费用</label>
		                    <input class="ui-input updateBusTotal validate[required]" type="text" name="a30_d"   id="a30_d">
		                </div>
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  制作周期</label>
		                    <input class="ui-input updateBusTotal validate[required]" type="text" name="a31_s"   id="a31_s">
		                </div>
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  谈判后价格</label>
		                    <input class="ui-input updateBusTotal validate[required]" type="text" name="a32_d"   id="a32_d">
		                </div>
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  车型</label>
		                    <input class="ui-input updateBusTotal validate[required]" type="text" name="a33_s"   id="a33_s">
		                </div>
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  车长</label>
		                    <input class="ui-input updateBusTotal validate[required]" type="text" name="a34_s"   id="a34_s">
		                </div>
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  发布位置（勾选即可）</label>
		                    <select class="ui-input validate[required]" type="text" name="a35_s" id="a35_s" value="" >
		                           			<option value="左侧">左侧</option>   
		                           			<option value="右侧">右侧</option>   
		                           			<option value="车头">车头</option>   
		                           			<option value="车尾">车尾</option>   
                   		   </select>
		                </div>
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  备注</label>
                            <textarea rows="4" cols="30" data-is="isAmount isEnough validate[required]" style="resize: none;" name="a39_s" id="a39_s"></textarea>
		                </div>
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  收件地址</label>
                            <textarea rows="4" cols="30" data-is="isAmount isEnough validate[required]" style="resize: none;" name="a40_s" id="a40_s"></textarea>
		                </div>
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  排查人</label>
		                    <input class="ui-input updateBusTotal validate[required]" type="text" name="a41_s"   id="a41_s">
		                </div>
		                 <div class="ui-form-item">
							<label class="ui-label mt10">  时间</label>
		                     <input class="ui-input validate[required,custom[date]] datepicker" type="text" name="a42_dt"  id="a42_dt" placeholder="yyyy-mm-dd">
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
 
</@frame.html><#assign nowTag=.now?long><script type="text/javascript" language="javascript" src="/js/e6/func/cityMediaBase_savefunc.js?t=${nowTag}"></script>


