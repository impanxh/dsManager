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
    <script src="${rc.contextPath}/js/jquery-dateFormat.js"></script>

<script src="${rc.contextPath}/js/jquery.form.js"></script>
<script src="${rc.contextPath}/js/preCaution.js"></script>
 <link rel="stylesheet" href="${rc.contextPath}/css/scronf5.css?v=1" />
<script src="${rc.contextPath}/js/scronf5.js"></script>

 <style>
           
        </style>

</head>
<body>
<section class="g-flexview">
    <header class="m-navbar">
        <a href="${rc.contextPath}/hyList " id="_back" class="navbar-item"><i class="back-ico"></i></a>
        <div class="navbar-center">
            <span class="navbar-title" id="">
        <div class="m-search" >
            <input type="search" id="search-name" class="search-input" placeholder="单位名称">
            <a  href="javascript:void(0)" onclick="submitSubject()" >
                <i class="icon-user"  id="search-i" ></i>
            </a>
        </div>
            </span>
        </div>
        <a href="${rc.contextPath}/unitAdd" class="navbar-item" id = "adbutton" style="display:none" >添加记录</a>
    </header>



    <section class="g-scrollview" id="J_List">
        <!--
        <h1 class="demo-pagetitle" id="unitTitle">单位信息列表</h1>
        -->
        <div class="list-item" style="margin-bottom: 0.2rem;margin-top: 0.2rem;">
            <div class="list-img">
                <a href="javascript:void(0);">
                    <img src="${rc.contextPath}/images/slider-sample-qiye.png">
                </a>
            </div>
        </div>
        <div id="J_ListContent" class="m-list list-theme1"></div>
    </section>
</section>
<!--底部DIV -->
 <#include "/menu/foot.ftl" />
<!--底部DIV -->

<script id="J_templete" type="text/html">
        {{each list as data}}
        <div class="m-cell" style="margin-bottom: 0.2rem">
        <!-- <a href="${rc.contextPath}/unitEdit?placeId={{data.id}}&edit=1" -->
        <div class="cell-item">
            <div class="cell-left">
                <i class="cell-icon" ><img src="${rc.contextPath}/images/icon/icon_{{data.s_Map.hyType_s}}.png"/></i>
                </div>
            <a href="${rc.contextPath}/respPrompt?unit={{data.id}}" style="margin-top: 0.2rem;margin-bottom: 0.2rem" class="list-mes J_Link"<#-- j_link比较重要需要加--> data-page="{{page}}">
                <h3 class="list-title" style="font-size:0.3rem">{{data.s_Map.unitName_s}} </h3>

                <div class="list-mes-item">
                    <div style="padding-top: 5px;">
                    辖区：{{data.s_Map.regionid_s}}
                    </div>
                </div>
                <div class="list-mes-item">
                    <div style="padding-top: 5px;">
                        地址：{{data.s_Map.unitAdd_s}}
                        <input type="hidden" id="placeId"  v-bind:value="data.id" >
                    </div>
                </div>
                <div class="list-mes-item">
                    <div style="padding-top: 5px;">
                        联系人：{{data.s_Map.unitNum_s}}
                    </div>
                </div>
                <div class="list-mes-item">
                    <div style="padding-top: 5px;color:orange">
                    最近更新时间：{{ data.updateStr }}
                    </div>
                </div>
            </a>
            <div  class="cell-right cell-arrow">{{data.s_Map.hyid_s}}</div>
            </div>
        </div>
        {{/each}}


</script>


<script type="text/javascript">
    var dialog = YDUI.dialog;

    $(function(){
 		 var _from= getQueryString("_from");
        var unit= getQueryString("unit");
        var area= getQueryString("area");

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
                url: 'http://'+changeAddr()+'/common/getModelList?filter[className]=Unit',
                type: 'GET',
                async : false,
                data: {
                    start: listRequestJsong.start,
                    length: listRequestJsong.pageSize,
                    "filter[unitName_s_s]": searchName,
                    "filter[hyType_s_s_EQ]": unit,
                    "filter[hySort_s_s_EQ]": area,
                    "userid":"<@security.authentication property="principal.username" />",
                    "isTaskQuery": "yes"

                },
                success: function (ret) {
               
              
                $.each(ret.content, function(i,val){ 
						val.updateStr = $.format.date(val.dt_Map.updated_dt, "yyyy-MM-dd HH:mm:ss");
				 });
		                            
		                            
                
                    typeof callback == 'function' && callback(ret);
                }
            });
        };
        loadScrollTable(listRequestJsong,loadMore);
        	$('#adbutton').attr("href","/unitAdd?industry="+getQueryString("unit"));
       

        var s = queryUserGroup('<@security.authentication property="principal.username" />');
        if(isNotNull(s) && s[1] == '*'){
            $('#adbutton').show();
        }else  if(isNotNull(s) && s[1] == '*00'){
            $('#_back').attr("href","/hyAreaList?industryId="+getQueryString("unit"));
        }
		 if(_from == 'foot'){
         	$('#_back').attr("href","/hyList");
         } 


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
        var unit= getQueryString("unit");
        var area= getQueryString("area");
        var params = '';
        if(unit !=null){
       	 	params += "&unit="+unit
        }
        if(area != null){
       		params += "&area="+area
        }
        window.location.href="/placeManage?version=1.1"+params;

    }








</script>

<#-- 
<script src="${rc.contextPath}/ydui_js/fengqin.js"></script> -->
</body>
</html>