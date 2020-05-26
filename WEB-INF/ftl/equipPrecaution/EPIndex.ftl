<#assign security=JspTaglibs["/WEB-INF/tlds/security.tld"] />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <title>物防信息管理</title>
    <meta content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0" name="viewport" />
    <meta content="yes" name="apple-mobile-web-app-capable" />
    <meta content="black" name="apple-mobile-web-app-status-bar-style" />
    <meta content="telephone=no" name="format-detection" />
    <!-- 引入YDUI样式 -->
    <link rel="stylesheet" href="${rc.contextPath}/ydui_css/ydui.css" />
    <link rel="stylesheet" href="${rc.contextPath}/css/demo.css" />
    <!-- 引入YDUI自适应解决方案类库 -->
    <script src="${rc.contextPath}/ydui_js/ydui.flexible.js"></script>

</head>
<body>
<section class="g-flexview">
    <header class="m-navbar">
        <a href="javascript:history.back(-1);" class="navbar-item" id="navbarBack"><i class="back-ico"></i></a>
        <div class="navbar-center"><span class="navbar-title" id="unitTitle"></span></div>
    </header>

    <section class="g-scrollview">

        <h1 class="demo-pagetitle">物防信息管理</h1>
        <h2 class="demo-detail-title"></h2>

        <div class="m-grids-4" id="EquipPrecaution">
            <template  v-for="equip in equipList">
                <a class="grids-item" href="javascript:void(0);" v-on:click="viewEP(equip)">
                    <div class="grids-icon" >
                        <i class="icon-order" style="font-size: 26px;color:#FF685D;"></i>
                    </div>
                    <div class="grids-txt">{{equip}}</div>
                </a>
            </template>
            <a class="grids-item" v-bind:href="newEPUrl">
                <div class="grids-icon">
                    <i class="icon-more" style="font-size: 26px;color:#FF685D;"></i>
                </div>
                <div class="grids-txt">增加</div>
            </a>
        </div>
        <!--
        <div class="m-grids-3">
            <a class="grids-item" href="javascript:void(0);" onclick="gotoAnEP('防卫器械')">
                <div class="grids-icon" >
                    <i class="icon-order" style="font-size: 26px;color:#FF685D;"></i>
                </div>
                <div class="grids-txt">防卫器械</div>
            </a>
            <a class="grids-item" href="javascript:void(0);" onclick="gotoAnEP('四周围墙')">
                <div class="grids-icon">
                    <i class="icon-type" style="font-size: 26px;color:#FF685D;"></i>
                </div>
                <div class="grids-txt">四周围墙</div>
            </a>
            <a class="grids-item" href="javascript:void(0);" onclick="gotoAnEP('防护装置')">
                <div class="grids-icon">
                    <i class="icon-feedback" style="font-size: 26px;color:#FF685D;"></i>
                </div>
                <div class="grids-txt">防护装置</div>
            </a>
            <a class="grids-item" href="javascript:void(0);"  onclick="gotoAnEP('警务室')">
                <div class="grids-icon">
                    <i class="icon-setting" style="font-size: 26px;color:#FF685D;"></i>
                </div>
                <div class="grids-txt">警务室</div>
            </a>
            <a class="grids-item" href="javascript:void(0);" onclick="gotoAnEP('家长等候区')">
                <div class="grids-icon">
                    <i class="demo-icons-list"></i>
                </div>
                <div class="grids-txt">家长等候区</div>
            </a>
            <a class="grids-item" href="javascript:void(0);" onclick="gotoAnEP('内部重点区域')">
                <div class="grids-icon">
                    <i class="demo-icons-badge"></i>
                </div>
                <div class="grids-txt">内部重点区域</div>
            </a>
            <input type="hidden" id="unitId" />
        </div>
        -->
   	</section>
</section>
<!-- 引入jQuery 2.0+ -->
<script src="${rc.contextPath}/js/jquery-2.0.2.min.js"></script>
<script src="${rc.contextPath}/js/jquery.form.js"></script>
<script src="${rc.contextPath}/js/jquery-dateFormat.js"></script>
<!-- 引入city包 -->
<script src="${rc.contextPath}/ydui_js/ydui.citys.js"></script>
<!-- 引入YDUI脚本 -->
<script src="${rc.contextPath}/ydui_js/ydui.js"></script>
<script src="${rc.contextPath}/js/vue.min.js"></script>
<script src="${rc.contextPath}/js/preCaution.js"></script>
<script src="${rc.contextPath}/js/address.js"></script>
<script>
    !function ($) {

    }(jQuery);

    $(document).ready(function(){
        var unitId = getQueryString("unit");
        // 副标题
        var myUnit = getUnitById(unitId);
        if(myUnit != null) {
            $("#unitTitle").text(myUnit.s_Map.unitName_s);
            $("#navbarBack").attr("href", "${rc.contextPath}/placebase?unit="+unitId);
        }

        var equipVue = new Vue({
            el: '#equipPrecaution',
            data: {
                unitId: unitId,
                equipList: [],
                newEPUrl: "/equipPrecaution/EPEdit?unit="+unitId,
            },
            mounted: function(){
                this.$nextTick(function() {
                    this.showData();
                })
            },
            methods: {
                showData: function () {
                    var _self = this;
                    $.ajax({
                        type: 'GET',
                        url: 'http://' + changeAddr() + '/common/getModelList',
                        async: false,
                        data: {
                            "filter[className]": "EquipPrecaution",
                            "length": 1024,
                            "unitId_s": unitId,
                            "userid":"<@security.authentication property="principal.username" />",
                            "isTaskQuery": "yes"
                        },
                        success: function (data) {
                            if(data.totalElements > 0) {
                                var itemLi = [];
                                $.each(data.content, function(i, item){
                                    itemLi.push(item.s_Map.itemName_s)
                                })
                                itemLi.sort();
                                _self.equipList = $.unique(itemLi);
                            }
                        }
                    });
                },

                viewEP: function(equip) {
                    window.location.href = "${rc.contextPath}/equipPrecaution/EPView?unit=" + unitId +
                            "&item=" + equip;
                }
            }
        })

    })
</script>
</body>


</html>