<#import "../template/template.ftl" as frame> <#global menu="上下刊角色管理">
<@frame.html title="上下刊角色管理"
js=["js/layer-v1.9.3/layer/layer.js","js/layer.onload.js"]
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
    src="${rc.contextPath}/js/jquery-dataTables-fnNoColumnsParams.js"></script>
<script type="text/javascript" language="javascript"
    src="${rc.contextPath}/js/jquery-dataTables-fnFakeRowspan.js"></script>
 

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
</style>

<script type="text/javascript">
    var table;
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
            "columnDefs": [
                {
                    "sClass": "align-left", "targets": [0,1] ,
                    "orderable": false, "targets": [1,2,3]
                },
            ],
            "ajax": {
                type: "GET",
                url: "${rc.contextPath}/user/ajax-roleList?rev_=4",
                data: function(d) {
                 return $.extend( {}, d, {
                        "name_" : $('#name').val()
                    } );
                    
                },
               "dataSrc": function(json) {
                var  l  = (json.length);
                  json.recordsTotal=l ;
                   json.recordsFiltered=l ;
                   return json;},
            },
            "columns": [
                { "data": "actIdGroup.name", "defaultContent": ""},
                { "data": "groupId", "defaultContent": ""},
                { "data": "functions", "defaultContent": ""},
                { "data": function( row, type, set, meta) {
                    return row.actIdGroup.id ;
                },
                    "render": function(data, type, row, meta) {
                        var operations= '<a class=" operation" href="${rc.contextPath}/user/to_editRole/' + data + '" >修改</a> ';
                         operations +='&nbsp;&nbsp;<a class="table-link operation" href="javascript:delContract(\''+data+'\');" >删除</a>  &nbsp;';
                         return operations;
                        ;
                    }},
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
                        '    <span>角色名称</span>' +
                        '        <input id="name" value="">' +
                        '</div>'
        );

        $('#name').change(function() {
            table.fnDraw();
        });
    }
function delContract(id){
	layer.confirm('确定删除吗？', {icon: 3}, function(index){
    		layer.close(index);
    		if(1==1){
				 $.ajax({
						url:"${rc.contextPath}/user/deleRole/"+id,
						type:"POST",
						async:false,
						dataType:"json",
						data:{},
						success:function(data){
							if (data.left == true) {
								layer.msg(data.right);
							   var uptime = window.setTimeout(function(){
							window.location.href="${rc.contextPath}/user/skrole_list";
						   	clearTimeout(uptime);
									},2000)
							} else {
								layer.msg(data.right);
							}
						}
			      }); 
			      
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
    
    $(document).ready(function() {
        initTable();
    } );
</script>
<div class="withdraw-wrap color-white-bg fn-clear">
	<div class="withdraw-title">
		上下刊角色管理 <a class="block-btn" href="${rc.contextPath}/user/addRole?rev_=4">添加角色</a>
	</div>
	<table id="table" class="display" cellspacing="0" width="100%">
		<thead>
			<tr>
				<th orderBy="actIdGroup.name">角色名称</th>
				<th>角色简码</th>
				<th>权限</th>
				<th>操作</th>
			</tr>
		</thead>

	</table>
</div>
</@frame.html>
