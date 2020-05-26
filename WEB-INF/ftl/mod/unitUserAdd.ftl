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
    <link rel="stylesheet" href="${rc.contextPath}/css/demo.css" />
    <!-- 引入jQuery 2.0+ -->

</head>
<body>
<script id="imageTemplate" type="text/html">
    <div id="{{mid}}" class="list-item" style="width:100%;    float: none;">
        <div class="list-img" style="width:60%;overflow:hidden;    margin: 0 auto;">
            <img  src="/upload_temp/{{imageUrl}}" />
        </div>
    </div >
</script>
<section class="g-flexview">
    <header class="m-navbar">
        <a href="javascript:history.back();" class="navbar-item"><i class="back-ico"></i></a>
        <div class="navbar-center"><span class="navbar-title">用户基本信息录入</span></div>
    </header>

    <section class="g-scrollview" id="app">

        <div class="m-cell" >
            <div class="cell-item">
                <div class="cell-right ">
                    <article class="m-list list-theme1" id ="imageShow">
                    </article>

                </div>
            </div>

            <div class="cell-item">
                <div class="cell-left"></div>
                <div class="cell-right">
                    <div class="divupload" style="    margin: .1rem auto;">
                        <form id="mediaFileForm" method="post" enctype="multipart/form-data">
                            <div class="divuploadfile">上传头像</div>
                            <input type="file" name="uploadFile_s" id="uploadFile_s" class="inputstyle" onchange="uploadMediaFile()" />
                        </form>
                        <input type="hidden" name="mediaFile_s" id="mediaFile_s" />
                    </div>
                </div>
            </div>
        </div>

        <form id="msgForm"  method="post" action='/user/save'>
            <input type="hidden" id="mediaFile_s_s" name="photo">
            <div class="m-cell" >
                <div class="cell-item">
                    <div class="cell-left"><span>*</span>登录名：</div>
                    <div class="cell-right "><input type="text" ref="username" id="username" @blur="checkName()" name="username" class="cell-input" placeholder="" autocomplete="off" /></div>
                </div>
                <div class="cell-item">
                    <div class="cell-left"><span>*</span>真实姓名：</div>
                    <div class="cell-right "><input type="text" ref="legalman" @blur="checkRealName()" id="legalman" name="legalman" class="cell-input" placeholder="" autocomplete="off" /></div>
                </div>

                <div class="cell-item">
                    <div class="cell-left"><span>*</span>密码：</div>
                    <div class="cell-right "><input type="password" ref="inputPassword" @blur="checkPassword()" id="password" name="password" class="cell-input" placeholder="" autocomplete="off" /></div>
                </div>

                <div class="cell-item">
                    <div class="cell-left"><span>*</span>确认密码：</div>
                    <div class="cell-right "><input type="password" ref="inputPasswordCheck" @blur="checkPasswordTrue()" id="password2" name="" class="cell-input" placeholder="" autocomplete="off" /></div>
                </div>
            </div>

            <div class="m-cell" >
                <div class="cell-item">
                    <div class="cell-left"><span>*</span>身份证号码：</div>
                    <div class="cell-right "><input type="text" ref="cards" id="cards" @blur="checkIdNum()" name="cards" class="cell-input" placeholder="" autocomplete="off" /></div>
                </div>

                <div class="cell-item">
                    <div class="cell-left"><span>*</span>移动电话：</div>
                    <div class="cell-right "><input type="text" ref="phone" id="phone"  @blur="checkMobNum()" name="phone" class="cell-input" placeholder="请输入十三位手机号码." autocomplete="off" /></div>
                </div>
            </div>

            <div class="m-cell" >
                <div class="cell-item">
                    <div class="cell-left">邮箱:</div>
                    <div class="cell-right "><input type="text" id="region" name="region" class="cell-input" placeholder="" autocomplete="off" /></div>
                </div>

                <div class="cell-item">
                    <div class="cell-left">职务:</div>
                    <div class="cell-right "><textarea class="cell-textarea" id="certification" placeholder="" name="certification"></textarea></div>
                </div>

                <div class="cell-item">
                    <div class="cell-left">企业管理员:</div>
                    <label class="cell-right">
                        <input type="checkbox" name="companyAdminTag" id = "companyAdminTag" class="m-switch-old"  />
                        <span class="m-switch"></span>
                    </label>
                </div>
            </div>

            <input type="hidden" id="utype" name="utype"   />
        </form>

        <div class="m-button" style="width: 100%;">
            <button type="button" onclick="sub()" id="savebt" class="btn-block btn-primary">保存信息</button>

        </div>

        <div class="m-button" style="width: 100%;"    >
            <input type="button" onclick="delUser()"  id = "deleteU" style="display:none" class="btn-block btn-warning" value="删除用户"/>
        </div>
    </section>
