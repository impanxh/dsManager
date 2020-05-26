<#import "../template/template.ftl" as frame> <#global menu="付款进度表"><@frame.html title="付款进度表"
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
        付款进度表 <input type="hidden" id="cid" /><a class="block-btn" onclick="addnewline('/-/cityMediaPlan_save');" href="javascript:void(0);">新建</a>
    </div>
       

<table id="table" class="trclick display nowrap" cellspacing="0">
		<thead>
			<tr>
                <th>操作</th>
              <!--  <th>待办动作</th>-->
	          	<th orderBy="d1_s_s" >客户</th>
	          	<th orderBy="d2_s_s" >省份</th>
	          	<th orderBy="d3_s_s" >县（市）</th>
	          	<th orderBy="d4_s_s" >合同性质</th>
	          	<th orderBy="d5_s_s" >联系人</th>
	          	<th orderBy="d6_s_s" >公司名称</th>
	          	<th orderBy="d7_s_s" >银行</th>
	          	<th orderBy="d8_s_s" >银行账号</th>
	          	<th orderBy="d9_d_d" >合同总额（元）</th>
	          	<th orderBy="d10_s_s" >发票类型</th>
	          	<th orderBy="d11_d_d" >首付款（元）</th>
	          	<th orderBy="d12_dt" >付款日期</th>
	          	<th orderBy="d13_d_d" >二次付款</th>
	          	<th orderBy="d14_dt" >付款日期</th>
	          	<th orderBy="d15_d_d" >三次付款</th>
	          	<th orderBy="d16_dt" >付款日期</th>
	          	<th orderBy="d17_d_d" >尾款</th>
	          	<th orderBy="d18_dt" >付款日期</th>
	          	<th orderBy="d19_s_s" >备注</th>
	          	<th orderBy="d20_s_s" >录入人</th>
            </tr>
		</thead>
	</table>
</div>
 
 
 
<#assign nowTag=.now?long>
<script type="text/javascript" language="javascript" src="/js/e6/DTable.js"></script>
<script type="text/javascript" language="javascript" src="/js/e6/cityMediaPlan_Table_list.js?${nowTag}"></script>
<script type="text/javascript" language="javascript" src="/js/e6/func/cityMediaPlan_savefunc.js?t=${nowTag}"></script>
</@frame.html>

