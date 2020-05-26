<#assign security=JspTaglibs["/WEB-INF/tlds/security.tld"] />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <title>场所用户管理</title>
    <meta content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0" name="viewport" />
    <meta content="yes" name="apple-mobile-web-app-capable" />
    <meta content="black" name="apple-mobile-web-app-status-bar-style" />
    <meta content="telephone=no" name="format-detection" />
    <!-- 引入YDUI样式 -->
    <link rel="stylesheet" href="${rc.contextPath}/ydui_css/ydui.css" />
    <link rel="stylesheet" href="${rc.contextPath}/css/demo.css" />
    <!-- 引入jQuery 2.0+ -->
<script src="${rc.contextPath}/js/jquery-2.0.2.min.js"></script>
    <!-- 引入YDUI自适应解决方案类库 -->
    <script src="${rc.contextPath}/ydui_js/ydui.flexible.js"></script>
    <script src="${rc.contextPath}/js/address.js"></script>
    <script src="${rc.contextPath}/js/common.js"></script>
        <!-- 引入YDUI脚本 -->
<script type="text/javascript" language="javascript"
    src="${rc.contextPath}/js/vue.min.js"></script>
<script src="${rc.contextPath}/ydui_js/template.js"></script>
<script src="${rc.contextPath}/ydui_js/ydui.js"></script>
<script src="${rc.contextPath}/ydui_js/ydui-list.js"></script>
<script src="${rc.contextPath}/js/jquery.cookie.js"></script>

<script src="${rc.contextPath}/js/jquery.form.js"></script>
<script src="${rc.contextPath}/js/preCaution.js"></script>


</head>
<body>
<section class="g-flexview">
    <header class="m-navbar">
        <a href="${rc.contextPath}/placebase" class="navbar-item" id="backto"><i class="back-ico"></i></a>
        <div class="navbar-center" style="    margin-left: 45%;"><span class="navbar-title" id="">用户列表</span></div>
        <a href="${rc.contextPath}/unitUserAdd" class="navbar-item" id = "adbutton"   >添加用户</a>
    </header>

     

      <section class="g-scrollview" id="J_List">
      <h1 class="demo-pagetitle" id="unitTitle">单位用户信息列表</h1>
      

        <!--<div class="m-search" >
            <input type="search" id="search-name" class="search-input" placeholder="Search">
            <a  href="javascript:void(0)" onclick="submitSubject()" >
                <i class="icon-user"  id="search-i" ></i>
            </a>
        </div>-->
        <div id="J_ListContent" class="m-list list-theme1"></div>
</section>


</section>
<!--底部DIV -->
 <#include "/menu/foot.ftl" />
<!--底部DIV -->
<script id="J_templete" type="text/html">
        <div class="m-cell"  >
             {{each list as data}}
            <!-- <a href="${rc.contextPath}/unitEdit?placeId={{data.id}}&edit=1" -->
            <a href="${rc.contextPath}/unitUserAdd?unit={{data.utype}}&u={{data.username}}&op=1" class="cell-item J_Link"<#-- j_link比较重要需要加--> data-page="{{page}}">
                <div class="cell-left"> 
                    {{data.username}}|{{data.legalman}}
                    <input type="hidden" id="placeId"  v-bind:value="data.id" >
                </div>
                <div class="cell-right cell-arrow">{{data.phone}}</div>
            </a>
             {{/each}}
        </div>
   
   
</script>



<script type="text/javascript">
    var dialog = YDUI.dialog;

    $(function(){
    
    if(isNotNull(getQueryString("_"))  && getQueryString("_")!=null){//来自删除用户的请求 强制刷新一下
    	window.location.href="/placeUser?unit="+getQueryString("unit");
    }
    
     var listRequestJsong={
     "pageSize":10,"start":0,"page":1,
     "templeteDivId":"J_templete",//vue script templete id
     "sectionId":'J_List',//vue 最外层显示数据的section id
     "listContent_id":"J_ListContent"//vue 二层内容id
     };



        var loadMore = function (callback) {
            var searchName= getQueryString("subject_name");
            searchName = $.cookie('cookieName'); 
            $('#search-name').val(searchName);
            console.log(searchName);

            $.ajax({
                url: '/sys/user-list',
                type: 'GET',
                async : false,
                data: {
                    start: listRequestJsong.start,
                    length: listRequestJsong.pageSize,
                    "filter[utype]":getQueryString("unit")
                },
                success: function (ret) {
                    typeof callback == 'function' && callback(ret);
                }
            });
        };
       loadScrollTable(listRequestJsong,loadMore);
	
	
		  var s = queryUserGroup('<@security.authentication property="principal.username" />');
             if(isNotNull(s) && s[1] == '*'){
             //	$('#adbutton').show();
             }
             $('#backto').attr("href","/placebase?unit="+getQueryString("unit")); 
          	$('#adbutton').attr("href","/unitUserAdd?unit="+getQueryString("unit")); 
       
     // $('#search-i').click(function(){
     //    // $('#J_ListContent').empty();
     //    // $('.list-donetip').remove();
     //    // listRequestJsong.start=0;
     //    // listRequestJsong.page=1;
     //    // loadScrollTable(listRequestJsong,loadMore);
     //    console.log($('#search-name').val());
     //    window.location.href="/placeManage?searchName="+$('#search-name').val();
        
     // })
 })     

    function submitSubject(){
        $.cookie('cookieName', $('#search-name').val()); 
        console.log($('#search-name').val());
        window.location.href="/placeManage";

    }

</script>
</body>
</html>