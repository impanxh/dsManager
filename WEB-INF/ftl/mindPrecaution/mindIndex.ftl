<#assign security=JspTaglibs["/WEB-INF/tlds/security.tld"] />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <title>模块列表</title>
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
    <!-- 引入city包 -->
    <script src="${rc.contextPath}/ydui_js/ydui.citys.js"></script>
    <!-- 引入YDUI脚本 -->
    <script src="${rc.contextPath}/ydui_js/ydui.js"></script>
    <script src="${rc.contextPath}/js/preCaution.js"></script>
    <script src="${rc.contextPath}/js/address.js"></script>
    <script type="application/javascript">

        var unitId;
        $(document).ready(function(){
            unitId = getQueryString("unit");
            console.log(unitId);
            $("#unitId").val(unitId);

            var myUnit = getUnitById(unitId);
            if(myUnit != null) {                        
                $("#unitTitle").text(myUnit.s_Map.unitName_s);
            }
        })

        

        function gotoEdu(itemName) {
            
            window.location.href = "${rc.contextPath}/mindPrecaution/listedu?unit=" + unitId;
        } 
        function gotoDrill(itemName) {
            window.location.href = "${rc.contextPath}/mindPrecaution/listdrill?unit=" + unitId;
        }    
        function gotoBase(itemName) {
            window.location.href = "${rc.contextPath}/placebase?unit=" + unitId;
        }       
    </script>
</head>
<body>
<section class="g-flexview">
    <header class="m-navbar">
        <a href="javascript:void(0);" onclick="gotoBase()" class="navbar-item"><i class="back-ico"></i></a>
        <div class="navbar-center"></div>
    </header>

    <section class="g-scrollview">

        <h1 class="demo-pagetitle">心防信息管理</h1>
        <h2 class="demo-detail-title" id="unitTitle"></h2>
        <div class="m-grids-4">
            <a class="grids-item" href="javascript:void(0);" onclick="gotoEdu()">
                <div class="grids-icon" >
                    <i class="icon-order" style="font-size: 26px;color:#FF685D;"></i>
                </div>
                <div class="grids-txt">教育记录</div>
            </a>
            <a class="grids-item" href="javascript:void(0);" onclick="gotoDrill()">
                <div class="grids-icon">
                    <i class="icon-type" style="font-size: 26px;color:#FF685D;"></i>
                </div>
                <div class="grids-txt">定期演练</div>
            </a>
            <a class="grids-item" href="javascript:void(0);" onclick="">
                <div class="grids-icon">
                    <i class="icon-more" style="font-size: 26px;color:#FF685D;"></i>
                </div>
                <div class="grids-txt">待增加</div>
            </a>
            <a class="grids-item" href="javascript:void(0);">
                <div class="grids-icon">
                    <i class="icon-more" style="font-size: 26px;color:#FF685D;"></i>
                </div>
                <div class="grids-txt">待增加</div>
            </a>
            
            <input type="hidden" id="unitId"  name="unitId"/>
        </div>

   	</section>
</section>
<script>
    !function ($) {        

    }(jQuery);

    
</script>
</body>


</html>