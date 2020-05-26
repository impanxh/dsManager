<#assign security=JspTaglibs["/WEB-INF/tlds/security.tld"] />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

</head>
<script type="text/javascript">
	function logout() {
		window.location.href = "${rc.contextPath}/logout";
	}
	/**
	 * 查看购物车判断登陆状态
	 */
	function tocard(pathurl) {
		var lc = $("#lc").val();
		if (lc == "0") {
			islogin(pathurl);
		}
		if (lc == "1") {
			window.location.href = pathurl + "/toCard";
		}
	}
	/* 
	 $(function() {
	 $("#city_dropdown a:not(.selected)").click(function(){
	 var cityName = $(this).parents("#ttbar-mycity")[0]?$(this).attr("data-id") : $("#ttbar-mycity a.selected").attr("data-id");
	 var media = $(this).parents("#ttbar-media")[0]?$(this).attr("data-id") : $("#ttbar-media a.selected").attr("data-id");
	 if (!cityName)
	 cityName = '北京';
	 if (!media)
	 media = 'screen';
	 $.ajax({
	 url : "${rc.contextPath}/f/city/select?c=" + cityName + "&m="+media,
	 type : "POST",
	 data: {},
	 success : function(data) {
	 layer.msg("正在切换到："+ data.name + " " + data.mediaTypeName);
	 var uptime = window.setTimeout(function(){
	 window.location.reload();
	 clearTimeout(uptime);
	 },1000);
	 }
	 }, "text");
	 });
	 }); */
</script>
<style type="text/css">
</style>
<#if _utype?? && _utype == 'body'>
<div class="logo_bus"></div>
<#elseif _utype?? && _utype == 'screen'>
<div class="logo_screen"></div>
<#else>
<div onClick="" class="logo2" style="width:310px;padding-top:10px;font-size:20px;" >地市媒体管理系统</div>
</#if>
<nav class="menu">
<ul class="list-line">
</ul>
<div class="s-right s-clear">

	<span class="pg-nav-item s-left">您好，</span> <span>
		<@security.authorize access="isAuthenticated()">  <#if medetype?? &&
		medetype=="screen"> <a class="pg-nav-item s-left"
		href="#"> <#else> <a
			class="pg-nav-item s-left"
			href="#"> </#if> 我的账户:
				<@security.authentication property="principal.username" />
			</@security.authorize> 
			
			
			
			<@security.authorize access="!
			isAuthenticated()"> <a class="pg-nav-item s-left"
			href="${rc.contextPath}/login">请登录</a> <a class="pg-nav-item s-left"
			href="${rc.contextPath}/register">免费注册</a> </@security.authorize> 
	</span> <#--<span class="arrow-down"></span>-->
	<!--<a class="pg-nav-item s-left" href="#">
									<i class="icon-msg fsize-12">1</i>
									消息
								</a> -->
	<!--<a class="pg-nav-item s-left" href="#">帮助</a>
								<a class="pg-nav-item s-left" href="#">论坛</a>-->
	<@security.authorize access="isAuthenticated()"> 
	<!--
		<a
		class="pg-nav-item s-left" href="${rc.contextPath}/message/all">消息<span
		id="msgNumber" class="layer-tips" style="color: #ff9966"></span></a> 
		-->
		
		<span
		class="pg-nav-item s-left"> <#if _utype?? && _utype ==
		'screen'> <a onclick="tocard('${rc.contextPath}');"><img
			class="shop_icon" alt=""
			src="${rc.contextPath}/index_img/icon_cart.png"> <span
			id="cardCount_top" style="color: #ff9966"></span> </#if> </a>
	</span> <@security.authorize access="isAuthenticated()"> <input type="hidden"
		id="lc" value="1" /> </@security.authorize> <@security.authorize
	access="! isAuthenticated()"> <input type="hidden" id="lc" value="0" />
	</@security.authorize> <@security.authorize access="isAuthenticated()">
	<a href="javascript:;" class="pg-nav-item s-left" onclick="logout();">[退出]</a>
	</@security.authorize> </@security.authorize>
</div>
</nav>



<script type="text/javascript" language="javascript"
	src="${rc.contextPath}/js/layer/layer.js"></script>
<!--增加lay最新版本-->
<script type="text/javascript" language="javascript"
	src="${rc.contextPath}/js/layer-v1.9.3/layer/layer.js"></script>
<script type="text/javascript" language="javascript"
	src="${rc.contextPath}/js/layer.onload.js"></script>
<script type="text/javascript" language="javascript"
	src="${rc.contextPath}/js/layer-v1.9.3/layer-site.js"></script>
<script type="text/javascript">
	/**
	 * 查看购物车判断登陆状态
	 */
	function tocard(pathurl) {
		var lc = $("#lc").val();
		if (lc == "0") {
			islogin(pathurl);
		}
		if (lc == "1") {
			window.location.href = pathurl + "/toCard";
		}
	}
</script>