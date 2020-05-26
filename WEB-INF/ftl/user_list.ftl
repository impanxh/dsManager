<#import "template/template.ftl" as frame> 

 <#if subUType = 1><#global _sT="上下刊用户列表"><#else><#global _sT="用户列表"> </#if> 
	<#global menu="${_sT}">
	<@frame.html title="${_sT}"
	js=["js/jquery-dateFormat.min.js","js/jquery-ui/jquery-ui.js","js/layer-v1.9.3/layer/layer.js","js/layer.onload.js", 
	"js/datepicker.js","js/jquery.datepicker.region.cn.js","js/ajax-pushlet-client.js","js/ajax-pushlet-business.js","js/jquery-ui/jquery-ui.auto.complete.js"
	,"js/jquery.doubleScroll.js","js/jquery-dataTables-fnCounterColumns.js"]
	css=["css/sift.css","js/jquery-ui/jquery-ui.css","css/uploadprogess.css","css/jquery-ui-1.8.16.custom.css","js/jquery-ui/jquery-ui.auto.complete.css","css/autocomplete.css","css/liselect/pkg-generator.css$ver=1431443489.css"]>
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

    div#toolbar {
        float: left;
        width: 80%;
    }
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
      margin-top: 15px;
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
function trim(a,d){
        return typeof(a)=="undefined"?d:a   ;
    }
	//source,contract,sys_userList			

   


	var roleJson = {"source":"资源管理","contract":"合同管理","sys_userList":"用户管理"}					
    var table;
    function initTable () {
        table = $('#table').dataTable( {
            "dom": '<"#toolbar">Bfrt<"top"il>rt<"bottom"p><"clear">',
            buttons: [
                 {
                        extend: 'excelHtml5',
                         text: '导出excel',
                        className: 'green'
                    },
              ],
            "searching": false,
            "ordering": true,
            "serverSide": true,
               "iDisplayLength" : 500,
            "aLengthMenu": [[20, 50, 100,500], [20, 50, 100,500]],
            "columnDefs": [
                {
                    "sClass": "align-left", "targets": [0,1] ,
                    "orderable": false, "targets": [1,2,4,6]
                },
            ],
            "ajax": {
                type: "GET",
              //  url: "${rc.contextPath}/user/ajax-list",
              url: "${rc.contextPath}/sys/user-list",
              
                data: function(d) {
                    return $.extend( {}, d, {
                        "filter[name]" : $('#name').val(),
                        "filter[utype]" : 'admin',
                         "filter[subUType]" : '${subUType!''}'
                        
                    } );
                },
                "dataSrc": "content",
            },
            "columns": [
                { "data": "username", "defaultContent": "",
                    "render": function(data, type, row, meta) {
                        var filter = $('#name').val();
                        if (filter && filter != '') {
                            var regex = new RegExp(filter, "gi");
                            data = data.replace(regex, function(matched) {
                                return "<span class=\"hl\">" + matched + "</span>";
                            });
                        }
                        
                        
                    return data;//'<a href="${rc.contextPath}/user/u/' + row.username + '" >'+data+'</a> &nbsp;';
                } },
                
                   { "data": "legalman", "defaultContent": ""
                },
                // { "data": "groups.name", "defaultContent": ""},
                
                     { "data": "company", "defaultContent": ""  },
                     { "data": "region", "defaultContent": ""  },
                    /*{ "data": "utype", "defaultContent": "", "render": function(data) {
		                   if(data=='screen'){
                           		 return '移动电视';
                            }  else if(data=='body'){
                          		 	 return '车身广告';
                            }else {
                            	return '注册广告主'; 
                            }
                    }
                },*/

                  { "data": "utype", "defaultContent": "", "render": function(data, type, row, meta) {
                    
                        var ts = data.split(",");
                        if(ts ==1 ){
                             return roleJson[ts]
                        }else {
                            var pt = '';
                            $.each(ts,function(i,item){
                                    if(isNotNull(roleJson[item])){
                                         pt+= roleJson[item]+ " &nbsp;&nbsp; ";
                                    }
                                   
                            });
                            return pt;
                        }
                     
                    
                    
                } },
                { "data": "enabled", "defaultContent": "", "render": function(data) {
                    switch(data) {
                        case true:
                            return '<span class="processed">正常</span>';
                        default :
                            return '<span class="invalid">禁用</span>';
                    }
                } },
                //  { "data": "ustats", "defaultContent": "", "render": function(data) {
                //     if (data == 'init')
                //             return '<span class="processed layer-tips" tip="已认证的用户可以参与竞价!">未上传资质</span>'; 
                //         if (data == 'authentication')
                //     return '<span class="invalid">认证通过</span>'; 
                //         if (data == 'upload')
                //     return '<span class="invalid">待认证</span>';
                //         if (data == 'unauthentication')
                //     return '<span class="invalid">资质不合格</span>';
                     
                // } },
                
                { "data": function( row, type, set, meta) {
                    return row.username;
                },
                    "render": function(data, type, row, meta) {
                        return (row.enabled ? '<a class="table-action operation" href="javascript:void(0);" url="${rc.contextPath}/user/' + data + '/disable">禁用</a> &nbsp;'
                                :'<a class="table-action operation " href="javascript:void(0);" url="${rc.contextPath}/user/' + data + '/enable">启用</a> &nbsp;')
                        + '<a class="operation" href="${rc.contextPath}/user/u_edit/' + data + '" >编辑</a> &nbsp;'
                       <#--
                       +(row.ustats=='init' ? '':'<a href="javascript:void(0)" class="operation" onclick="UserQualifi(\'${rc.contextPath}\',\'' + row.username + '\');" >查看资质</a>&nbsp;'
                        +(row.ustats!='authentication' ? '<a class="table-action operation" href="javascript:void(0);" url="${rc.contextPath}/user/ustats/' + data + '/authentication">认证通过</a> &nbsp;'
                                :'<a class="table-action operation" href="javascript:void(0);" url="${rc.contextPath}/user/ustats/' + data + '/unauthentication">撤销认证</a> &nbsp;'))
                           -->     
                        +  '<a class="operation" href="javascript:void(0)" onclick="resetPW(\''+data+'\')" >重置密码</a> &nbsp;'        
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
                        '    <span>用户名</span>' +
                        '    <span>' +
                        '        <input id="name" value="">' +
                        '    </span>' +
                        '</div>'
        );

        $('#name').change(function() {
            table.fnDraw();
        });
        bindLayerMouseOver();
    }

    function jumptoPage(){
		var pagenum = parseInt(document.getElementById('pagenumber').value);
		 $('#table').dataTable().fnPageChange(pagenum-1);
	}    

    function drawCallback() {
    	//页码跳转----------->>
  	 	var tableVar = $('#table').DataTable();
		var currPage = tableVar.page.info().page + 1;
   	$("#table_paginate").append('<span>到第</span><input id="pagenumber" onkeyup="value=value.replace(/[^\\d]/g,\'\')" style="width:45px" value = "'+currPage+'"onchange="jumptoPage()"/><span>页</span>');
   	//页码跳转-----------<<

        $('.table-action').click(function() {
            $.post($(this).attr("url"), function() {
                table.fnDraw(true);
            })
        });
        trclick();
    }
    
     

    $(document).ready(function() {
        initTable();
         bindLayerMouseOver();
    } );
    
    
    function resetPW(userName){
    layer.confirm('确定重置密码为123456吗？', {icon: 3}, function(index){
    		layer.close(index);
		    if(true){
		    	 $.ajax({
		    			url:"${rc.contextPath}/user/resetPW",
		    			type:"POST",
		    			async:false,
		    			dataType:"json",
		    			data:{"userName":userName},
		    			success:function(data){
		    				if (data.left) {
		    					layer.msg(data.right);
		    					 table.dataTable()._fnAjaxUpdate();
		    				} else {
		    					layer.msg(data.right,{icon: 5});
		    				}
		    			}
		       });  
		       }
		});	
    }
</script>
<div class="withdraw-wrap color-white-bg fn-clear">
	<div class="withdraw-title">
		${_sT} <a class="block-btn" href="${rc.contextPath}/user/enter?subUType=${subUType}">添加用户</a>
	</div>
	<table id="table" class="display" cellspacing="0" width="100%">
		<thead>
			<tr>
				<th orderBy="username">用户名</th>
				<th orderBy="user.firstName">员工姓名</th>
				
				<th orderBy="company">人员描述</th>
				<th orderBy="region">邮箱</th>				
                <th style="width:200px;">拥有功能权限列表</th>
				<th orderBy="ustats">状态</th>
				<#-- <th>认证状态</th> -->
				<th>管理</th>
			</tr>
		</thead>

	</table>
</div>
</@frame.html>
