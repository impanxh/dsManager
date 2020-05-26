<#assign security=JspTaglibs["/WEB-INF/tlds/security.tld"] />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <title>辖区分类</title>
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
<section class="g-flexview" id = "c" style="display:none" >
    <header class="m-navbar">
        <a href="${rc.contextPath}/hyList" class="navbar-item"><i class="back-ico"></i></a>
        <div class="navbar-center"><span class="navbar-title" id="">辖区分类</span></div>
        <#-- <a href="${rc.contextPath}/unitAdd" class="navbar-item">添加记录</a> -->
    </header>     

      <section class="g-scrollview" id="J_List">
      <div class="list-item" style="margin-bottom: 0.2rem;margin-top: 0.2rem;">
            <div class="list-img">
                <a href="javascript:void(0);">
                    <img src="${rc.contextPath}/images/slider-sample-xiaqu.png">
                </a>
            </div>
        </div>

        <div id="J_ListContent" class="m-list list-theme1">
            
             <div class="m-cell"  >
            <template  v-for="data in List">
            <!-- <a href="${rc.contextPath}/unitEdit?placeId={{data.id}}&edit=1" -->
            <a :href="'${rc.contextPath}/placeManage?unit='+data.industryId+'&area='+data.id" class="cell-item J_Link"<#-- j_link比较重要需要加--> >
                <div class="cell-left"> 
                    <i class="cell-icon"><img src="/images/xq.png"></i>
                    {{data.name}}
                    <input type="hidden" id="placeId"  v-bind:value="data.id" >
                    <br>
                    
                </div>
                
                <div class="cell-right cell-arrow"><span class="badge badge-primary" style="font-size:15px;">{{data.value}}</span> </div>
            </a>
            </template>

        </div>

        </div>
	<#--
        <div class="m-button" style="width: 100%;">
                <a href="${rc.contextPath}/personPrecaution/PPIssueList">
                <button type="button" class="btn-block btn-primary">纠纷隐患</button>
                </a>

        </div>-->
</section>


</section>
<!--底部DIV -->
 <#include "/menu/foot.ftl" />
<!--底部DIV -->
<script id="J_templete" type="text/html">
       
   
   
</script>


<script type="text/javascript">
    var dialog = YDUI.dialog;

    $(function(){
    
       var goodsVue = new Vue({
                el: '#J_ListContent',
                data: {
                    List : '',
                    industryId:''
                },
                methods: {
                    nameSearch: function () {
                        var _self = this;
                        $.ajax({
                            type: 'GET',
                            url: 'http://'+changeAddr()+'/unitAreaGroup?userid=<@security.authentication property="principal.username" />&industryId='+getQueryString("industryId"),
                            success:function(data) {
                                _self.List = data;
                                 $.each(data,function(n,value) { 
                                	 value. industryId = getQueryString("industryId"); 
       							    });
                                
                            }
                        });
                    }
                }
            })

        var s = queryUserGroup('<@security.authentication property="principal.username" />');
            if(isNotNull(s) && isNotNull(s[200]) ){
             	 window.location.href="${rc.contextPath}/respPrompt?unit="+s[200];
             }else  {
             $('#c').show();
               goodsVue.nameSearch();
             }
 })     

</script>
</body>
</html>