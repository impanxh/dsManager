<#import "../template/template.ftl" as frame> <#global menu="站杆管理"><@frame.html title="站杆管理"
js=["js/jquery-dateFormat.min.js","js/jquery-ui/jquery-ui.js","js/layer-v1.9.3/layer/layer.js","js/layer.onload.js","js/xksheet.js",
"js/datepicker.js","js/jquery.datepicker.region.cn.js","js/ajax-pushlet-client.js","js/ajax-pushlet-business.js","js/jquery-ui/jquery-ui.auto.complete.js"
,"js/jquery.doubleScroll.js","js/task.js","js/production_task.js"]
css=["css/sift.css","js/jquery-ui/jquery-ui.css","js/jquery-ui/jquery-ui.auto.complete.css","css/autocomplete.css"]>

<link rel="stylesheet" type="text/css" href="${rc.contextPath}/css/basecss.css">
<#assign security=JspTaglibs["/WEB-INF/tlds/security.tld"] />
<!--this file is generator by tools author:pxh mail:impanxh#gmail.com--> 

<input type="hidden" id="fromValue" value="list" />

<input type="hidden" id="cid" />

<div class="withdraw-wrap color-white-bg fn-clear">
<div class="withdraw-title">
        站杆管理 <input type="hidden" id="cid" /><a class="block-btn" onclick="addnewline('/-/busStationLogo_save');" href="javascript:void(0);">新建</a>
    </div>
       

<table id="table" class="trclick display nowrap" cellspacing="0"  >
		<thead>
			<tr>
                <th>操作</th>
                <th>待办动作</th>
	          	<th orderBy="number_s_s" >站杆编号</th>
	          	<th orderBy="category_s_s" >站杆类别</th>
	          	<th orderBy="type_s_s" >站杆类型</th>
	          	<th orderBy="area_s_s" >区域</th>
	          	<th orderBy="street_s_s" >所属街道</th>
	          	<th orderBy="orientation_s_s" >方向</th>
	          	<th orderBy="name_s_s" >站名</th>
	          	<th orderBy="states_s_s" >媒体状况</th>
	          	<th orderBy="buildyear_s_s" >建成年份</th>
	          	<th orderBy="changeyear_s_s" >改造年份</th>
	          	<th orderBy="removeyear_s_s" >拆除年份</th>
	          	<th orderBy="remark_s_s" >备注</th>
            </tr>
		</thead>
	</table>
</div>
 
 
 
<#assign nowTag=.now?long>
<script type="text/javascript" language="javascript" src="/js/e6/DTable.js"></script>
<script type="text/javascript" language="javascript" src="/js/e6/busStationLogo_Table_list.js?${nowTag}"></script>
<script type="text/javascript" language="javascript" src="/js/e6/func/busStationLogo_savefunc.js?t=${nowTag}"></script>
</@frame.html>

