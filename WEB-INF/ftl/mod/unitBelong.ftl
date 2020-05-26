<#assign security=JspTaglibs["/WEB-INF/tlds/security.tld"] />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <title>单位信息编辑</title>
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
    <script src="${rc.contextPath}/ydui_js/template.js"></script>
    <script src="${rc.contextPath}/js/vue.min.js"></script>
    <script src="${rc.contextPath}/js/preCaution.js"></script>
    <script src="${rc.contextPath}/js/address.js"></script>
    <script src="${rc.contextPath}/js/string.format.js"></script>

    <script src="${rc.contextPath}/js/common.js"></script>
</head>
<body>

     <script id="imageTemplate" type="text/html">
        <div>
        <a href="javascript:void(0);" class="list-item" style="width:100%">
            <div class="list-img">
            <img id="top_img" src="{{img}}" />
            </div>
        </a>
       </div>
    </script>


<section class="g-flexview" id="app">
    <header class="m-navbar">
        <a href="javascript:history.back();" class="navbar-item"><i class="back-ico"></i></a>
        <div class="navbar-center"><span class="navbar-title"><h1 class="demo-pagetitle">{{details.s_Map.unitName_s}}</h1></span></div>
    </header>

    <section class="g-scrollview">

            <div class="m-cell" >
                <div class="cell-item">
                    <div class="cell-right ">
                        <div style="display:block;float:left;">
                            <article class="m-list list-theme1" id="imageShow" v-html="cc">

                              {{cc}}

                            </article>
                        </div>
                    </div>
                </div>

              <#--  <div class="cell-item">
                    <div class="cell-left"></div>
                    <div class="cell-right">
                        <div class="divupload">
                            <form id="mediaFileForm" method="post" enctype="multipart/form-data">
                                <div class="divuploadfile">添加图片</div>
                                <input type="file" name="uploadFile_s" id="uploadFile_s" class="inputstyle" onchange="uploadMediaFile()" />
                            </form>
                            <input type="hidden" name="mediaFile_s" id="mediaFile_s" />
                        </div>
                    </div>
                </div>

                -->
            </div>

        	<form id="msgForm"  method="post">
                <input type="hidden" id="mediaFile_s_s" :value="details.s_Map.mediaFile_s" name="mediaFile_s">
            <div class="m-cell">
            <div class="cell-item">
            	<div class="cell-left"><i class="cell-icon icon-type"></i>行业类型：</div>
                <label class="cell-right ">
                    <select class="cell-select" id="hyType_s" name="hyType_s">
                        <option :value="details.s_Map.hyType_s" > {{details.s_Map.hyid_s}}</option>
                    </select>
                </label>
            </div>

            <div class="cell-item">
            	<div class="cell-left"><i class="cell-icon icon-shield-outline"></i>分管辖区：</div>
                <label class="cell-right ">
                	 <select class="cell-select" id="hySort_s" name="hySort_s">
                        <option :value="details.s_Map.hySort_s" > {{details.s_Map.regionid_s}}</option>
    			</select>

                </label>
            </div>

            </div>

            <div class="m-cell">
			<div class="cell-item">
				<div class="cell-left"><i class="cell-icon icon-star-outline"></i>单位名称：</div>
                <div class="cell-right "><input type="text" :value="details.s_Map.unitName_s" readonly=readonly name="unitName_s" class="cell-input" placeholder="" autocomplete="off" /></div>
            </div>

            <div class="cell-item">
            	<div class="cell-left"><i class="cell-icon icon-location"></i>单位地址：</div>
                <div class="cell-right "><input type="text" :value="details.s_Map.unitAdd_s" readonly=readonly name="unitAdd_s" class="cell-input" placeholder="" autocomplete="off" /></div>
            </div>

             <div class="cell-item">
            	<div class="cell-left"><i class="cell-icon icon-shield-outline"></i><font color=red>现所属辖区：</font></div>
                <div class="cell-right "><input type="text" :value="policeObj.oldRegin" readonly=readonly name="unitAdd_s" class="cell-input" placeholder="" autocomplete="off" /></div>
            </div>

             <div class="cell-item">
            	<div class="cell-left"><i class="cell-icon icon-shield-outline"></i>所属辖区调整：</div>
                <label class="cell-right ">
                	 <select class="cell-select" id="code_s" name="code_s">
                	 	<option value="">请选择辖区</option>
                	 	<option v-for="v in policeList"  :tx="v.id" :value="v.id" >{{v.s_Map.name_s}}</option>
    			</select>

                </label>
            </div>


        </form>

            <div class="m-button" style="width: 100%;">
    			<button type="button" onclick="saveMsg()" id="savebt" class="btn-block btn-primary">保存信息</button>
			</div>
   	</section>
