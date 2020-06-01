<#macro html title="" left=true nav=true css=[] js=[]> <#assign
security=JspTaglibs["/WEB-INF/tlds/security.tld"] />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="shortcut icon" href="${rc.contextPath}/images/favicon.ico">
<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">
<title>${title!''}</title>
<script type="text/javascript" language="javascript"
	src="${rc.contextPath}/js/jquery.js"></script>

<!--<script type="text/javascript" language="javascript" src="${rc.contextPath}/js/jquery-1.11.3.min.js"></script>-->
<script type="text/javascript" language="javascript"
	src="${rc.contextPath}/js/jquery.form.js"></script>

<!--  <script type="text/javascript" language="javascript" src="${rc.contextPath}/js/jquery.min.js"></script>-->

<script type="text/javascript" language="javascript"
	src="${rc.contextPath}/js/validation/jquery.validationEngine.js"></script>
<script type="text/javascript" language="javascript"
	src="${rc.contextPath}/js/validation/jquery.validationEngine-zh_CN.js"></script>
<script type="text/javascript" language="javascript"
  	src="${rc.contextPath}/js/laytpl.js"></script>

	  <script type="text/javascript" language="javascript"
	src="/js/e6/func/fileApi_func.js?v=2&d=20200601170526"></script>

	
<!--
<script type="text/javascript" language="javascript"
	src="${rc.contextPath}/js/jquery.dataTables.js"></script>-->

	<!--
	<script type="text/javascript" language="javascript"
	src="http://cdn.datatables.net/1.10.7/js/jquery.dataTables.min.js"></script>-->
	<script type="text/javascript" language="javascript"
	src="${rc.contextPath}/js/jquery.dataTables-1.10.7.min.js"></script>


<!--<script type="text/javascript" language="javascript" src="${rc.contextPath}/js/jquery.dataTables-1.10.9.js"></script>-->

<script type="text/javascript" language="javascript"
	src="${rc.contextPath}/js/jquery-dataTables-fnNameOrdering.js"></script>
<script type="text/javascript" language="javascript"
	src="${rc.contextPath}/js/jquery-dataTables-fnNoColumnsParams.js"></script>
<script type="text/javascript" language="javascript"
	src="${rc.contextPath}/js/jquery-dataTables-fnCounterColumns.js"></script>
	<script type="text/javascript" language="javascript"
	src="${rc.contextPath}/js/jquery-dataTables-fnFakeRowspan.js"></script>
<script type="text/javascript" language="javascript"
	src="${rc.contextPath}/js/layer/layer.js"></script>
<script type="text/javascript" language="javascript"
	src="${rc.contextPath}/js/icheck.js"></script>
<script type="text/javascript" language="javascript"
	src="${rc.contextPath}/js/platform.js"></script>
<script type="text/javascript" language="javascript"
	src="${rc.contextPath}/js/index.js"></script>
<script type="text/javascript" language="javascript"
	src="${rc.contextPath}/js/common.js?v=20170516"></script>

<script type="text/javascript" language="javascript"
	src="/js/api.js?ng=20200422162557"></script>


<script type="text/javascript" language="javascript"
	src="${rc.contextPath}/js/address.js?v=20170516"></script>

<script type="text/javascript" language="javascript"
	src="${rc.contextPath}/js/banBackSpace.js"></script>
<script type="text/javascript" language="javascript"
	src="${rc.contextPath}/js/jquery.validate.js"></script>
<script type="text/javascript" language="javascript"
	src="${rc.contextPath}/js/jquery.ulmenu.js"></script>
<#list js as entry>
<script type="text/javascript" language="javascript"
	src="${rc.contextPath}/${entry}"></script>

</#list>


<script type="text/javascript" language="javascript"
	src="${rc.contextPath}/js/string.format.js"></script>

<script type="text/javascript" language="javascript"
	src="${rc.contextPath}/js/jquery-dataTables-checkboxSelect.js"></script>
