<#assign security=JspTaglibs["/WEB-INF/tlds/security.tld"] />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <title>行业列表</title>
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
        <a href="${rc.contextPath}/mod_login" class="navbar-item"><i class="back-ico"></i></a>
        <div class="navbar-center"><span class="navbar-title" id="">行业综合分类</span></div>
    </header>


    <section class="g-scrollview" id="J_List">
        <!--
    <h1 class="demo-pagetitle" id="unitTitle"></h1>
    <h2 class="demo-detail-title"></h2>
         -->
        <div class="list-item" style="margin-bottom: 0.2rem;margin-top: 0.2rem;" >
            <div class="list-img">
                <a href="javascript:void(0);">
                    <img src="${rc.contextPath}/images/slider-sample-hy.png">
                </a>
            </div>
        </div>

        <div id="J_ListContent" class="m-grids-3" >
            <template  v-for="data in List">
                <a v-if="isLeader == 0" :href="'${rc.contextPath}/placeManage?unit='+data.id+'&regis='+data.regisTag" class="grids-item"<#-- j_link比较重要需要加--> >
                    <div class="grids-icon">
                        <i  style="font-size: 26px;color:#FF685D;"><img :src="'${rc.contextPath}/images/icon/icon_'+data.id+ '.png'"/>
                        </i>
                    </div>
                    <div class="grids-txt">
                        {{data.name}}
                        <span class="badge badge-primary">{{data.value}}</span>
                        <input type="hidden" id="placeId"  v-bind:value="data.id" >
                    </div>
                </a>

                <a v-if="isLeader == 1" :href="'${rc.contextPath}/hyAreaList?industryId='+data.id" class="grids-item"<#-- j_link比较重要需要加--> >
                    <div class="grids-icon"><i  style="font-size: 26px;color:#FF685D;" >
                        <img :src="'${rc.contextPath}/images/icon/icon_'+data.id+ '.png'"/>
                    </i>
                    </div>
                    <div class="grids-txt">
                        {{data.name}}
                        <span class="badge badge-primary">{{data.value}}</span>
                        <input type="hidden" id="placeId"  v-bind:value="data.id" >
                    </div>
                </a>


            </template>
        </div>
    <#--
        <div class="m-button" style="width: 100%;">
                <a href="${rc.contextPath}/personPrecaution/PPIssueList">
                <button type="button" class="btn-block btn-primary">纠纷隐患</button>
                </a>

        </div>
        -->
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
        var s = queryUserGroup('<@security.authentication property="principal.username" />');
        var goodsVue = new Vue({
            el: '#J_ListContent',
            data: {
                List : ''
            },
            methods: {
                nameSearch: function () {
                    var _self = this;
                    $.ajax({
                        type: 'GET',
                        url: 'http://'+changeAddr()+'/unitGroup?userid=<@security.authentication property="principal.username" />',
                        success:function(data) {
                            var desc = function(x,y)
                            {
                                return (x['value'] < y['value']) ? 1 : -1
                            }
                            data.sort(desc);
                            
							   $.each(data, function(i,val){   
							  	 val.regisTag ='';   
							     if(val.id == "0"){
							     	val.value  = val.value * -1;
							     	val.regisTag = 1;
							     	val.id = '';
							     } 
							  }); 
							  
                            _self.List = data;
                            _self.isLeader = 0;
                            if(isNotNull(s) && isNotNull(s[1])  &&   ('*00' ==s[1]) ){
                                _self.isLeader = 1;
                            }
                        }
                    });
                }
            }
        })

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