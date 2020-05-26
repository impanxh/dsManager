<#assign security=JspTaglibs["/WEB-INF/tlds/security.tld"] />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <title>技防信息管理</title>
    <meta content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0" name="viewport" />
    <meta content="yes" name="apple-mobile-web-app-capable" />
    <meta content="black" name="apple-mobile-web-app-status-bar-style" />
    <meta content="telephone=no" name="format-detection" />
    <!-- 引入YDUI样式 -->
    <link rel="stylesheet" href="${rc.contextPath}/ydui_css/ydui.css" />
    <link rel="stylesheet" href="${rc.contextPath}/css/demo.css" />
    <!-- 引入YDUI自适应解决方案类库 -->
    <script src="${rc.contextPath}/ydui_js/ydui.flexible.js"></script>
    <!-- 引入jQuery 2.0+ -->
    <script src="${rc.contextPath}/js/jquery-2.0.2.min.js"></script>
    <script src="${rc.contextPath}/js/jquery.form.js"></script>
    <script src="${rc.contextPath}/js/jquery-dateFormat.js"></script>
    <!-- 引入YDUI脚本 -->
    <script src="${rc.contextPath}/js/vue.min.js"></script>
    <script src="${rc.contextPath}/js/preCaution.js"></script>
    <script src="${rc.contextPath}/js/address.js"></script>

</head>
<body>
<section class="g-flexview">
    <header class="m-navbar">
        <a href="javascript:history.back(-1);" class="navbar-item" id="navbarBack"><i class="back-ico"></i></a>
        <div class="navbar-center"><span class="navbar-title" id="unitTitle"></span></div>
    </header>

    <section class="g-scrollview">

        <h1 class="demo-pagetitle">技防信息管理</h1>
        <h2 class="demo-detail-title"></h2>
        <div id="techPrecaution" class="m-list list-theme1">
            <div class="m-cell">
                <a href="javascript:void(0);" class="cell-item"  v-for="(t, index) in techList" v-on:click="viewTP(t)">
                    <div class="cell-left EPfont"><B>{{index+1}}.</B> {{t.s_Map.itemName_s}}</div>
                    <div class="cell-right cell-arrow"></div>
                </a>
            </div>
        </div>


   	</section>
</section>
<!--底部DIV -->
 <#include "/menu/foot.ftl" /> 
<!--底部DIV -->

<script src="${rc.contextPath}/ydui_js/ydui.js"></script>
<script>
    !function ($) {
    }(jQuery);

    $(document).ready(function(){
        var unitId = getQueryString("unit");
        // 副标题
        var myUnit = getUnitById(unitId);
        if(myUnit != null) {
            var role = getQueryString("role");
            if(role == null) {
                role = "";
            }
            var roleParam = "&role=" + role;
            $("#unitTitle").text(myUnit.s_Map.unitName_s);
            $("#navbarBack").attr("href", "${rc.contextPath}/responsibility/SecurityResp?unit="+unitId+roleParam);
        }

        var TPList = getPrecautionItems(unitId, "TechPrecaution");
        
                        
        var isMobileTag = isMobile();
        $.each(TPList, function(i,val){ 
	        if(isMobileTag){
	        	val.s_Map.itemName_s =  val.s_Map.itemName_s.substring(0, val.s_Map.itemName_s.length > 22? 22:val.s_Map.itemName_s.length) ;
	        }
	  	});
	  	
        if(TPList == null) {
            initPrecautionItems(unitId, "Tech");
            YDUI.dialog.toast('技防数据初始化', 'success', 3000, function () {
                window.location.reload();
            });
        }

        if(TPList == null) {
            TPList = [];
        }

        var techVue = new Vue({
            el: '#techPrecaution',
            data: {
                unitId: unitId,
                techList: TPList,
            },
            methods: {
                viewTP: function(tech) {
                    window.location.href = "${rc.contextPath}/techPrecaution/TPView?unit=" + unitId +
                            "&tpId=" + tech.id;
                }
            }
        })

    })
</script>
</body>


</html>