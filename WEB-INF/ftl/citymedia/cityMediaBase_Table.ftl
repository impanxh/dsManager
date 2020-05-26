<#import "../template/template.ftl" as frame> <#global menu="基础信息"><@frame.html title="基础信息"
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
        基础信息 <input type="hidden" id="cid" /><a class="block-btn" onclick="addnewline('/-/cityMediaBase_save');" href="javascript:void(0);">新建</a>
    </div>
       

<table id="table" class="trclick display nowrap" cellspacing="0" >
		<thead>
			<tr>
                <th>操作</th>
              <!--  <th>待办动作</th>-->
	          	<th orderBy="a2_s_s" >地区</th>
	          	<th orderBy="a3_s_s" >县（市）</th>
	          	<th orderBy="a4_s_s" >GDP(百万元) </th>
	          	<th orderBy="a5_i_i" >县域人口（万人）</th>
	          	<th orderBy="a6_s_s" >覆盖乡镇</th>
	          	<th orderBy="a7_s_s" >运管所 电话</th>
	          	<th orderBy="a8_s_s" >是否有合作</th>
	          	<th orderBy="a9_s_s" >联系情况</th>
	          	<th orderBy="a10_s_s" >媒体类型</th>
	          	<th orderBy="a11_s_s" >公交公司</th>
	          	<th orderBy="a12_s_s" >联系人</th>
	          	<th orderBy="a13_s_s" >职位</th>
	          	<th orderBy="a14_s_s" >电话</th>
	          	<th orderBy="a15_s_s" >手机／小灵通</th>
	          	<th orderBy="a16_s_s" >传真</th>
	          	<th orderBy="a17_s_s" >其它联系方式</th>
	          	<th orderBy="a18_s_s" >代理公司</th>
	          	<th orderBy="a19_s_s" >联系人</th>
	          	<th orderBy="a20_s_s" >职位</th>
	          	<th orderBy="a21_s_s" >电话</th>
	          	<th orderBy="a22_s_s" >手机</th>
	          	<th orderBy="a23_s_s" >传真</th>
	          	<th orderBy="a24_s_s" >其它联系方式</th>
	          	<th orderBy="a25_s_s" >城内/城乡</th>
	          	<th orderBy="a26_s_s" >公交车数量</th>
	          	<th orderBy="a27_s_s" >可刊登公交车数量</th>
	          	<th orderBy="a28_s_s" >一年报价（元/年/辆）</th>
	          	<th orderBy="a29_s_s" >半年报价（元/年/辆）</th>
	          	<th orderBy="a30_d_d" >制作安装费/换画费用</th>
	          	<th orderBy="a31_s_s" >制作周期</th>
	          	<th orderBy="a32_d_d" >谈判后价格</th>
	          	<th orderBy="a33_s_s" >车型</th>
	          	<th orderBy="a34_s_s" >车长</th>
	          	<th orderBy="a35_s_s" >发布位置（勾选即可）</th>
	          	<th orderBy="a39_s_s" >备注</th>
	          	<th orderBy="a40_s_s" >收件地址</th>
	          	<th orderBy="a41_s_s" >排查人</th>
	          	<th orderBy="a42_dt" >时间</th>
            </tr>
		</thead>
	</table>
</div>
 
 
 
<#assign nowTag=.now?long>
<script type="text/javascript" language="javascript" src="/js/e6/DTable.js"></script>
<script type="text/javascript" language="javascript" src="/js/e6/cityMediaBase_Table_list.js?${nowTag}"></script>
<script type="text/javascript" language="javascript" src="/js/e6/func/cityMediaBase_savefunc.js?t=${nowTag}"></script>
</@frame.html>

