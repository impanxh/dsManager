<#assign security=JspTaglibs["/WEB-INF/tlds/security.tld"] />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <title>检查</title>
    <meta content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0" name="viewport" />
    <meta content="yes" name="apple-mobile-web-app-capable" />
    <meta content="black" name="apple-mobile-web-app-status-bar-style" />
    <meta content="telephone=no" name="format-detection" />
    <!-- 引入YDUI样式 -->
    <link rel="stylesheet" href="${rc.contextPath}/ydui_css/ydui.css" />
    <link rel="stylesheet" href="${rc.contextPath}/css/demo.css" />
    <!-- 引入jQuery 2.0+ -->
    <script src="${rc.contextPath}/js/jquery-2.0.2.min.js"></script>
    <script src="${rc.contextPath}/js/jquery.form.js"></script>
    <script src="${rc.contextPath}/js/jquery.cookie.js"></script>
    <!-- 引入YDUI自适应解决方案类库 -->
    <script src="${rc.contextPath}/ydui_js/ydui.flexible.js"></script>
    <script src="${rc.contextPath}/js/address.js"></script>
    <script src="${rc.contextPath}/js/common.js"></script>
    <script src="${rc.contextPath}/js/exif.js"></script>
    <script src="${rc.contextPath}/js/preCaution.js"></script>
    <script src="${rc.contextPath}/ydui_js/template.js"></script>
    <script src="${rc.contextPath}/js/vue.min.js"></script>
     <script src="${rc.contextPath}/js/uploadword.js"></script>
