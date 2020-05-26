<#assign security=JspTaglibs["/WEB-INF/tlds/security.tld"] />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html lang="zh">
<head>
    <meta charset="UTF-8">
    <title></title>
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
<script src="${rc.contextPath}/js/string.format.js"></script>
</head>
<body>
<section class="g-flexview">
    <header class="m-navbar">
        <a href="javascript:history.back();" class="navbar-item"><i class="back-ico"></i></a>
        <div class="navbar-center"><span class="navbar-title">用户信息</span></div>
    </header>

    <section class="g-scrollview" id="app">
        
        	<form id="userForm2" name="userForm2" method="post" action="user/u_edit/update"
        enctype="multipart/form-data">
            <div class="m-cell">
            <div class="cell-item">
                <div class="cell-left">登录名：</div>
                <div class="cell-right "><input type="text" readonly="readonly" :value="datas.username" id="username" name="username" class="cell-input" placeholder="" autocomplete="off" /></div>
            </div>

            <div class="cell-item">
                <div class="cell-left">真实姓名：</div>
                <div class="cell-right "><input type="text" readonly="readonly" :value="datas.legalman" id="legalman" name="legalman" class="cell-input" placeholder="" autocomplete="off" /></div>
            </div>

            <div class="cell-item">
                <div class="cell-left">联系电话：</div>
                <div class="cell-right "><input type="text" :value="datas.phone" id="phone" name="phone" class="cell-input" placeholder="" autocomplete="off" /></div>
            </div>

            <div class="cell-item">
                <div class="cell-left">邮箱：</div>
                <div class="cell-right "><input type="text" :value="datas.region" id="region" name="region" class="cell-input" placeholder="" autocomplete="off" /></div>
            </div>


            </div>

            <div class="m-cell">

            <div class="cell-item">
            	<div class="cell-left">所属公司：</div>
                <div class="cell-right "><input type="text" readonly="readonly" :value="datas.company" id="company" name="company" class="cell-input" placeholder="" autocomplete="off" /></div>
            </div>

            </div>
        </form>

            <div class="m-button" style="width: 100%;">
    			<button type="button" onclick="sub()" id="savebt" class="btn-block btn-primary">保存</button>
			</div>
   	</section>
</section>
<script src="${rc.contextPath}/js/jquery.form.js"></script>
<script src="${rc.contextPath}/js/preCaution.js"></script>
<!-- 引入city包 -->
<script src="${rc.contextPath}/ydui_js/ydui.citys.js"></script>



 




<script>
var dialog = YDUI.dialog;
    	var modVue = new Vue({
            el: '#app',
                data: {
                    datas: {},
                },
                methods: {
                    showData: function () {
                        var _self = this;
                        var baseUrl = '/user/ajax_u/<@security.authentication property="principal.username" />';
                        $.ajax({
                            type: 'GET',
                            url: baseUrl,
                            success:function(data) {
                                _self.datas = (data);
                            }
                        });
                    }
                }
        })
    $(function(){
         modVue.showData();
    });

    function sub(){
        var dialog = YDUI.dialog;
        console.log(dialog);
        $('#userForm2').ajaxForm(function(data) {
                if(data.left==true){
                    dialog.toast("保存成功", 'success', 2000);
                }else {
                    dialog.toast("保存失败", 'success', 2000);
                }
            var uptime = window.setTimeout(function(){
                // window.location.reload();
                clearTimeout(uptime);
                        },2000)
        }).submit();
    }
</script>
</body>
</html>