</section>
<!--底部DIV -->
 <#include "/menu/foot.ftl" />
<!--底部DIV -->

     <script src="${rc.contextPath}/ydui_js/ydui.js"></script>
<script>

var dialog = YDUI.dialog;
var path = 'http://'+changeAddr()+'/common/saveModel?UID=<@security.authentication property="principal.username" />&className=';
var placeId = getQueryString("placeId");
var baseMap ;
    	var modVue = new Vue({
            el: '#app',
                data: {
                    datas: {},
                    region:{},
                    details:{},
                    imageUrl:'',
                    cc:{},policeObj:{},policeList:[]
                },
                methods: {
                    showData: function () {
                        var _self = this;
                        var baseUrl = 'http://'+changeAddr()+'/common/getModelList?filter[className]=industry&filter[type_s_s]=';
                        $.ajax({
                            type: 'GET',
                            url: baseUrl+'industry',
                            success:function(data) {
                            	console.log(data.content);
                                _self.datas = (data.content);
                            }
                        });

                         $.ajax({
                            type: 'GET',
                            url: baseUrl+'region',
                            success:function(data) {
                                _self.region = (data.content);
                            }
                        });
                    },

                    showDetails: function (placeId) {
                        var _self2 = this;
                        $.ajax({
                            type: 'GET',
                            url: "http://" + changeAddr() + "/common/queryById?className=Unit&id=" + placeId,
                            success:function(data) {
                            	baseMap =data.s_Map;
                            	var htsid = baseMap .hySort_s;
                            	    var _iyObj = queryForObject({"filter[id]":htsid},'industry');
                            	    if(_iyObj!=null){
                            	    	 data.s_Map.regionid_s = _iyObj.s_Map.name_s;
                            	    }
                                _self2.details = (data);
                                if( isNotNull(baseMap.mediaFile_s)){
                                    p=template("imageTemplate",{img: '/upload_temp/'+baseMap.mediaFile_s });
                                }else{
                                    p=template("imageTemplate",{img: '/imgs/default.jpg'});
                                    // $('#top_img').attr('src','../default.jpg');
                                    console.log($('#top_img').attr('src'));

                                }
                                 _self2.cc = p;

                                //---------
                                   var userType = queryUserGroup('<@security.authentication property="principal.username" />');
                                   var t2;//约定第3位做为警局编号
							        if(isNotNull(userType[1])) {
							           t2 = userType[2] ;
							        }
							    var _code = baseMap.code_s;
							    var _userObj = queryForObject({"filter[id]":_code},'industry');
							    var oldReginJson = {};
							    oldReginJson.oldRegin = _userObj.s_Map.name_s
							    _self2.policeObj = oldReginJson;
							    var newReginList = queryByExample({"length":5000,"order[0][name_s_s]":'asc',"filter[pId_s_s]": baseMap.hySort_s},'industry');
							   if(isNotNull(newReginList) && isNotNull(newReginList.content) ){
							   		 _self2.policeList = newReginList.content;
							   }

							    <#--
							    var req_role="330521-*-"+t2+"-"+baseMap.code_s;
		                          $.ajax({
		                            type: 'GET',
		                             data: {  "filter[id]":req_role },
		                            url: 'user/ajax-roleList?rev_=3&draw=1&columns=&order%5B0%5D%5BNAME_%5D=asc&start=0&length=500&search%5Bvalue%5D=&search%5Bregex%5D=false&_=1508734631422',
		                            success:function(data) {
		                            	console.log(data[0]);
		                            	if(isNotNull(data[0])){
		                            		data[0].actIdGroup._t = data[0].actIdGroup.name+"("+baseMap.code_s+")"
		                            	}
		                                _self2.policeObj = data[0];
		                            }
		                        });
		                        -->
		                          <#--
		                           var req_role2="330521-*-"+t2;
		                          $.ajax({
		                            type: 'GET',
		                             data: {  "filter[id]":req_role2 },
		                            url: 'user/ajax-roleList?rev_=3&draw=1&columns=&order%5B0%5D%5BNAME_%5D=asc&start=0&length=500&search%5Bvalue%5D=&search%5Bregex%5D=false&_=1508734631422',
		                            success:function(data) {
		                            $.each(data, function(i,val){
										 val.actIdGroup.code =  val.actIdGroup.id.split("-")[3];
										});
		                                _self2.policeList = data;
		                            }
		                        });  -->

                                //--
                            }
                        });

                    }

                }
        })
    $(function(){
        modVue.showData();
        modVue.showDetails(placeId);


    });

    function saveMsg(){
		var dialog = YDUI.dialog;
    	$('#msgForm').attr("action", path+'Unit&checkUniq=Y');
    	var _action = $('#msgForm').attr("action");
    	var upRow='N';
    	<#--
    	var checkText=$("#hyType_s").find("option:selected").text();
		var sort_s=$("#hySort_s").find("option:selected").text();
		var template1 = "&hyid_s={0}&regionid_s={1}";
		var p = template1.format(checkText,sort_s);
		var upRow='N';
		if(isNotNull(baseMap)){
			if(baseMap.hySort_s != $("#hySort_s").find("option:selected").val()
			|| baseMap.hyType_s != $("#hyType_s").find("option:selected").val() ){
				upRow = 'Y'
			}
		}-->

    	$('#msgForm').attr("action", _action + p+'&selectByField=id&id='+placeId);
    	var checkText=$("#code_s").find("option:selected").text();
    	console.log(checkText);

        checkText=$("#code_s").find("option:selected").attr("tx");
    	console.log(checkText);
    	var postData={"selectByField":'id',"id":placeId,"checkUniq":'Y',"code_s":checkText};
    	saveDataModel(postData,"Unit");

    	  postData={"selectByField":'unitId_s_s',"unitId_s":placeId,"upRows":'Y'};
		 postData.code_s = checkText ;
		 saveDataModel(postData,"InspRecord");
		 saveDataModel(postData,"Inspection");

    		$('#savebt').attr("disabled","true");
			$("#savebt").css("background-color", "#85A2AD");
			dialog.toast("保存成功,本页面将刷新", 'none', 2000);
			var uptime = window.setTimeout(function() {
              // window.location.href =  "unitDetail?edit=1&placeId=" + placeId,
              window.location.reload();
				clearTimeout(uptime);
			}, 2000);



    	<#--
    	$('#msgForm').ajaxForm(function(data) {
		if (data.status == 200) {
				if(upRow == 'Y'){
					var postData={"selectByField":'unitId_s_s',"unitId_s":placeId,"upRows":'Y'};
					postData.hySort_s = $("#hySort_s").find("option:selected").val() ;
					postData.hyType_s = $("#hyType_s").find("option:selected").val();
				 //	 saveDataModel(postData,"issue");
				}
			$('#savebt').attr("disabled","true");
			$("#savebt").css("background-color", "#85A2AD");
			dialog.toast("保存成功", 'none', 2000);
			var uptime = window.setTimeout(function() {
                window.location.href =  "unitDetail?edit=1&placeId=" + placeId,
				clearTimeout(uptime);
			}, 2000)
		} else {
			dialog.toast("保存失败", 'none', 2000);
		}
	}).submit();-->
    }


</script>
</body>
</html>