<#assign security=JspTaglibs["/WEB-INF/tlds/security.tld"] />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <title>查看检查记录</title>
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
    <script src="${rc.contextPath}/js/jquery-dateFormat.js"></script>
    <script src="${rc.contextPath}/js/jquery.form.js"></script>
    <script src="${rc.contextPath}/js/preCaution.js"></script>
    <script src="${rc.contextPath}/js/address.js"></script>
    <script src="${rc.contextPath}/js/common.js"></script>
    <script src="${rc.contextPath}/js/vue.min.js"></script>
    <script src="${rc.contextPath}/ydui_js/template.js"></script>

</head>
<body>
<section class="g-flexview">
    <script id="imageView" type="text/html">
        <div class="list-img" style="text-align: -webkit-center;">
            <img class="list-img-img" src="/upload_temp/{{imageUrl}}" id="{{mid}}" style="margin: 0 auto;" onclick="removeClassN(this)"/>
        </div>
    </script>
    <script id="imageTemplate" type="text/html">
        <div id="{{mid}}">
            <div class="list-img">
                <img onclick="removeClassN(this)" class="list-img-img" src="/upload_temp/{{imageUrl}}" style="margin: 0 auto;"  />
                <button onclick='del("{{imageUrl}}","{{mid}}", "{{inspId}}")' type="button">删除图片</button>
            </div>
        </div>
    </script>
    <header class="m-navbar">
        <a href="javascript:history.back(-1);" class="navbar-item" id="navbarBack"><i class="back-ico"></i></a>
        <div class="navbar-center"><span class="navbar-title" id="unitTitle"></span></div>
    </header>

    <section class="g-scrollview">
        <!--
        <h1 class="demo-pagetitle">查阅检查记录</h1>
        <h2 class="demo-detail-title"></h2>
        -->
        <input type="hidden" id="inspId">
        <div class="m-list" id="Inspection">
            <div class="m-cell result-d">
                <div class="cell-item">
                    <div class="cell-left"><i class="cell-icon icon-type"></i>检查单位：</div>
                    <div class="cell-right">
                    <label class="cell-textarea" style="height:auto;text-align:left">{{unitName}}</label>
                    </div>
                </div>
                <div class="cell-item">
                    <div class="cell-left"><i class="cell-icon icon-star"></i>检查人员：</div>
                    <div class="cell-right">
                    <label class="cell-textarea" style="height:auto;text-align:left" >{{inspector}}</label>
                    </div>
                </div>

                <div class="cell-item">
                    <div class="cell-left"><i class="cell-icon icon-clock"></i>检查时间：</div>
                    <div class="cell-right">
                    <label class="cell-textarea" style="height:auto;text-align:left">{{inspTime}}</label>
                    </div>
                </div>
                <div class="cell-item">
                    <div class="cell-left"><i class="cell-icon icon-question"></i>检查结果：</div>
                    <div class="cell-right">
                        <template v-if="foundIssue > 0">
                            <label class="cell-textarea" style="height:auto;text-align:left;color:red">共检查{{totalInsps}}条安全责任条目，发现  <B>{{foundIssue}}</B>  处问题</label>
                        </template>
                        <template v-else>
                            <label class="cell-textarea" style="height:auto;text-align:left">未发现问题</label>
                        </template>
                    </div>
                </div>
                <div class="cell-item" v-show="foundIssue > 0">
                    <div class="cell-left"><i class="cell-icon icon-checkoff"></i>问题处理：</div>
                    <div class="cell-right">
                         <label class="cell-textarea" style="height:auto;text-align:left;color:green">已解决  <B>{{solvedIssue}}</B>  处问题</label>
                    </div>
                </div>
                <div class="cell-item">
                    <template v-if="score > 90">
                        <div class="cell-left"><i class="cell-icon icon-good"></i>本次得分：</div>
                        <div class="cell-right">
                            <label class="cell-textarea" style="height:auto;text-align:left;color:green">{{score}}分。</label>
                        </div>
                    </template>
                    <template v-else>
                        <div class="cell-left"><i class="cell-icon icon-bad"></i>本次得分：</div>
                        <div class="cell-right">
                            <label class="cell-textarea" style="height:auto;text-align:left;color:red">{{score}}分。 </label>
                        </div>
                    </template>
                </div>
            </div>
            <div class="m-cell result-d">
                <div class="list-item" v-if="foundIssue > 0">
                    <div class="m-celltitle mintitle">人防检查</div>
                    <template v-for="(insp, index) in ppList">
                        <div class="m-cell">
                            <div class="cell-item">
                                <div class="cell-left" style="color:red"><b>{{index+1}}、检查内容：</b></div>
                                <div class="cell-right">
                                    <label class="cell-textarea" style="color:red;height:auto;text-align:left" >{{insp.title}}</label>
                                </div>
                            </div>
                            <div class="cell-item">
                                <div class="cell-left" style="color:red"><b>发现问题：</b></div>
                                <div class="cell-right">
                                    <label class="cell-textarea" style="color:red;height:auto;text-align:left" >{{insp.comments}}</label>
                                </div>
                            </div>
                            <div class="m-cell">
                                <article class="m-list list-theme1" v-html="insp.issueIMGS">
                                </article>
                            </div>
                            <label class="cell-item">
                                <span class="cell-left" style="color:limegreen"><b>问题已解决</b></span>
                                <label class="cell-right">
                                    <template v-if="insp.status == 1">
                                        <input type="checkbox" v-on:click="check(index, 'Person')" class="m-switch" checked/>
                                    </template>
                                    <template v-else>
                                        <input type="checkbox" v-on:click="check(index, 'Person')" class="m-switch"/>
                                    </template>
                                </label>
                            </label>
                            <div class="cell-item" v-bind:id="'solu'+ insp.id" v-show="insp.status == 1">
                                <div class="cell-left" style="color:limegreen"><b>解决措施：</b></div>
                                <div class="cell-right">
                                    <textarea class="cell-textarea" v-on:change="solution(index, 'Person', $event)">{{insp.solutions}}</textarea>
                                </div>
                            </div>
                            <div class="" v-show="insp.status == 1">
                                <div class="cell-item">
                                     <div class="cell-left" style="color:limegreen"><b>解决图片：</b></div>
                                    <div class="cell-right">
                                            <article v-html="insp.soluIMGS" style="width:100%;margin-bottom:20px;" class="m-list list-theme1 clearfix" v-bind:id ="insp.id + 'ImageShow'">
                                            </article>
                                    </div>
                                </div>
                                <div class="cell-item">
                                    <div class="cell-left"></div>
                                    <div class="cell-right">
                                        <div class="divupload">
                                            <form v-bind:id="insp.id + 'MediaFileForm'" method="post" enctype="multipart/form-data">
                                                <div class="divuploadfile">添加图片</div>
                                                <input type="file" name="uploadFile_s" class="inputstyle" v-on:change="uploadMediaFile(insp.id, $event)" />
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </template>
                    <div class="m-celltitle mintitle">物防检查</div>
                    <template v-for="(insp, index) in epList">
                        <div class="m-cell result-d">
                            <div class="cell-item">
                                <div class="cell-left" style="color:red"><b>{{index+1}}、检查内容：</b></div>
                                <div class="cell-right">
                                    <label class="cell-textarea" style="color:red;height:auto;text-align:left" >{{insp.title}}</label>
                                </div>
                            </div>
                            <div class="cell-item">
                                <div class="cell-left" style="color:red"><b>发现问题：</b></div>
                                <div class="cell-right">
                                    <label class="cell-textarea" style="color:red;height:auto;text-align:left" >{{insp.comments}}</label>
                                </div>
                            </div>
                            <div class="m-cell">
                                <article class="m-list list-theme1" v-html="insp.issueIMGS">
                                </article>
                            </div>

                            <label class="cell-item">
                                <span class="cell-left" style="color:limegreen"><b>问题已解决</b></span>
                                <label class="cell-right">
                                    <template v-if="insp.status == 1">
                                        <input type="checkbox" v-on:click="check(index, 'Equip')" class="m-switch" checked/>
                                    </template>
                                    <template v-else>
                                        <input type="checkbox" v-on:click="check(index, 'Equip')" class="m-switch"/>
                                    </template>
                                </label>
                            </label>
                            <div class="cell-item" v-bind:id="'solu'+ insp.id" v-show="insp.status == 1" >
                                <div class="cell-left" style="color:limegreen"><b>解决措施：</b></div>
                                <div class="cell-right">
                                    <textarea class="cell-textarea" v-on:change="solution(index, 'Equip', $event)">{{insp.solutions}}</textarea>
                                </div>

                            </div>
                            <div class="m-cell" v-show="insp.status == 1">
                                <div class="cell-item">
                                    <div class="cell-right ">
                                            <article v-html="insp.soluIMGS" style="width:100%;margin-bottom:20px;" class="m-list list-theme1 clearfix" v-bind:id ="insp.id + 'ImageShow'">
                                            </article>
                                    </div>
                                </div>
                                <div class="cell-item">
                                    <div class="cell-left"></div>
                                    <div class="cell-right">
                                        <div class="divupload">
                                            <form v-bind:id="insp.id + 'MediaFileForm'" method="post" enctype="multipart/form-data">
                                                <div class="divuploadfile">添加图片</div>
                                                <input type="file" name="uploadFile_s" class="inputstyle" v-on:change="uploadMediaFile(insp.id, $event)" />
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </template>

                    <div class="m-celltitle mintitle">技防检查</div>
                    <template v-for="(insp, index) in tpList">
                        <div class="m-cell result-d">
                            <div class="cell-item">
                                <div class="cell-left" style="color:red"><b>{{index+1}}、检查内容：</b></div>
                                <div class="cell-right">
                                    <label class="cell-textarea" style="color:red;height:auto;text-align:left" >{{insp.title}}</label>
                                </div>
                            </div>
                            <div class="cell-item">
                                <div class="cell-left" style="color:red"><b>发现问题：</b></div>
                                <div class="cell-right">
                                    <label class="cell-textarea" style="color:red;height:auto;text-align:left" >{{insp.comments}}</label>
                                </div>
                            </div>
                            <div class="m-cell">
                                <article class="m-list list-theme1" v-html="insp.issueIMGS">
                                </article>
                            </div>
                            <label class="cell-item">
                                <span class="cell-left" style="color:limegreen"><b>问题已解决</b></span>
                                <label class="cell-right">
                                    <template v-if="insp.status == 1">
                                        <input type="checkbox" v-on:click="check(index, 'Tech')" class="m-switch" checked/>
                                    </template>
                                    <template v-else>
                                        <input type="checkbox" v-on:click="check(index, 'Tech')" class="m-switch"/>
                                    </template>
                                </label>
                            </label>
                            <div class="cell-item" v-bind:id="'solu'+ insp.id" v-show="insp.status == 1">
                                <div class="cell-left" style="color:limegreen"><b>解决措施：</b></div>
                                <div class="cell-right">
                                    <textarea class="cell-textarea" v-on:change="solution(index, 'Tech', $event)">{{insp.solutions}}</textarea>
                                </div>
                            </div>
                            <div class="m-cell" v-show="insp.status == 1">
                                <div class="cell-item">
                                    <div class="cell-right ">
                                            <article v-html="insp.soluIMGS" style="width:100%;margin-bottom:20px;" class="m-list list-theme1 clearfix" v-bind:id ="insp.id + 'ImageShow'">
                                            </article>
                                    </div>
                                </div>
                                <div class="cell-item">
                                    <div class="cell-left"></div>
                                    <div class="cell-right">
                                        <div class="divupload">
                                            <form v-bind:id="insp.id + 'MediaFileForm'" method="post" enctype="multipart/form-data">
                                                <div class="divuploadfile">添加图片</div>
                                                <input type="file" name="uploadFile_s" class="inputstyle" v-on:change="uploadMediaFile(insp.id, $event)" />
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </template>


                    <div class="m-celltitle mintitle">心防检查</div>
                    <template v-for="(insp, index) in mpList">
                        <div class="m-cell result-d">
                            <div class="cell-item">
                                <div class="cell-left" style="color:red"><b>{{index+1}}、检查内容：</b></div>
                                <div class="cell-right">
                                    <label class="cell-textarea" style="color:red;height:auto;text-align:left" >{{insp.title}}</label>
                                </div>
                            </div>
                            <div class="cell-item">
                                <div class="cell-left" style="color:red"><b>发现问题：</b></div>
                                <div class="cell-right">
                                    <label class="cell-textarea" style="color:red;height:auto;text-align:left" >{{insp.comments}}</label>
                                </div>
                            </div>
                            <div class="m-cell">
                                <article class="m-list list-theme1" v-html="insp.issueIMGS">
                                </article>
                            </div>
                            <label class="cell-item">
                                <span class="cell-left" style="color:limegreen"><b>问题已解决</b></span>
                                <label class="cell-right">
                                    <template v-if="insp.status == 1">
                                        <input type="checkbox" v-on:click="check(index, 'Mind')" class="m-switch" checked/>
                                    </template>
                                    <template v-else>
                                        <input type="checkbox" v-on:click="check(index, 'Mind')" class="m-switch"/>
                                    </template>
                                </label>
                            </label>
                            <div class="cell-item" v-bind:id="'solu'+ insp.id" v-show="insp.status == 1">
                                <div class="cell-left" style="color:limegreen"><b>解决措施：</b></div>
                                <div class="cell-right">
                                    <textarea class="cell-textarea" v-on:change="solution(index, 'Mind', $event)">{{insp.solutions}}</textarea>
                                </div>
                            </div>
                            <div class="m-cell" v-show="insp.status == 1">
                                <div class="cell-item">
                                    <div class="cell-right ">
                                            <article v-html="insp.soluIMGS" style="width:100%;margin-bottom:20px;" class="m-list list-theme1 clearfix" v-bind:id ="insp.id + 'ImageShow'">
                                            </article>
                                    </div>
                                </div>
                                <div class="cell-item">
                                    <div class="cell-left"></div>
                                    <div class="cell-right">
                                        <div class="divupload">
                                            <form v-bind:id="insp.id + 'MediaFileForm'" method="post" enctype="multipart/form-data">
                                                <div class="divuploadfile">添加图片</div>
                                                <input type="file" name="uploadFile_s" class="inputstyle" v-on:change="uploadMediaFile(insp.id, $event)" />
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </template>

                </div>
            </div>
            <footer class="m-tabbar">
                <div class="m-button" style="width: 100%;">
                    <button type="button" id="submitBtn" class="btn-block btn-primary" v-on:click="submit">更新状态</button>
                </div>
            </footer>
        </div>
   	</section>
