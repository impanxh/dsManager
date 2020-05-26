<#import "../template/template.ftl" as frame> <#global menu="民警工作量报表">
<@frame.html title="民警工作量报表"
js=["js/layer-v1.9.3/layer/layer.js","js/layer.onload.js","js/vue_self.js",
"js/jquery-dateFormat.min.js","js/jquery-ui/jquery-ui.js","js/datepicker.js","js/jquery.datepicker.region.cn.js"]
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
            "dom": '<"#toolbar">Bfrt',
			buttons: [
				 {
                extend: 'excelHtml5',
                 text: '导出excel',
                className: 'green'
            },
			],

							"searching" : false,
							"ordering" : false,
							"serverSide" : true,
							"iDisplayLength" : 500,
							 "scrollX": true,
            "iDisplayLength" : 20	,
            "aLengthMenu": [[50, 100,500], [50,100,500]],
            "aaSorting": [[0, "asc"]],
            "columnDefs": [
                {
                    "orderable": false, "targets": [1,2]
                },
            ],
            "ajax": {
                type: "GET",
                url: 'http://'+changeAddr()+'/workBi',
                data: function(d) {
                 return $.extend( {}, d, {
                        "s" : $('#startD').val(),
                        "e" : $('#endD').val()
                    } );
                },
               "dataSrc": function (json) {
                    return json;
                }
            },
            "columns": [
                { "data": "policeName", "defaultContent": ""},
                { "data": "reginName","defaultContent": ""  },
                  { "data": "userName","defaultContent": ""  },
                { "data": "legalman","defaultContent": ""  },
                
                { "data": "unitsSum","defaultContent": ""  },
                { "data": "checkSum","defaultContent": ""  },
            ],
            "language": {
                "url": "${rc.contextPath}/js/jquery.dataTables.lang.cn.json"
            },
            "initComplete": initComplete,
            "drawCallback": drawCallback,
            "preDrawCallback": preDrawCallback ,
        } );
        table.fnNameOrdering("orderBy").fnNoColumnsParams();
          table.fnFakeRowspan(0, [0]).fnNameOrdering("orderBy").fnNoColumnsParams();
    }
 		function preDrawCallback(){
     
              
           if($.trim($("div#toolbar").html()) == ''){
	              $("div#toolbar").html(
	                '<div>' +
	                       '<span>日期查询 起</span>&nbsp;<span><input '+
								' class="datepicker" value="2018-01-01" '+
								' type="text"  id="startD" style="width:120px"/>'+
								  '    </span>&nbsp;&nbsp;' +
								   '&nbsp;&nbsp;<span>止</span>&nbsp;<span><input '+
								' class="datepicker" '+
								' type="text"  id="endD" value="2019-01-01" style="width:120px"/>&nbsp;&nbsp;'+
	                        '</div>'
	        );
           }
           
           
       }
       
       
	function initDatePicker(ele){
		ele.datepicker({
		dateFormat:"yy-mm-dd",
		autoSize:true,
		})
	}
    function initComplete() {
       initDatePicker($(".datepicker"));
        $('#endD,#startD').change(function() {
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
 
</div>
</script>

<div class="withdraw-wrap color-white-bg fn-clear">
<input type="hidden" id="type_s" name="type_s" value="region">
	<div class="withdraw-title">
		${menu!''}<!-- <a class="block-btn" id="addPS" href="javascript:void(0);">添加派出所</a>-->
	</div>
	<table id="table" class="trclick display nowrap" style="table-layout:fixed" cellspacing="0">
		<thead>
			<tr>
				<th style="width:240px">单位名称</th>
				<th>所属辖区</th>
				<th>登录帐号</th>
				<th>民警姓名</th>
				<th>管辖企业数量</th>
				<th>巡检次数</th>
				 
			</tr>
		</thead>

	</table>
</div>
</@frame.html>