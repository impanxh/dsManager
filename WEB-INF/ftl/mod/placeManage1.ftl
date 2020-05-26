<#assign security=JspTaglibs["/WEB-INF/tlds/security.tld"] />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <title>场所管理</title>
    <meta content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0" name="viewport" />
    <meta content="yes" name="apple-mobile-web-app-capable" />
    <meta content="black" name="apple-mobile-web-app-status-bar-style" />
    <meta content="telephone=no" name="format-detection" />
    <!-- 引入YDUI样式 -->
    <link rel="stylesheet" href="${rc.contextPath}/ydui_css/ydui.css" />
    <!-- 引入jQuery 2.0+ -->
<script src="${rc.contextPath}/js/jquery-2.0.2.min.js"></script>
    <!-- 引入YDUI自适应解决方案类库 -->
    <script src="${rc.contextPath}/ydui_js/ydui.flexible.js"></script>
    <script src="${rc.contextPath}/js/address.js"></script>
        <!-- 引入YDUI脚本 -->
<script type="text/javascript" language="javascript"
    src="${rc.contextPath}/js/vue.min.js"></script>
<script src="${rc.contextPath}/ydui_js/template.js"></script>
<script src="${rc.contextPath}/ydui_js/ydui.js"></script>
<script src="${rc.contextPath}/ydui_js/ydui-list.js"></script>

</head>
<body>
<section class="g-flexview">
    <header class="m-navbar">
        <a href="../index.html" class="navbar-item"><i class="back-ico"></i></a>
        <div class="navbar-center"></div>
    </header>

     

      <section class="g-scrollview" id="J_List">
        <div id="J_ListContent" class="m-list list-theme1"></div>
    	</section>


</section>

<script id="J_templete" type="text/html">
        <div class="m-cell"  >
             {{each list as data}}
            <a href="${rc.contextPath}/schoolMod?placeId={{data.id}}&edit=1" class="cell-item J_Link"<#-- j_link比较重要需要加--> data-page="{{page}}"> 
                <div class="cell-left"> 
                    {{page}}行业：{{data.s_Map.hyType_s}}&nbsp;|| &nbsp;单位名：{{data.s_Map.unitName_s}}
                    <input type="hidden" id="placeId"  v-bind:value="data.id" >
                </div>
                <div class="cell-right cell-arrow"></div>
            </a>
             {{/each}}
        </div>
   
   
</script>


<script src="${rc.contextPath}/js/jquery.form.js"></script>
<script src="${rc.contextPath}/js/preCaution.js"></script>
<!-- 引入city包 -->
<script src="${rc.contextPath}/ydui_js/ydui.citys.js"></script>
<script>
    var dialog = YDUI.dialog;
    $(function(){
    
     var listRequestJsong={
     "pageSize":10,"start":0,"page":1,
     "templeteDivId":"J_templete",//vue script templete id
     "sectionId":'J_List',//vue 最外层显示数据的section id
     "listContent_id":"J_ListContent"//vue 二层内容id
     };
     
        var loadMore = function (callback) {
            $.ajax({
                url: 'http://'+changeAddr()+'/common/getModelList?filter[className]=Unit',
                type: 'GET',
                data: {
                    start: listRequestJsong.start,
                    length: listRequestJsong.pageSize
                },
                success: function (ret) {
                    typeof callback == 'function' && callback(ret);
                }
            });
        };
       loadScrollTable(listRequestJsong,loadMore);
 })     

</script>
</body>
</html>