</section>


<script src="${rc.contextPath}/js/jquery-2.0.2.min.js"></script>
<!-- 引入YDUI自适应解决方案类库 -->
<script src="${rc.contextPath}/ydui_js/ydui.flexible.js"></script>

<script src="${rc.contextPath}/js/common.js"></script>
<!-- 引入YDUI脚本 -->
<script type="text/javascript" language="javascript" src="${rc.contextPath}/js/vue.min.js"></script>
<script src="${rc.contextPath}/js/string.format.js"></script>


<!--底部DIV -->
<script src="${rc.contextPath}/js/jquery.form.js"></script>
<script src="${rc.contextPath}/js/preCaution.js"></script>
<!-- 引入jQuery 2.0+ -->
<script src="/js/jquery.form.js"></script>
<script src="/js/jquery-dateFormat.js"></script>
<!-- 引入YDUI脚本 -->
<script src="/ydui_js/ydui.js"></script>
<script src="/js/preCaution.js"></script>
<script src="/js/address.js"></script>
<script src="${rc.contextPath}/ydui_js/template.js"></script>
<script>

    var _utype ='';
    $(function(){
        var dialog = YDUI.dialog;

        var modVue = new Vue({
            el: '#app',
            data: {
                datas: {}
            },
            methods: {
                checkName: function() {
                    if(!checkTXT(this.$refs.username.value)){
                        dialog.toast("登录名请控制在4~12个字符的英文字母、数字和下划线.",'none', 1500);
                    }
                },

                checkRealName:function (){
                    if(!checkRName(this.$refs.legalman.value)){
                        dialog.toast("请输入正确的姓名格式.",'none', 1500);
                    }
                },

                checkMobNum: function() {
                    if(!chkPhone(this.$refs.phone.value)){
                        dialog.toast("请输入正确的号码格式.",'none', 1500);
                    }
                },

                checkPassword: function() {
                    if(!checkPassword2(this.$refs.inputPassword.value)){
                        dialog.toast("密码长度设置请控制在4~12个字符的数字、英文之间.",'none', 1500);
                    }
                },

                checkPasswordTrue: function() {
                    var inputPassword = this.$refs.inputPassword.value;
                    var inputPasswordCheck = this.$refs.inputPasswordCheck.value;
                    if(!(inputPasswordCheck === inputPassword)){
                        dialog.toast("两次输入密码不一致.",'none', 1500);
                    }
                },

                checkIdNum:function() {
                    if(!chkIdNum(this.$refs.cards.value)){
                        dialog.toast("身份证输入不合法.",'none', 1500);
                    }
                }
            }
        })


        if(getQueryString("op") ==1){
            if('<@security.authentication property="principal.username" />'!= getQueryString("u")){
                $('#deleteU').show();
            }
            $("#username").attr("readonly","readonly");
            $.ajax({
                url: '/user/ajax_u/'+getQueryString("u"),
                type: 'GET',
                async : false,
                data: {
                },
                success: function (ret) {
                    if(isNotNull(ret)){
                        //$("#id").val(ret.id);
                        $("#region").val(ret.region);
                        $("#company").val(ret.company);
                        $("#phone").val(ret.phone);
                        $("#cards").val(ret.cards);
                        $("#legalman").val(ret.legalman);
                        $("#username").val(ret.username);
                        $('#certification').val(ret.certification);
                        _utype = ret.utype;
                        $('#utype').val(_utype);
                        if(ret.companyAdminTag  == 'on'){
                            $('#companyAdminTag').attr("checked", true);
                        }

                        console.log();
                        var image_path = ret.photo;
                        var image_html = "";
                        console.log(image_path);
                        if(image_path != "") {
                            image_html = template("imageTemplate",
                                    {imageUrl:image_path, mid:image_path.replace(new RegExp("/","g"),'').replace('.','')});
                        }
                        $("#mediaFile_s").val(image_path);
                        $("#mediaFile_s_s").val(image_path);
                        $("#imageShow").html(image_html);

                        var template1 = "/user/save?createCUser=Y&id="+ret.id;
                        $('#msgForm').attr("action",  template1);
                        //--
                    }
                }
            });
        }

    });
    function delUser(){
        var dialog = YDUI.dialog;
        $('#savebt').attr("disabled","true");
        $("#savebt").css("background-color", "#85A2AD");
        $.ajax({
            url: '/user/deleteUser',
            type: 'POST',
            async : false,
            data: {
                'deleteUser':getQueryString("u"),
                'uid':'<@security.authentication property="principal.username" />'
            },
            success: function (ret) {
                if(ret.left){
                    var postData={"checkUniq":'N',"userid_s":'<@security.authentication property="principal.username" />',"url_s": "delById"};
                    postData.deleteUser =  getQueryString("u")
                    postData.params_s = JSON.stringify(postData);
                    postData.className_s = "用户"
                    
                    var   unitObj = queryForObject({"filter[id]":_utype},'Unit');
					if(isNotNull(unitObj)){
									postData.unitName_s = unitObj.s_Map.unitName_s;
					 }
			 
                    saveDataModel(postData,"log");
                    dialog.toast("删除成功", 'none', 1000);

                }else {
                    dialog.toast(ret.right, 'none', 1000);
                }
                var uptime = window.setTimeout(function(){
                    window.location.href="/placeUser?unit="+_utype+"&_="+ ((new Date()).valueOf()),
                            clearTimeout(uptime);
                },1500)
            }
        });
    }

    function sub(){
        var dialog = YDUI.dialog;
        var num=0;
        var username = $("#username").val();
        var legalman = ($("#legalman").val());
        var password = ($("#password").val());
        var password2 = ($("#password2").val());
        var email=($("#email").val());
        var cards = ($("#cards").val());
        var phone= ($("#phone").val());
        var roles=document.getElementsByName("roles");
        var keyId = ($("#ukey").val());
        //var roles = new Array();
        var company= ($("#company").val());
        var department= ($("#department").val());
        if(username==""){
            dialog.toast('请填写登录名', 'none', 500);
            return;
        }else if(!checkTXT(username))
        {
            dialog.toast("用户名请输入英文字母、数字和下划线.",'none', 500);
            return;
        }

        if(legalman==""){
            dialog.toast('请填写真实姓名', 'none', 500);
            return;
        }else if(!checkRName(legalman))
        {
            dialog.toast("请输入正确的姓名格式.",'none', 1500);
            return;
        }

        if(password==""){
            dialog.toast('密码不能为空', 'none', 500);
            return;
        }else if(!checkPassword2(password))
        {
            dialog.toast("密码长度设置请控制在4~12个字符的数字、英文之间.",'none', 1500);
            return;
        }

        if(cards==""){
            dialog.toast('请填写身份证号码', 'none', 500);
            return;
        }else if(!chkIdNum(cards))
        {
            dialog.toast("身份证输入不合法.",'none', 1500);
            return;
        }

        if(phone==""){
            dialog.toast('请填写联系电话', 'none', 500);
            return;
        }else if(!chkPhone(phone))
        {
            dialog.toast("请输入正确的号码格式.",'none', 1500);
            return;
        }

        if(getQueryString("op") !=1){
            $('#utype').val(getQueryString("unit"));
        }

        $('#savebt').attr("disabled","true");
        $("#savebt").css("background-color", "#85A2AD");
        $('#msgForm').ajaxForm(function(data) {
            if(data.error ==1){
                dialog.toast("保存成功", 'none', 1000);


                var postData={"checkUniq":'N',"userid_s":'<@security.authentication property="principal.username" />',"url_s": "saveModel","saveTag_s":'N'};
                data.password = "****";
                postData.params_s = JSON.stringify(data);
                postData.className_s = "用户"
                
                     var   unitObj = queryForObject({"filter[id]":getQueryString("unit")},'Unit');
			if(isNotNull(unitObj)){
							postData.unitName_s = unitObj.s_Map.unitName_s;
			 }
			 
                saveDataModel(postData,"log");


                var uptime = window.setTimeout(function(){
                    window.location.href="/placeUser?unit="+getQueryString("unit"),
                            clearTimeout(uptime);
                },1500)

            }else {
                dialog.toast(data.errorMessage, 'none', 500);
                $('#savebt').removeAttr("disabled");
                $("#savebt").css("background-color", "rgba(4, 190, 2, 0.76)");
            }

        }).submit();
    }


    function saveMsg(){
        $('#utype').val(getQueryString("unit"));
        var dialog = YDUI.dialog;
        var _action = $('#msgForm').attr("action");

        var checkText=$("#hyType_s").find("option:selected").text();
        var sort_s=$("#hySort_s").find("option:selected").text();
        var template1 = "&hyid_s={0}&regionid_s={1}";
        var p = template1.format(checkText,sort_s);

        $('#msgForm').attr("action", _action + p);
        console.log($('#msgForm').attr("action"));


        $('#msgForm').ajaxForm(function(data) {
            if (data.status == 200) {
                $('#savebt').attr("disabled","true");
                $("#savebt").css("background-color", "#85A2AD");
                var uptime = window.setTimeout(function() {


                    dialog.toast("保存成功", 'none', 1000);


                    window.location.href="${rc.contextPath}/placeManage";
                    clearTimeout(uptime);
                }, 2000)
            } else {
                dialog.toast("保存失败", 'none', 1000);
            }
        }).submit();
    }


    // 上传图片或者视频文件
    function uploadMediaFile() {
        var fileName = $("#uploadFile_s").val();
        if (fileName == '') {
            YDUI.dialog.alert("请选择文件");
            return false;
        }

        var imgs = fileName.split(".");
        var suffix = imgs[imgs.length - 1].toLocaleLowerCase();
        var validFileTypes = [ "jpg", "jpeg", "gif", "png"];
        if ($.inArray(suffix, validFileTypes) == -1) {
            YDUI.dialog.alert("请上传['jpg','gif','png','jpeg']格式的文件!");
            return false;
        }
        var options = {
            url : "/upload/saveSimpleFile",
            type : "POST",
            dataType : "json",
            success : function(data) {
                //var file_list = $("#mediaFile_s").val();
                //file_list =  file_list== '' ? data.path :  file_list + "," + data.path;
                $("#mediaFile_s").val(data.path);
                $("#mediaFile_s_s").val(data.path);
                $("#imageShow").html(template("imageTemplate",
                        {imageUrl:data.path, mid:data.path.replace(new RegExp("/","g"),'').replace('.','')}));
                YDUI.dialog.loading.close();
            }
        };
        YDUI.dialog.loading.open('图片上传中');
        setTimeout(function () {
            $("#mediaFileForm").ajaxSubmit(options);
        }, 1000);
    }
</script>
<!--底部DIV -->
 <#include "/menu/foot.ftl" />
</body>
</html>