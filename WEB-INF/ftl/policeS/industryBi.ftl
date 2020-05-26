<#import "../template/template.ftl" as frame> <#global menu="辖区单位汇总表">
<@frame.html title="辖区单位汇总表"
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
                url: 'http://'+changeAddr()+'/industryBi',
                data: function(d) {
                 return $.extend( {}, d, {
                        "filter[type_s_s]" : "region",
                        "filter[name_s_s]" : $('#psName').val(),
                    } );
                },
               "dataSrc": function (json) {
                    return json;
                }
            },
            "columns": [
                { "data": "police", "defaultContent": ""},
                { "data": "sub", "defaultContent": ""},
                { "data": "p.industry09","defaultContent": ""  },
                
                { "data": "p.industry13","defaultContent": ""  },
                { "data": "p.industry04","defaultContent": ""  },
                 { "data": "p.industry06","defaultContent": ""  },
                { "data": "p.industry02","defaultContent": ""  },
                { "data": "p.industry05","defaultContent": ""  },
                
                 { "data": "p.industry03","defaultContent": ""  },
                { "data": "p.industry10","defaultContent": ""  },
                 { "data": "p.industry15","defaultContent": ""  },
                { "data": "p.industry18","defaultContent": ""  },
                { "data": "p.industry20","defaultContent": ""  },
                
                 { "data": "p.industry07","defaultContent": ""  },
                { "data": "p.industry08","defaultContent": ""  },
                 { "data": "p.industry11","defaultContent": ""  },
                { "data": "p.industry14","defaultContent": ""  },
                { "data": "p.industry17","defaultContent": ""  },
                
                 { "data": "p.industry21","defaultContent": ""  },
                { "data": "p.industry19","defaultContent": ""  },
                 { "data": "p.industry16","defaultContent": ""  },
                { "data": "p.industry12","defaultContent": ""  },
                  { "data": "p.合计","defaultContent": ""  },
                
                
                
               
            ],
            "language": {
                "url": "${rc.contextPath}/js/jquery.dataTables.lang.cn.json"
            },
            "initComplete": initComplete,
            "drawCallback": drawCallback,
        } );
        table.fnNameOrdering("orderBy").fnNoColumnsParams();
          table.fnFakeRowspan(0, [0]).fnNameOrdering("orderBy").fnNoColumnsParams();
    }

    function initComplete() {

		$("div#toolbar").html(
                '<div>' +
                        '    <span>派出所名称</span>' +
                        '        <input id="psName" value="">' +
                        '</div>'
        );
		$("div#toolbar").html('');
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
				<th orderBy="name_s_s">派出所名称</th>
				<th style="width:120px">辖区</th>
				<th>学校</th>
				
				<th>养老院</th>
				<th>危化品</th>
				<th>寄递业</th>
				<th>制水</th>
				<th>旅馆</th>
				
				<th>木质品企业</th>
				<th>散装汽油</th>
				<th>	瓶装燃气</th>
				<th>印染企业</th>
				<th>洗浴足浴</th>
				
				<th>矿业</th>
				<th>医院</th>
				<th>大型商超</th>
				<th>客运站</th>
				<th>放射源</th>
				
				
				<th>银行</th>
				<th>网吧</th>
				<th>歌厅</th>
				<th>餐饮</th>
				<th>合计</th>
				 
			</tr>
		</thead>

	</table>
</div>
</@frame.html>