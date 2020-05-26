<#import "../template/template.ftl" as frame> <#global menu="合同进度表"><@frame.html title="合同进度表"
js=["js/jquery-dateFormat.min.js","js/jquery-ui/jquery-ui.js","js/layer-v1.9.3/layer/layer.js","js/layer.onload.js","js/xksheet.js",
"js/datepicker.js","js/jquery.datepicker.region.cn.js","js/ajax-pushlet-client.js","js/ajax-pushlet-business.js","js/jquery-ui/jquery-ui.auto.complete.js"
,"js/jquery.doubleScroll.js","js/task.js","js/production_task.js"]
css=["css/sift.css","js/jquery-ui/jquery-ui.css","js/jquery-ui/jquery-ui.auto.complete.css","css/autocomplete.css"]>
<#include "../template/datatableExcelTools.ftl" />
<link rel="stylesheet" type="text/css" href="${rc.contextPath}/css/basecss.css">
<#assign security=JspTaglibs["/WEB-INF/tlds/security.tld"] />
<!--this file is generator by tools author:pxh mail:impanxh#gmail.com--> 

<input type="hidden" id="fromValue" value="list" />

<input type="hidden" id="cid" />

<div class="withdraw-wrap color-white-bg fn-clear">
<div class="withdraw-title">
        合同进度表 <input type="hidden" id="cid" /><a class="block-btn" onclick="addnewline('/-/cityMediaContract_save');" href="javascript:void(0);">新建</a>
    </div>
       

<table id="table" class="trclick display nowrap" cellspacing="0" >
		<thead>
			<tr>
                <th>操作</th>
              <!--  <th>待办动作</th>-->
	          	<th orderBy="c1_s_s" >客户</th>
	          	<th orderBy="c2_s_s" >省</th>
	          	<th orderBy="c3_s_s" >城市【市、县】</th>
	          	<th orderBy="c4_s_s" >合同性质</th>
	          	<th orderBy="c5_s_s" >公司名称</th>
	          	<th orderBy="c6_s_s" >收件地址</th>
	          	<th orderBy="c7_s_s" >联系人</th>
	          	<th orderBy="c8_s_s" >电话</th>
	          	<th orderBy="c9_s_s" >手机</th>
	          	<th orderBy="c10_dt" >媒介合同签订时间</th>
	          	<th orderBy="c11_s_s" >合同</th>
	          	<th orderBy="c12_s_s" >大协议</th>
	          	<th orderBy="营业执照" >资质证件</th>
	          	<th orderBy="c14_s_s" >资源授权</th>
	          	<th orderBy="c15_s_s" >发布周期</th>
	          	<th orderBy="c16_s_s" >上刊日期</th>
	          	<th orderBy="c17_s_s" >下刊日期</th>
	          	<th orderBy="c18_dt" >要求上画时间</th>
	          	<th orderBy="c19_s_s" >画面材质</th>
	          	<th orderBy="c20_d_d" >换画制作费（元）</th>
	          	<th orderBy="c21_d_d" >合同总额</th>
	          	<th orderBy="c22_s_s" >付款时间首次</th>
	          	<th orderBy="c23_d_d" >付款时间金额</th>
	          	<th orderBy="c24_s_s" >付款时间发票或收据</th>
	          	<th orderBy="c25_s_s" >付款时间二次</th>
	          	<th orderBy="c26_d_d" >付款时间金额</th>
	          	<th orderBy="c27_s_s" >付款时间发票或收据</th>
	          	<th orderBy="c28_s_s" >付款时间三次</th>
	          	<th orderBy="c29_d_d" >付款时间金额</th>
	          	<th orderBy="c30_s_s" >付款时间发票</th>
	          	<th orderBy="c31_d_d" >付款时间尾款</th>
	          	<th orderBy="c32_d_d" >付款时间金额</th>
	          	<th orderBy="c33_s_s" >付款时间发票或收据</th>
	          	<th orderBy="c34_s_s" >刊登车辆</th>
	          	<th orderBy="c35_s_s" >车牌/路线</th>
	          	<th orderBy="c36_s_s" >备注</th>
	          	<th orderBy="c37_s_s" >录入人</th>
	          	<th orderBy="c38_s_s" >评价</th>
            </tr>
		</thead>
	</table>
</div>
 
 
 
<#assign nowTag=.now?long>
<script type="text/javascript" language="javascript" src="/js/e6/DTable.js"></script>
<script type="text/javascript" language="javascript" src="/js/e6/cityMediaContract_Table_list.js?${nowTag}"></script>
<script type="text/javascript" language="javascript" src="/js/e6/func/cityMediaContract_savefunc.js?t=${nowTag}"></script>
</@frame.html>

