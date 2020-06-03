<#import "../template/template.ftl" as frame> <#global menu="公交车报价表"><@frame.html title="公交车报价表"
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
        公交车报价表 <input type="hidden" id="cid" /><a class="block-btn" onclick="addnewline('/-/cityMediaPrice_save');" href="javascript:void(0);">新建</a>
    </div>
       

<table id="table" class="trclick display nowrap" cellspacing="0"  >
		<thead>
			<tr>
                <th>操作</th>
              <!--  <th>待办动作</th>-->
	          	<th orderBy="b2_s_s" >省份</th>
	          	<th orderBy="b3_s_s" >地区</th>
	          	<th orderBy="b4_s_s" >人口(万人)</th>
	          	<th orderBy="b5_s_s" >GDP（百万元）</th>
	          	<th orderBy="b6_s_s" >发布形式</th>
	          	<th orderBy="b7_s_s" >线路级别</th>
	          	<th orderBy="b8_s_s" >线路</th>
	          	<th orderBy="b9_s_s" >车型</th>
	          	<th orderBy="b10_s_s" >车长（米）</th>
	          	<th orderBy="b11_s_s" >最小投放周期</th>
	          	<th orderBy="b12_s_s" >刊例价一个月（元/辆）</th>
	          	<th orderBy="b13_s_s" >刊例价三个月（元/辆）</th>
	          	<th orderBy="b14_s_s" >刊例价半年（元/辆）</th>
	          	<th orderBy="b15_s_s" >刊例价一年（元/辆）</th>
	          	<th orderBy="b16_s_s" >折扣</th>
	          	<th orderBy="b17_s_s" >折后价一个月（元/辆）</th>
	          	<th orderBy="b18_s_s" >折后价三个月（元/辆）</th>
	          	<th orderBy="b19_s_s" >折后价半年（元/辆）</th>
	          	<th orderBy="b20_s_s" >折后价一年（元/辆）</th>
	          	<th orderBy="b21_s_s" >制作费（元/次/辆）</th>
	          	<th orderBy="b22_s_s" >城市公交总数量、线路总数量</th>
	          	<th orderBy="b23_s_s" >归属资源方及资源情况</th>
	          	<th orderBy="b24_s_s" >资源方服务等级A/B/C</th>
	          	<th orderBy="b25_s_s" >是否合作过-合作时间</th>
	          	<th orderBy="b26_s_s" >是否有第三方广告</th>
	          	<th orderBy="b27_s_s" >备注</th>
	          	<th orderBy="b28_s_s" >排查人</th>
	          	<th orderBy="b29_dt" >更新时间</th>
            </tr>
		</thead>
	</table>
</div>
 
 
 
<#assign nowTag=.now?long>
<script type="text/javascript" language="javascript" src="/js/e6/DTable.js"></script>
<script type="text/javascript" language="javascript" src="/js/e6/cityMediaPrice_Table_list.js?${nowTag}"></script>
<script type="text/javascript" language="javascript" src="/js/e6/func/cityMediaPrice_savefunc.js?t=${nowTag}"></script>
</@frame.html>

 <#--  style="width:200px !important;overflow: hidden;"  -->