</head>
<body>
<section class="g-flexview">
    <script id="imageTemplate" type="text/html">
        <div id="{{mid}}">
            <div class="list-img">
                <img onclick="removeClassN(this)" class="list-img-img"  src="/upload_temp/{{imageUrl}}" style="margin: 0 auto;"/>
                <button onclick='del("{{imageUrl}}","{{mid}}", "{{inspId}}")' type="button">删除图片</button>
            </div>
        </div>
    </script>
    <header class="m-navbar">
        <a href="javascript:history.back(-1);" class="navbar-item" id="navbarBack"><i class="back-ico"></i></a>
        <div class="navbar-center"><span class="navbar-title" id="unitTitle"></span></div>
    </header>

    <section class="g-scrollview" id="J_List">
         <div class="list-item" style="margin-bottom: 0.2rem;margin-top: 0.2rem;">
            <div class="list-img">
                <a href="javascript:void(0);">
                    <img src="${rc.contextPath}/images/slider-sample-default.png">
                </a>
            </div>
        </div>

        <input type="hidden" id="unitId"/>
        <div class="m-list list-theme1" id="Inspection">

            <div class="m-cell" id="personPrecaution">
                <a href="javascript:void(0)" class="cell-item link">
                    <div class="cell-left">人防管理</div>
                    <div class="cell-right cell-arrow"></div>
                </a>
                <!-- 二级菜单 -->
                <div class="submenu">
                    <template v-for="(p,index) in ppList">
                    <span class="link2" v-on:click="myDropDown(p.id)">
                    <a href="javascript:void(0)" class="cell-item  menu2">
                        <label class="cell-left" style="white-space:normal">{{index+1}}.{{p.s_Map.itemName_s}}</label>
                         <label class="cell-right">
                            <input class="m-switch" type="checkbox" v-model="checkedPP" v-bind:value="p.id" v-on:click="raiseIssue(p.id)"/>
                            <i class="cell-checkbox-icon"></i>
                        </label>
                    </a>
                    </span>

                    <!-- 三级菜单 -->
                    <div class="cell-item" v-bind:id="'SUBMENU'+ p.id" style="display:none">
                    <div class="m-celltitle" style="padding-left:0;">落实情况说明</div>
                    
                        <label class="cell-textarea" style="white-space:normal;height:auto;text-align:left" >{{p.s_Map.detailDesc_s}}
                        </label>
                   
                        <div class="m-list list-theme4">
                            <template  v-if="p.s_Map.mediaFile_s != null">
                                <div class="list-img" v-for="img in p.s_Map.mediaFile_s.split(',')">
                                    <img class="list-img-img" onclick="removeClassN(this);getImgTimestamp(this)" v-bind:name="'IMG'+p.id"  v-bind:lazy-src="'/upload_temp/'+ img"  />
                                </div>
                            </template>

                            <div class="list-image" v-if="p.s_Map.wordFiles != null">
                                <template v-for="img in p.s_Map.wordFiles.split(',')">
                                  <span class="list-price"
                                   v-on:click="down(img,p.s_Map._WORDJSON_MAP[img])"  >
                                  {{ p.s_Map._WORDJSON_MAP[img]}}
                                  </span><br>
                                </template>
                            </div>

                        </div>
                    </div>
                    <div class="cell-item" v-bind:id="'COMMENTS' + p.id" style="display:none">
                        <div class="m-celltitle" style="color:red;padding-left:0;">检查问题说明</div>
                        <textarea  class="cell-textarea" v-on:change="comment(p.id, $event)">未落实规定措施。</textarea>
                        <div class="m-celltitle" style="color:red;padding-left:0;">检查图片信息</div>
                        <div class="m-cell">
                            <div class="cell-item">
                                <div class="cell-right ">
                                    <article style="width:100%;margin-bottom:10px;" class="m-list list-theme1 clearfix" v-bind:id ="p.id + 'ImageShow'">
                                    </article>
                                </div>
                            </div>
                            <div class="cell-item">
                                <div class="cell-left"></div>
                                <div class="cell-right">
                                    <div class="divupload">
                                        <form v-bind:id="p.id + 'MediaFileForm'" method="post" enctype="multipart/form-data">
                                            <div class="divuploadfile">添加图片</div>
                                            <input type="file" name="uploadFile_s" class="inputstyle" v-on:change="uploadMediaFile(p.id, $event)" />
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                    </template>
                </div>
            </div>

            <div class="m-cell" id="equipPrecaution">
                <a href="javascript:void(0)" class="cell-item link">
                    <div class="cell-left">物防管理</div>
                    <div class="cell-right cell-arrow"></div>
                </a>
                <!-- 二级菜单 -->
                <div class="submenu">
                    <template v-for="(e,index) in epList">
                    <span class="link2" v-on:click="myDropDown(e.id)">
                    <a href="javascript:void(0)" class="cell-item menu2">
                        <label class="cell-left" style="white-space:normal">{{index+1}}.{{e.s_Map.itemName_s}}</label>
                        <label class="cell-right">
                            <input class="m-switch"  type="checkbox" v-model="checkedEP" v-bind:value="e.id" v-on:click="raiseIssue(e.id)"/>
                            <i class="cell-checkbox-icon"></i>
                        </label>
                    </a>

                    </span>

                    <!-- 三级菜单 -->
                    <div class="cell-item" v-bind:id="'SUBMENU' + e.id" style="display: none">
                    <div class="m-celltitle" style="padding-left:0;">落实情况说明</div>
                        <label class="cell-left menu3" style="white-space:normal;height:auto;text-align:left"  >{{e.s_Map.detailDesc_s}}</label>
                        <div class="m-list list-theme4">
                        <template  v-if="e.s_Map.mediaFile_s != null">
                            <div class="list-img" v-for="img in e.s_Map.mediaFile_s.split(',')">
                                <img  class="list-img-img"  onclick="removeClassN(this);getImgTimestamp(this)"  v-bind:name="'IMG'+e.id"  v-bind:lazy-src="'/upload_temp/'+ img" />
                            </div>
                        </template>

                         <div class="list-image" v-if="e.s_Map.wordFiles != null">
                                <template v-for="img in e.s_Map.wordFiles.split(',')">
                                  <span class="list-price"
                                   v-on:click="down(img,e.s_Map._WORDJSON_MAP[img])"  >
                                  {{ e.s_Map._WORDJSON_MAP[img]}}
                                  </span><br>
                                </template>
                            </div>


                        </div>
                    </div>
                    <div class="cell-item" v-bind:id="'COMMENTS' + e.id" style="display:none">
                    <div class="m-celltitle" style="color:red;padding-left:0;">检查问题说明</div>
                        <textarea class="cell-textarea" v-on:change="comment(e.id, $event)">未落实规定措施。</textarea>
                        <div class="m-celltitle" style="color:red;padding-left:0;">检查图片信息</div>
                        <div class="m-cell">
                            <div class="cell-item">
                                <div class="cell-right ">
                                        <article style="width:100%;margin-bottom:20px;" class="m-list list-theme1 clearfix" v-bind:id ="e.id + 'ImageShow'">
                                        </article>
                                </div>
                            </div>
                            <div class="cell-item">
                                <div class="cell-left"></div>
                                <div class="cell-right">
                                    <div class="divupload">
                                        <form v-bind:id="e.id + 'MediaFileForm'" method="post" enctype="multipart/form-data">
                                            <div class="divuploadfile">添加图片</div>
                                            <input type="file" name="uploadFile_s" class="inputstyle" v-on:change="uploadMediaFile(e.id, $event)" />
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                    </template>
                </div>
            </div>
            <div class="m-cell" id="techPrecaution">
                <a href="javascript:void(0)" class="cell-item link">
                    <div class="cell-left">技防管理</div>
                    <div class="cell-right cell-arrow"></div>
                </a>
                <!-- 二级菜单 -->
                <div class="submenu">
                    <template v-for="(t,index) in tpList">
                    <span class="link2" v-on:click="myDropDown(t.id)">
                    <a href="javascript:void(0)" class="cell-item menu2">
                        <label class="cell-left" style="white-space:normal">{{index+1}}.{{t.s_Map.itemName_s}}</label>
                        <label class="cell-right">
                            <input class="m-switch"  type="checkbox" v-model="checkedTP" v-bind:value="t.id" v-on:click="raiseIssue(t.id)"/>
                            <i class="cell-checkbox-icon"></i>
                        </label>
                    </a>

                    </span>

                        <!-- 三级菜单 -->
                        <div class="cell-item" v-bind:id="'SUBMENU' + t.id" style="display: none">
                        <div class="m-celltitle" style="padding-left:0;">落实情况说明</div>
                            <label class="cell-left menu3" style="white-space:normal">{{t.s_Map.detailDesc_s}}</label>
                            
                            <div class="m-list list-theme4">
                                <template  v-if="t.s_Map.mediaFile_s != null">
                                    <div class="list-img" v-for="img in t.s_Map.mediaFile_s.split(',')">
                                            <img class="list-img-img" onclick="removeClassN(this);getImgTimestamp(this)" v-bind:name="'IMG'+t.id"   v-bind:lazy-src="'/upload_temp/'+ img"  />
                                    </div>
                                </template>

	                               <div class="list-img" v-if="t.s_Map.wordFiles != null">
	                                <template v-for="img in t.s_Map.wordFiles.split(',')">
	                                  <span class="list-price"
	                                   v-on:click="down(img,t.s_Map._WORDJSON_MAP[img])"  >
	                                  {{ t.s_Map._WORDJSON_MAP[img]}}
	                                  </span><br>
	                                </template>
	                            </div>


                            </div>
                        </div>
                        <div class="cell-item" v-bind:id="'COMMENTS' + t.id" style="display:none">
                        <div class="m-celltitle" style="color:red;padding-left:0;">检查问题说明</div>
                            <textarea class="cell-textarea" v-on:change="comment(t.id, $event)">未落实规定措施。</textarea>
                            <div class="m-celltitle" style="color:red;padding-left:0;">检查图片信息</div>
                            <div class="m-cell">
                                <div class="cell-item">
                                    <div class="cell-right ">
                                            <article style="width:100%;margin-bottom:20px;" class="m-list list-theme1 clearfix" v-bind:id ="t.id + 'ImageShow'">
                                            </article>
                                    </div>
                                </div>
                                <div class="cell-item">
                                    <div class="cell-left"></div>
                                    <div class="cell-right">
                                        <div class="divupload">
                                            <form v-bind:id="t.id + 'MediaFileForm'" method="post" enctype="multipart/form-data">
                                                <div class="divuploadfile">添加图片</div>
                                                <input type="file" name="uploadFile_s" class="inputstyle" v-on:change="uploadMediaFile(t.id, $event)" />
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </template>
                </div>
            </div>
            <div class="m-cell" id="mindPrecaution">
                <a href="javascript:void(0)" class="cell-item link">
                    <div class="cell-left">心防管理</div>
                    <div class="cell-right cell-arrow"></div>
                </a>
                <!-- 二级菜单 -->
                <div class="submenu">
                    <template v-for="(m,index) in mpList">
                    <span class="link2" v-on:click="myDropDown(m.id)">
                    <a href="javascript:void(0)" class="cell-item menu2">
                        <label class="cell-left" style="white-space:normal">{{index+1}}.{{m.s_Map.itemName_s}}</label>
                        <label class="cell-right">
                            <input class="m-switch"  type="checkbox" v-model="checkedMP" v-bind:value="m.id" v-on:click="raiseIssue(m.id)"/>
                            <i class="cell-checkbox-icon"></i>
                        </label>
                    </a>

                    </span>

                        <!-- 三级菜单 -->
                        <div class="cell-item" v-bind:id="'SUBMENU' +m.id" style="display: none">
                        <div class="m-celltitle" style="padding-left:0;">落实情况说明</div>
                            <label class="cell-left menu3" style="white-space:normal">{{m.s_Map.detailDesc_s}}</label>
                            <div class="m-list list-theme4">
                                <template  v-if="m.s_Map.mediaFile_s != null">
                                    <div class="list-img" v-for="img in m.s_Map.mediaFile_s.split(',')">
                                        <img class="list-img-img" onclick="removeClassN(this);getImgTimestamp(this)" v-bind:name="'IMG'+m.id"   v-bind:lazy-src="'/upload_temp/'+ img"  />
                                    </div>
                                </template>

	                            <div class="list-image" v-if="m.s_Map.wordFiles != null">
	                                <template v-for="img in m.s_Map.wordFiles.split(',')">
	                                  <span class="list-price"
	                                   v-on:click="down(img,m.s_Map._WORDJSON_MAP[img])"  >
	                                  {{ m.s_Map._WORDJSON_MAP[img]}}
	                                  </span><br>
	                                </template>
	                            </div>


                            </div>
                        </div>
                        <div class="cell-item" v-bind:id="'COMMENTS' + m.id" style="display:none">
                        <div class="m-celltitle" style="color:red;padding-left:0;">检查问题说明</div>
                            <textarea class="cell-textarea" v-on:change="comment(m.id, $event)">未落实规定措施。</textarea>
                            <div class="m-celltitle" style="color:red;padding-left:0;">检查图片信息</div>
                            <div class="m-cell">
                                <div class="cell-item">
                                    <div class="cell-right ">
                                            <article style="width:100%;margin-bottom:20px;" class="m-list list-theme1 clearfix" v-bind:id ="m.id + 'ImageShow'">
                                            </article>
                                    </div>
                                </div>
                                <div class="cell-item">
                                    <div class="cell-left"></div>
                                    <div class="cell-right">
                                        <div class="divupload">
                                            <form v-bind:id="m.id + 'MediaFileForm'" method="post" enctype="multipart/form-data">
                                                <div class="divuploadfile">添加图片</div>
                                                <input type="file" name="uploadFile_s" class="inputstyle" v-on:change="uploadMediaFile(m.id, $event)" />
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </template>
                </div>
            </div>


                <div class="m-button" style="width: 100%;">
                    <button type="button" id="submitBtn" class="btn-block btn-primary" v-on:click="submit">提交检查</button>
                </div>
        </div>
    </section>
