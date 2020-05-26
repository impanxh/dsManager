<#import "../template/template.ftl" as frame> <#global menu="行业管理">
<@frame.html title="行业管理"
js=["js/layer-v1.9.3/layer/layer.js","js/layer.onload.js","js/vue_self.js"]
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
            "aaSorting": [[0, "asc"]],
            "columnDefs": [
                {
                    "orderable": false, "targets": [1,2]
                },
            ],
            "ajax": {
                type: "GET",
                url: 'http://'+changeAddr()+'/common/getModelListV2?filter[className]=industry',
                data: function(d) {
                 return $.extend( {}, d, {
                        "filter[type_s_s]" : "industry",
                        "filter[name_s_s]" : $('#psName').val(),
                    } );
                },
               "dataSrc": function (json) {
                    json.recordsTotal=json.totalElements;
                    json.recordsFiltered=json.totalElements;
                    return json.content;
                }
            },
            "columns": [
                { "data": "name_s", "defaultContent": ""},
                { "data": "remark_s", "defaultContent": ""},
                { "data": "id" ,"defaultContent" :"",
                    "render": function(data, type, row, meta) {
                    var operations= '&nbsp;<a class="table-link" target="_blank" href="javascript:void(0);" onclick="editPMsg(\''+data+'\');"><font color="green"><B>编辑</B></font><a/>';
                        operations+= '&nbsp;<a class="table-link" target="_blank" href="javascript:void(0);" onclick="delContract(\''+data+'\');"><font color="green"><B>删除</B></font><a/>';
                    return operations;
                    }
                },
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
                        '    <span>行业名称</span>' +
                        '        <input id="psName" value="">' +
                        '</div>'
        );

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
                title:"行业信息",
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
                title:"行业信息",
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
    <div  style="margin-top:30px;" class="ui-form-item"> <label class="ui-label mt10"><span class="ui-form-required">* </span>行业名称： </label>
        <input class="ui-input" type="text" name="name_s" id="name_s" v-model="policeSMsg.name_s"  data-is="isAmount isEnough" autocomplete="on" disableautocomplete="">
    </div>

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
<input type="hidden" id="type_s" value="industry">
	<div class="withdraw-title">
		${menu!''} <a class="block-btn" id="addPS" href="javascript:void(0);">添加行业</a>
	</div>
	<table id="table" class="display" cellspacing="0" width="100%">
		<thead>
			<tr>
				<th orderBy="name_s_s">行业名称</th>
				<th>备注</th>
				<th>操作</th>
			</tr>
		</thead>

	</table>
</div>
</@frame.html>