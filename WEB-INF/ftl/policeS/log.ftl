<#import "../template/template.ftl" as frame> <#global menu="操作日志">
<@frame.html title="操作日志"
js=["js/layer-v1.9.3/layer/layer.js","js/layer.onload.js","js/vue_self.js","js/jquery-dateFormat.js"]
css=["js/jquery-ui/jquery-ui.css","css/jquery-ui-1.8.16.custom.css","js/jquery-ui/jquery-ui.auto.complete.css","css/uploadprogess.css","css/liselect/pkg-generator.css$ver=1431443489.css"]>

<link rel="stylesheet" type="text/css" href="${rc.contextPath}/css/basecss.css">
<script type="text/javascript" language="javascript" src="${rc.contextPath}/js/export/jquery.dataTables.min.js"></script>
<link rel="stylesheet" type="text/css" href="${rc.contextPath}/js/export/buttons.dataTables.min.css">
<script type="text/javascript" language="javascript" src="${rc.contextPath}/js/export/dataTables.buttons.min.js"></script>
<script type="text/javascript" language="javascript" src="${rc.contextPath}/js/export/jszip.min.js"></script>
<script type="text/javascript" language="javascript" src="${rc.contextPath}/js/export/buttons.html5.min.js"> </script>

<script type="text/javascript" language="javascript"
    src="${rc.contextPath}/js/jquery-dataTables-fnNameOrdering.js"></script>
<script type="text/javascript" language="javascript"
    src="${rc.contextPath}/js/underscore.js"></script>
<script type="text/javascript" language="javascript"
    src="${rc.contextPath}/js/jquery-dataTables-fnNoColumnsParams.js"></script>
<script type="text/javascript" language="javascript"
    src="${rc.contextPath}/js/jquery-dataTables-fnFakeRowspan.js"></script>
<script src="${rc.contextPath}/js/vue.min.js"></script>
<script src="https://cdn.bootcss.com/vue-resource/1.4.0/vue-resource.js"></script>
<#--  <script src="https://unpkg.com/axios/dist/axios.min.js"></script>  -->


<style type="text/css">
.operation
{
	color: #E0296C;
    font-weight: 800;
}
table.dataTable.display tbody td {
    word-break: break-all;
    white-space: normal;
    word-wrap: break-word;
}
div.dt-buttons{
      float: right !important;
      margin-top: -15px;
}
a.green{
    border: 0;
    font-size: 16px;
    height: 35px;
    line-height: 35px;
    text-align: center;
    background: #ff9966;
    color: #fff;
    cursor: pointer;
    display: inline-block;
    padding: 0 15px;
    text-decoration: none;
    font-weight: 600;
    letter-spacing: 2px;
    }
.ui-input {
    width: 180px;
}
</style>

