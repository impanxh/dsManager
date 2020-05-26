<#assign security=JspTaglibs["/WEB-INF/tlds/security.tld"] />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <title>纠纷隐患管理</title>
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

<script src="${rc.contextPath}/ydui_js/ydui.js"></script>
</head>
<body>
<section class="g-flexview">
    <header class="m-navbar">
        <a href="../index.html" class="navbar-item"><i class="back-ico"></i></a>
        <div class="navbar-center">纠纷隐患记录</div>
        <a href="${rc.contextPath}/trouble/edit" class="navbar-item">添加记录</a>
    </header>

    <section class="g-scrollview">

        <div class="m-cell"  id="Unit">
            <a href="" class="cell-item"  v-for="unit in unitList">
                <div class="cell-left">{{unit.s_Map.issueName_s}}</div>
                <div class="cell-right cell-arrow"></div>
            </a>
        </div>

            
   	</section>
</section>
<script src="${rc.contextPath}/js/jquery.form.js"></script>
<script src="${rc.contextPath}/js/preCaution.js"></script>
<!-- 引入city包 -->
<script src="${rc.contextPath}/ydui_js/ydui.citys.js"></script>
<script>
    var dialog = YDUI.dialog;
    $(function(){
            //vue.js 循环数据
            var modVue = new Vue({
            el: '#Unit',
                data: {
                    unitList: {}
                },
                methods: {
                    showData: function () {
                        var _self = this;
                        $.ajax({
                            type: 'GET',
                            url: 'http://'+changeAddr()+'/common/getModelList?filter[className]=issue',
                            success:function(data) {
                                _self.unitList = (data.content);
                            }
                        });
                    }
                }
        })

            modVue.showData();
        
    });

    !function ($) {
        
    }(jQuery);
</script>
</body>
</html>