<!--增加lay最新版本-->
<script type="text/javascript" language="javascript"
	src="${rc.contextPath}/js/layer-v1.9.3/layer/layer.js"></script>
<script type="text/javascript" language="javascript"
	src="${rc.contextPath}/js/layer.onload.js"></script>
<script type="text/javascript" language="javascript"
	src="${rc.contextPath}/js/layer-v1.9.3/layer-site.js?t=20171124"></script>


<!--增加pushlet-->
<script type="text/javascript" language="javascript" src="${rc.contextPath}/js/ajax-pushlet-client.js"></script>
<script type="text/javascript" language="javascript" src="${rc.contextPath}/js/ajax-pushlet-business.js"></script>

<link rel="stylesheet" type="text/css"
	href="${rc.contextPath}/css/sea.css">
<link rel="stylesheet" type="text/css"
	href="${rc.contextPath}/css/icheck-green.css">
<link rel="stylesheet" type="text/css"
	href="${rc.contextPath}/css/one.css">
<link rel="stylesheet" type="text/css"
	href="${rc.contextPath}/css/foot.css">
<link rel="stylesheet" type="text/css"
	href="${rc.contextPath}/css/account.css">
<link rel="stylesheet" type="text/css"
	href="${rc.contextPath}/css/page.css" media="screen" />
<link rel="stylesheet" type="text/css"
	href="${rc.contextPath}/css/jquery.dataTables.css">
<link rel="stylesheet" type="text/css"
	href="${rc.contextPath}/js/jquery-ui/jquery-ui.min.css">
<link rel="stylesheet" type="text/css"
	href="${rc.contextPath}/js/validation/validationEngine.jquery.css">
<link rel="stylesheet" type="text/css"
	href="${rc.contextPath}/css/table.css">
<link rel="stylesheet" type="text/css"
	href="${rc.contextPath}/css/city.css">
<!-- indexcss -->
<link rel="stylesheet" type="text/css"
	href="${rc.contextPath}/index_css/base.css">
<link rel="stylesheet" type="text/css"
	href="${rc.contextPath}/index_css/header.css">
<link rel="stylesheet" type="text/css"
	href="${rc.contextPath}/index_css/secondLevel.css">
<link rel="stylesheet" type="text/css"
	href="${rc.contextPath}/index_css/index_sea.css">
<#list css as entry>
<link rel="stylesheet" type="text/css" href="${rc.contextPath}/${entry}">
</#list>
<style type="text/css">
.ls-10 {
  width: 85%;
  float: left;
  margin-left: 30px;
}
.online-support {
	display: none;
	position: fixed;
	bottom: 20px;
	left: 20px;
	width: 80px;
	height: 32px;
}
</style>
</head>
<body>
	<header> <!--上部DIV--> <#include
	"${rc.contextPath}/index_menu/top.ftl" /> <!--下部DIV--> </header>

	<div class="page-container" style="margin-top: 4.5%">
		<div class="page-container">
			<div class="pg-container-main">
				<div class="container-12 mt10 s-clear">
					<#if nav>
					<!--顶部导航开始-->
					<div class="container-12">
						<ul class="breadcrumb m11 s-clear">
						</ul>
					</div>
					<!--顶部导航结束-->
					</#if> <#if left>
					<!--菜单开始-->
					<#include "../menu/left.ftl" /> </#if>
					<!--菜单结束-->

					<!--主体开始-->
					<div class="ls-10">
						<#nested> <br>
					</div>
					<!--主体结束-->
				</div>
			</div>
		</div>
	</div>
	<div class="online-support">
		<a target="_blank"
			href="http://wpa.qq.com/msgrd?v=3&uin=3070339185&site=qq&menu=yes"><img
			border="0" src="http://wpa.qq.com/pa?p=3:3070339185:3" alt="点击这里咨询"
			title="点击这里咨询" /></a>
	</div>
</body>
</html>
</#macro>
