<#import "../template/template.ftl" as frame> <#global menu="车内挂版管理"><@frame.html title="车内挂版管理"
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
        车内挂版管理 <input type="hidden" id="cid" /><a class="block-btn" onclick="addnewline('/-/linkplate_save');" href="javascript:void(0);">新建</a>
    </div>
       

<table id="table" class="trclick display nowrap" cellspacing="0"  style="width: 100%;" >
		<thead>
			<tr>
                <th>操作</th>
              <!--  <th>待办动作</th>-->
	          	<th orderBy="lineName_s_s" >所属线路</th>
	          	<th orderBy="company_s_s" >所属公司</th>
	          	<th orderBy="serianumber_s_s" >车号</th>
	          	<th orderBy="plateNumber_s_s" >牌照号</th>
	          	<th orderBy="type_s_s" >车辆性质</th>
	          	<th orderBy="model_s_s" >车型</th>
	          	<th orderBy="number_s_s" >挂板数量</th>
	          	<th orderBy="adcontext_s_s" >上刊内容</th>
	          	<th orderBy="start_dt" >实际上刊时间</th>
	          	<th orderBy="end_dt" >预计下刊时间</th>
	          	<th orderBy="comment_s_s" >备注</th>
            </tr>
		</thead>
	</table>
</div>
 
 
 
<#assign nowTag=.now?long>
<script type="text/javascript" language="javascript" src="/js/e6/DTable.js"></script>
<script type="text/javascript" language="javascript" src="/js/e6/linkplate_Table_list.js?${nowTag}"></script>
<script type="text/javascript" language="javascript" src="/js/e6/func/linkplate_savefunc.js?t=${nowTag}"></script>
</@frame.html>