</section>
<!--底部DIV -->
 <#include "/menu/foot.ftl" />

<script src="${rc.contextPath}/ydui_js/ydui.js"></script>
<script>
    var soluMediaFiles = {};
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
                    var file_list = soluMediaFiles[inspId];
                    file_list   =  file_list.replace(imageurl+",",'');
                    file_list   =  file_list.replace(imageurl,'');
                    soluMediaFiles[inspId] = file_list;
                    $("#"+mid).html('');
                }
            }
        ]);
    }
    !function ($) {
    }(jQuery);

    function getInspectionById(inspId) {
        var insp = null;
        $.ajax({
            "url" : "http://" + changeAddr() + "/common/queryById?className=InspRecord&id=" + inspId,
            type : 'GET',
            async : false,
            data : { },
            dataType : 'json',
            success : function(data) {
                if (data.id != null) {
                    insp = data;
                }
            }
        });
        return insp;
    }

    $(function(){
        var userType = getQueryString("user") || "";
        var unitId = getQueryString("unit");
        var myUnit = getUnitById(unitId);
        if(myUnit == null) {
            window.location.href = "${rc.contextPath}/hyList"
        }
        $("#unitTitle").text(myUnit.s_Map.unitName_s + "--查阅检查记录");

        var inspId = getQueryString("id");
        var myInsp = getInspectionById(inspId);
        if(myInsp == null) {
            YDUI.dialog.toast('参数错误：无效的检查记录编码', 'error', 2000, function () {
                window.location.href = "${rc.contextPath}/hyList";
            });
        }

        var inspVue = new Vue({
            el: '#Inspection',
            data: {
                unitId: unitId,
                userType: userType,
                inspector: myInsp.s_Map.inspector_s,
                unitName: myUnit.s_Map.unitName_s,
                inspTime: $.format.date(myInsp.created_dt, "yyyy-MM-dd HH:mm:ss"),
                totalInsps: myInsp.i_Map.totalInsps_i,
                foundIssue: myInsp.i_Map.foundIssue_i,
                solvedIssue: myInsp.i_Map.solvedIssue_i,
                score: 100,
                ppList: [],
                epList: [],
                tpList: [],
                mpList: []
            },
            mounted: function(){
                this.$nextTick(function() {
                    this.showData();
                })
            },
            methods: {
                showData: function () {
                    var _self = this;
                    var myInspResults = JSON.parse(myInsp.s_Map.inspResult_s);
                    _self.score = Math.round(100*(_self.totalInsps-_self.foundIssue)/_self.totalInsps);
                    $.each(myInspResults, function(i, item){
                        if(isNotNull(item.mediaFiles)) {
                            var arr = item.mediaFiles.split(',');
                            var imageHtml = '';
                            $.each(arr, function(i,val){
                                if(val != "") {
                                    imageHtml += template("imageView", {imageUrl:val, mid:val.replace(new RegExp("/","g"),'').replace('.','')});
                                }
                            });
                            item.issueIMGS = imageHtml;
                        }
                        if(isNotNull(item.soluMediaFiles)) {
                            soluMediaFiles[item.id] = item.soluMediaFiles;
                            var arr = item.soluMediaFiles.split(',');
                            var imageHtml = '';
                            $.each(arr, function(i,val){
                                if(val != "") {
                                    imageHtml += template("imageTemplate", {inspId:item.id, imageUrl:val, mid:val.replace(new RegExp("/","g"),'').replace('.','')});
                                }
                            });
                            item.soluIMGS = imageHtml;
                        }
                        if(!isNotNull(item.title) || item.title == "") {
                            var precaution = getPrecautionById(item.type, item.id);
                            if(precaution != null) {
                                item.title = precaution.s_Map.itemName_s;
                            }
                        }
                        switch(item.type) {
                            case "PersonPrecaution":
                                _self.ppList.push(item);
                                break;
                            case "EquipPrecaution":
                                _self.epList.push(item);
                                break;
                            case "TechPrecaution":
                                _self.tpList.push(item);
                                break;
                            case "MindPrecaution":
                                _self.mpList.push(item);
                                break;
                            default:
                                break;
                        }

                    })
                },
                submit: function () {
                    var _self = this;
                    var issueList = [];
                    for(ep of this.epList) {
                        ep.issueIMGS = "";
                        ep.soluIMGS = "";
                        if(isNotNull(soluMediaFiles[ep.id])){
                            ep.soluMediaFiles = soluMediaFiles[ep.id];
                        }
                        issueList.push(ep);
                    }
                    for(pp of this.ppList) {
                        pp.issueIMGS = "";
                        pp.soluIMGS = "";
                        if(isNotNull(soluMediaFiles[pp.id])){
                            pp.soluMediaFiles = soluMediaFiles[pp.id];
                        }
                        issueList.push(pp);
                    }
                    for(tp of this.tpList) {
                        tp.issueIMGS = "";
                        tp.soluIMGS = "";
                        if(isNotNull(soluMediaFiles[tp.id])){
                            tp.soluMediaFiles = soluMediaFiles[tp.id];
                        }
                        issueList.push(tp);
                    }
                    for(mp of this.mpList) {
                        mp.issueIMGS = "";
                        mp.soluIMGS = "";
                        if(isNotNull(soluMediaFiles[mp.id])){
                            mp.soluMediaFiles = soluMediaFiles[mp.id];
                        }
                        issueList.push(mp);
                    }
                    var params = {
                        "selectByField": "id",
                        "id": myInsp.id,
                        "solvedIssue_i": this.solvedIssue,
                        "inspResult_s": JSON.stringify(issueList),
                    };

                    $.ajax({
                        type: 'POST',
                        url: 'http://' + changeAddr() + '/common/saveModel?className=InspRecord&checkUniq=Y&UID=<@security.authentication property="principal.username" />',
                        async: false,
                        data: params,
                        success: function (data) {
                            window.location.href = "${rc.contextPath}/inspection/ResultList?unit=" + _self.unitId +
                               "&user=" + _self.userType + "&time=" + (new Date()).valueOf();
                        }
                    });

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
                            if(isNotNull(soluMediaFiles[inspId])){
                                file_list = soluMediaFiles[inspId];
                            }
                            file_list =  file_list== '' ? data.path :  file_list + "," + data.path;
                            soluMediaFiles[inspId] = file_list;

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
                check: function (index, precautionEnum) {
                    var _self = this;
                    var currentNode = event.currentTarget;
                    var isChecked = currentNode.checked ? 1:0;
                    if(isChecked == 1) {
                        _self.solvedIssue++;
                    } else {
                        _self.solvedIssue--;
                    }
                    var nodeId = "solu";
                    switch(precautionEnum) {
                        case "Person":
                            _self.ppList[index].status = isChecked;
//                            if(isChecked == 0) {
//                                _self.ppList[index].solutions = "";
//                            }
                            nodeId = _self.ppList[index].id;
                            break;
                        case "Tech":
                            _self.tpList[index].status = isChecked;
//                            if(isChecked == 0) {
//                                _self.tpList[index].solutions = "";
//                            }
                            nodeId = _self.tpList[index].id;
                            break;
                        case "Mind":
                            _self.mpList[index].status = isChecked;
//                            if(isChecked == 0) {
//                                _self.mpList[index].solutions = "";
//                            }
                            nodeId = _self.mpList[index].id;
                            break;
                        case "Equip":
                            _self.epList[index].status = isChecked;
//                            if(isChecked == 0) {
//                                _self.epList[index].solutions = "";
//                            }
                            nodeId = _self.epList[index].id;
                            break;
                        default:
                            break;
                    }

                    var solNode = document.getElementById("solu" + nodeId);
                    if(isChecked == 1) {
                        solNode.style.display = "block";
                    } else {
                        solNode.style.display = "none";
                    }
                },
                solution: function(index, precautionEnum, event) {
                    var _self = this;
                    var currentNode = event.currentTarget;
                    var solutionDesc = currentNode.value;
                    switch(precautionEnum) {
                        case "Person":
                            _self.ppList[index].solutions = solutionDesc;
                            break;
                        case "Tech":
                            _self.tpList[index].solutions = solutionDesc;
                            break;
                        case "Mind":
                            _self.mpList[index].solutions = solutionDesc;
                            break;
                        case "Equip":
                            _self.epList[index].solutions = solutionDesc;
                            break;
                        default:
                            break;
                    }
                },
            }
        })
    });

</script>
</body>
</html>