<script type="text/javascript">
    var table;
    var vm ;
    
    var jsonObject = {'Unit':'单位信息',
        'EquipPrecaution':'物防信息',
        'TechPrecaution':'技防信息',
        'PersonPrecaution':'人防信息',
        'MindPrecaution':'心防信息',
        'Inspection':'主体责任检查',
        'InspRecord':'检查记录',
        'InspectionBank':'检查清单库',
        'Workgroup':'工作小组',
        'issue':'隐患纠纷',
        'industry':'行业',
        'FireDrill':'消防演练',
        'FireEdu':'消防培训',
    }
    function initTable () {
        table = $('#table').dataTable( {
            //"dom": '<"#toolbar"><"top"il>rt<"bottom"p><"clear">',
            "dom": '<"#toolbar">Bfrt<"top"il>rt<"bottom"p><"clear">',
            buttons: [
                 {
                        extend: 'excelHtml5',
                         text: '导出excel',
                        className: 'green'
                    },
              ],

							"searching" : false,
							"ordering" : true,
							"serverSide" : true,
							"iDisplayLength" : 500,
            "aLengthMenu": [[50, 100,500], [50,100,500]],
            "aaSorting": [[0, "desc"]],
            "columnDefs": [
                {
                    "orderable": false, "targets": [1,2,3,4]
                },
            ],
            "ajax": {
                type: "GET",
                url: 'http://'+changeAddr()+'/common/getModelListV2?filter[className]=log',
                data: function(d) {
                 return $.extend( {}, d, {
                        "filter[userid_s_s]" : $('#psName').val(),
                    } );
                },
               "dataSrc": function (json) {
                    json.recordsTotal=json.totalElements;
                    json.recordsFiltered=json.totalElements;
                    return json.content;
                }
            },
            "columns": [
                { "data": "created_dt", "defaultContent": "","render": function(data, type, row, meta) {
                	var d= $.format.date(data, "yyyy-MM-dd hh:mm:ss");
                	return d;
                }},
                { "data": "userid_s", "defaultContent": ""},
                { "data": "url_s", "defaultContent": "",
                    "render": function(data, type, row, meta) {
                    if(data.indexOf("saveModel")!=-1 ){
                    	return row.saveTag_s == 'Y' ? "更新" : "新增";
                    }
                    return data.indexOf("delById")!=-1? '删除数据':'';
                    }},
                
                { "data": "className_s", "defaultContent": "","render": function(data, type, row, meta) {
                	 
                	return isNotNull(jsonObject[data])? jsonObject[data]:data;
                }},
                <#--{ "data": "params_s", "defaultContent": ""},-->
                { "data": "unitName_s", "defaultContent": ""}
                 
            ],
            "language": {
                "url": "${rc.contextPath}/js/jquery.dataTables.lang.cn.json"
            },
            "initComplete": initComplete,
            "drawCallback": drawCallback,
        } );
        table.fnNameOrdering("orderBy").fnNoColumnsParams();
    }

    function initComplete() {

		$("div#toolbar").html(
		
                '<div>' +
                        '    <span>操作人</span>' +
                        '        <input id="psName" value="">' +
                        '</div>'
        );
        //$("div#toolbar").html('');

        $('#psName').change(function() {
            table.fnDraw();
        });

    }
function delContract(id){
	layer.confirm('确定删除吗？', {icon: 3}, function(index){
    		layer.close(index);
    		if(1==1){
                vAdd();
                vm.delDate(id);
			}
    		});

   }
    function drawCallback() {
        $('.table-action').click(function() {
            $.post($(this).attr("url"), function() {
                table.fnDraw(true);
            })
        });
    }

    function editPMsg(id){
        var content_popup=$("#addStation").html();
            layer.open({
                skin:'layer-ext-ylcskin',
                title:"派出所信息",
                type:1,
                shadeClose:true,
                skin : 'layui-layer-rim',
                area:['500px','350px'],
                content:content_popup
            });
        vAdd();
        vm.queryData(id);
    }
    $(document).ready(function() {
        initTable();
        $("#addPS").click(function(){
            var content_popup=$("#addStation").html();
            layer.open({
                skin:'layer-ext-ylcskin',
                title:"派出所信息",
                type:1,
                shadeClose:true,
                skin : 'layui-layer-rim',
                area:['500px','350px'],
                content:content_popup
            });
            vAdd();
        })


    });

</script>


<script type="text/template" id="addStation">

<div id="pMsg">
<form @submit.prevent="submit" method="post">
<#--
    <div  style="margin-top:30px;" class="ui-form-item"> <label class="ui-label mt10"><span class="ui-form-required">* </span>派出所名称： </label>
        <input class="ui-input" type="text" name="name_s" id="name_s" v-model="policeSMsg.name_s"  data-is="isAmount isEnough" autocomplete="on" disableautocomplete="">
    </div>
    -->

    <div class="ui-form-item"> <label class="ui-label mt10">备注： </label>
        <textarea rows="4" cols="20" data-is="isAmount isEnough" style="resize: none;" v-model="policeSMsg.remark_s" name="remark_s"></textarea>
    </div>

    <div class="widthdrawBtBox">
        <input type="submit" id="subutton" class="block-btn" value="确认提交">
    </div>
</form>
</div>
</script>

<div class="withdraw-wrap color-white-bg fn-clear">
<input type="hidden" id="type_s" name="type_s" value="region">
	<div class="withdraw-title">
	</div>
	<table id="table" class="display" cellspacing="0" width="100%">
		<thead>
			<tr>
				<th orderBy="created_dt" width="160px">操作时间</th>
				<th width="80px">操作人</th>
				<th width="80px">动作</th>
				<th width="120px">事项</th>
				<th  >相关单位</th>
			<#--	<th>内容</th>-->
			</tr>
		</thead>

	</table>
</div>
</@frame.html>