</section>
<!--底部DIV -->
 <#include "/menu/foot.ftl" />
<!--底部DIV -->
<script src="${rc.contextPath}/ydui_js/ydui.js"></script>
<script src="${rc.contextPath}/ydui_js/ydui-list.js"></script>
<script type="text/javascript">
    function getImgTimestamp(image) {
        if(!$(image).hasClass("list-img-img")){
            YDUI.dialog.loading.open('开始获取图片信息');
            EXIF.getData(image, function() {
                var data = EXIF.getTag(this, "DateTime");
                if(data===undefined){
                    data = "无法获取拍摄时间。";
                }
                //console.log(data);
                YDUI.dialog.loading.close();
                YDUI.dialog.toast('图片拍摄时间:'+data, 'success', 2000, function () {
                    /* 关闭后调用 */
                });
            });
        }
    }

    var issueMediaFiles = {};

    //add by panxh
    function sufficeAjaxResult(result){
	    $.each( result, function(index, content)  {
		  	 var fList = content.s_Map.mediaFile_s;
		  	   if(fList != null && isNotNull(fList)) {
	            	var _WORDJSON_MAP = {};
	            	if(isNotNull(content.s_Map.wordInfo_s)){
	            		_WORDJSON_MAP =  JSON.parse(content.s_Map.wordInfo_s);
	            	}
	                var arr = fList.split(',');
	                var imageFiles = [];
	                 var wordFiles = [];
	                $.each(arr, function(i,val){
	                	 if(val != "") {//filter null
	                    	if(val.indexOf(".doc")!=-1){
	                    		wordFiles .push(val);
	                    	}else {
	                    		imageFiles .push(val);
	                    	}
	                    }
	                });
	                 content.s_Map._WORDJSON_MAP = _WORDJSON_MAP;
	                content.s_Map.wordFiles = wordFiles.join(",");
	                content.s_Map.mediaFile_s = imageFiles.join(",");
	            }
	            //--end if
		  });
		  return result;
    }

    function del(imageurl, mid, inspId) {
        var dialog = YDUI.dialog;
        dialog.confirm('确认删除', '是否确定删除图片？', [
            {
                txt: '取消',
                color: false,
                callback: function () {
                    dialog.toast('取消删除', 'none', 500);
                }
            },
            {
                txt: '确定',
                color: true,
                callback: function () {
                    dialog.toast('删除成功', 'none', 1000);
                    var file_list = issueMediaFiles[inspId];
                    file_list   =  file_list.replace(imageurl+",",'');
                    file_list   =  file_list.replace(imageurl,'');
                    issueMediaFiles[inspId] = file_list;
                    $("#"+mid).html('');
                }
            }
        ]);
    }


    $(function(){
        var unitId = getQueryString("unit");
        var userType = 1;
        var user = queryUserGroup('<@security.authentication property="principal.username" />');
        if(isNotNull(user[1])){
            if(user[1] != "*" && user[1] != "*00") {
                userType = 2;
            }
        } else {
            userType = 3;
        }
        var myUnit = getUnitById(unitId);
        if(myUnit == null) {
            window.location.href = "${rc.contextPath}/hyList"
        }
        $("#unitId").val(unitId);
        $("#unitTitle").text(myUnit.s_Map.unitName_s);

        var inspVue = new Vue({
            el: '#Inspection',
            data: {
                unit: myUnit,
                ppList: [],
                epList: [],
                tpList: [],
                mpList: [],
                totalInsps: 0,
                checkedPP: [],
                checkedEP: [],
                checkedTP: [],
                checkedMP: [],
                issueComments: {},
            },
            mounted: function(){
                this.$nextTick(function() {
                    this.showData();
                })
            },
            methods: {
                showData: function () {
                    var _self = this;
                    _self.ppList = sufficeAjaxResult( getPrecautionItems(unitId, "PersonPrecaution"));
                    _self.epList = sufficeAjaxResult( getPrecautionItems(unitId, "EquipPrecaution"));
                    _self.tpList = sufficeAjaxResult( getPrecautionItems(unitId, "TechPrecaution"));
                    _self.mpList = sufficeAjaxResult( getPrecautionItems(unitId, "MindPrecaution"));
                    _self.totalInsps = _self.ppList.length + _self.epList.length +
                            _self.tpList.length + _self.mpList.length;
                },
                myDropDown: function(inspId) {
                    var subNode = document.getElementById("SUBMENU"+inspId);
                    if(subNode.style.display == "none") {
                        subNode.style.display = "block";

                        var imgs = document.getElementsByName("IMG"+inspId);
                        for(var i=0;i<imgs.length;i++) {
                            var _src = imgs[i].getAttribute('lazy-src');
                            if(_src !== imgs[i].src){
                                imgs[i].src = _src;}
                        }
                    } else {
                        subNode.style.display = "none";
                    };
                    //e.currentTarget.parentNode.toggleClass('open');
                },
                raiseIssue: function(inspId) {
                   var commentsNode =  document.getElementById("COMMENTS"+inspId);
                    if(commentsNode.style.display == "none") {
                        commentsNode.style.display = "block";
                    } else {
                        commentsNode.style.display = "none";
                    };
                },
                comment: function(inspId, event) {
                    var currentNode = event.currentTarget;
                    this.issueComments[inspId]=currentNode.value;
//                    console.log(this.issueComments);
                },
                uploadMediaFile: function(inspId, event) {
                    var currentNode = event.currentTarget;
                    var fileName = currentNode.value;
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
                            var file_list = '';
                            if(isNotNull(issueMediaFiles[inspId])){
                               file_list = issueMediaFiles[inspId];
                            }
                            file_list =  file_list== '' ? data.path :  file_list + "," + data.path;
                            issueMediaFiles[inspId] = file_list;

                            $("#" + inspId + "ImageShow").append(template("imageTemplate",
                                    {inspId: inspId, imageUrl:data.path, mid:data.path.replace(new RegExp("/","g"),'').replace('.','')}));
                            YDUI.dialog.loading.close();
                        }
                    };
                    YDUI.dialog.loading.open('图片上传中');
                    setTimeout(function () {
                        $("#" + inspId + "MediaFileForm").ajaxSubmit(options);
                    }, 1000);
                },

                getImgTimestamp:function(imageId) {
                    //YDUI.dialog.alert("Entering image");
                    if($("#IMGUNIQ"+imageId).hasClass("list-img-img")){
                        $("#IMGUNIQ"+imageId).removeClass("list-img-img");
                    }else{
                        $("#IMGUNIQ"+imageId).addClass("list-img-img");
                    }

                    var image = document.getElementById("IMGUNIQ" + imageId);
                    var imageInfo = document.getElementById("IMGINFO" + imageId);
                    EXIF.getData(image, function() {
                        //console.log(EXIF.pretty(this));
                        var data = EXIF.getTag(this, "DateTime");
                        //console.log(data);
                        if(isNotNull(data)) {
                            imageInfo.innerHTML = "图片拍摄时间: " + data;
                        } else {
                            imageInfo.innerHTML = "图片信息缺失，非原图";
                        }
                    });
                },
                submit: function() {
//                   console.log(this.checkedEP);
//                   console.log(this.checkedPP);
//                   console.log(this.checkedTP);
//                   console.log(this.checkedMP);

                    var issueList = [];
                    for(ep of this.checkedEP) {
                        var issue = {"id": ep, "type": "EquipPrecaution", "comments":"未落实规定措施。", "mediaFiles": ""};
                        if(isNotNull(this.issueComments[ep])) {
                            issue.comments = this.issueComments[ep];
                        }
                        if(isNotNull(issueMediaFiles[ep])) {
                            issue.mediaFiles = issueMediaFiles[ep];
                        }
                        issueList.push(issue);
                    }

                    for(pp of this.checkedPP) {
                        var issue = {"id": pp, "type": "PersonPrecaution", "comments":"未落实规定措施。", "mediaFiles": ""};
                        if(isNotNull(this.issueComments[pp])) {
                            issue.comments = this.issueComments[pp];
                        }
                        if(isNotNull(issueMediaFiles[pp])) {
                            issue.mediaFiles = issueMediaFiles[pp];
                        }
                        issueList.push(issue);
                    }
                    for(tp of this.checkedTP) {
                        var issue = {"id": tp, "type": "TechPrecaution", "comments":"未落实规定措施。", "mediaFiles": ""};
                        if(isNotNull(this.issueComments[tp])) {
                            issue.comments = this.issueComments[tp];
                        }

                        if(isNotNull(issueMediaFiles[tp])) {
                            issue.mediaFiles = issueMediaFiles[tp];
                        }
                        issueList.push(issue);
                    }
                    for(mp of this.checkedMP) {
                        var issue = {"id": mp, "type": "MindPrecaution", "comments":"未落实规定措施。", "mediaFiles": ""};
                        if(isNotNull(this.issueComments[mp])) {
                            issue.comments = this.issueComments[mp];
                        }

                        if(isNotNull(issueMediaFiles[mp])) {
                            issue.mediaFiles = issueMediaFiles[mp];
                        }
                        issueList.push(issue);
                    }
                    //console.log(issueList);
                    var params = {
                        "unitId_s": myUnit.id,
                        "hySort_s": myUnit.s_Map.hySort_s,
                        "hyType_s": myUnit.s_Map.hyType_s,
                        "code_s": myUnit.s_Map.code_s,
                        "inspector_s": '<@security.authentication property='principal.userDetail.legalman' htmlEscape='false' />',
                        "username_s": '<@security.authentication property='principal.username' htmlEscape='false' />',
                        "userType_i": userType,
                        "totalInsps_i": this.totalInsps,
                        "foundIssue_i": issueList.length,
                        "solvedIssue_i": 0,
                        "inspResult_s": JSON.stringify(issueList),
                    };

                    $.ajax({
                        type: 'POST',
                        url: 'http://' + changeAddr() + '/common/saveModel?className=InspRecord&checkUniq=N&UID=<@security.authentication property="principal.username" />',
                        async: false,
                        data: params,
                        success: function (data) {
                            window.location.href = "${rc.contextPath}/placebase?unit=" + $("#unitId").val();
                        }
                    });
                }
            }
        });

        //列表手风琴缩放
        var Accordion = function(el, multiple) {
            this.el = el || {};
            this.multiple = multiple || false;

            // Variables privadas
            var links = this.el.find('.link');
            //var links2 = this.el.find('.link2');
            // Evento
            links.on('click', {el: this.el, multiple: this.multiple}, this.dropdown)
            //links2.on('click', {el: this.el, multiple: this.multiple}, this.dropdown2)
        }

        Accordion.prototype.dropdown = function(e) {
            var $el = e.data.el;
            $this = $(this),
                    $next = $this.next();
            $next.slideToggle();
            $this.parent().toggleClass('open');

            if (!e.data.multiple) {
                $el.find('.submenu').not($next).slideUp().parent().removeClass('open');
            };
        }

        Accordion.prototype.dropdown2 = function(e) {
            var $el = e.data.el;
            $this = $(this),
                    $next = $this.next();
            $next.slideToggle();
            $this.parent().toggleClass('open');

            if (!e.data.multiple) {
                $el.find('.submenu2').not($next).slideUp().parent().removeClass('open');
            };
        }

        var personP = new Accordion($('#personPrecaution'), false);
        var equipP = new Accordion($('#equipPrecaution'), false);
        var techP = new Accordion($('#techPrecaution'), false);
        var mindP = new Accordion($('#mindPrecaution'), false);

        $('img.lazy').lazyLoad();

    })

</script>
</body>
</html>