<#import "../template/template.ftl" as frame> <#global menu="URLMapping">
<#assign security=JspTaglibs["/WEB-INF/tlds/security.tld"] />
<@frame.html title="URLMapping"
js=["js/jquery-ui/jquery-ui.js","js/jquery-dateFormat.js",
"js/jquery-ui/jquery-ui.auto.complete.js","js/datepicker.js","js/jquery-dataTables-fnCounterColumns.js","js/SQ.js","js/commonsheet.js", 
"js/jquery.datepicker.region.cn.js","js/jquery-dataTables-checkboxSelect.js","js/progressbar.js"] 
css=["css/sift.css","js/jquery-ui/jquery-ui.css","css/uploadprogess.css","css/jquery-ui-1.8.16.custom.css","js/jquery-ui/jquery-ui.auto.complete.css","css/autocomplete.css"]>

<link rel="stylesheet" type="text/css" href="${rc.contextPath}/css/basecss.css">
<script type="text/javascript" language="javascript" src="/js/export/jquery.dataTables.min.js"></script>
<link rel="stylesheet" type="text/css" href="/js/export/buttons.dataTables.min.css">
<script type="text/javascript" language="javascript" src="/js/export/dataTables.buttons.min.js"></script>
<script type="text/javascript" language="javascript" src="/js/export/jszip.min.js"></script>
<script type="text/javascript" language="javascript" src="/js/export/buttons.html5.min.js"> </script>
  <script type="text/javascript" language="javascript"
  src="${rc.contextPath}/js/jquery-dataTables-fnNameOrdering.js"></script>
<script type="text/javascript" language="javascript"
  src="${rc.contextPath}/js/jquery-dataTables-fnNoColumnsParams.js"></script>
<script type="text/javascript" language="javascript"
  src="${rc.contextPath}/js/laytpl.js"></script>

<style>
div#toolbar {
    float: left;
}
  .double-scroll { width: 400px; }
  #sample2{width: 100%;}
  .ui-input {
    width: 200px;
  }
  .tdd{
    background-color: #3bafda;
    color: white;
    font-weight: normal;
    text-align: center;
    line-height: 30px;
    }
    th, td { white-space: nowrap;border: 1px solid #C5C5C5;text-align: center;}
   div.dt-buttons{
      float: right;
      margin-top: 5px;
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
    .light-green{color: #0a850a;}
    .select_img {
    margin-top: 0;
    margin-left: 0;
     } 
  #InvoiceDetail{
        padding: 50px;
  }
</style>
<#assign nowTag=.now?long> 
<script type="text/javascript">


    var inMsg;
    var a = 0;
    function getNo(){
      return a++;
    }
    var v="";
    var authList="";
    function initR(){ 
     $.ajax({
		url : 'http://' + changeAddr() + '/bi/dataAuthList?userId=<@security.authentication property="principal.username" />',
		type : 'GET',
		async : false,
		dataType : 'json',
		success : function(data) {
				authList=data;
			　$.each(data,function(index,item){v+=item+",";});
		}
	});
	}
	function getRequestRole(){
	    var f= $('#center').val();
	    if(f==''){
	    	return v; 
	    }
	    var s=f.split(",");
	    var r="";
	   	 for (var i=0;i<s.length;i++)
			{
				if($.inArray( s[i], authList )!=-1){
				r+=s[i]+",";
				}
			}
			r=	r==''?'-':r;
		return r;
	}

      var aia = 0;
    function initTable () {
      aia=0;
    	initR();
        inMsg = $('#table').DataTable( {
            "dom": '<"#toolbar"><"top"il>Bfrt<"bottom"p>',  
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
            "scrollX": true,
            "iDisplayLength" : 20	,
            "aLengthMenu": [[20, 40, 100,2000], [20, 40, 100,2000]],
            "aaSorting": [[6, "desc"]],
              "columnDefs": [
                { "orderable": false, "targets": [0,1] },
            ],
            "ajax": {
                type: "post",
                url : '/url/mapping-list',
                data: function(d) {
                

                     return $.extend( {}, d, {
                      "filter[path]" : $('#path').val(),
                      "filter[view]": $("#view").val(),
                        "filter[user]" : $('#user').val(),
                      "filter[comment]": $("#comment").val()
                     } );
                },
                 "dataSrc": function (json) { 
                    json.recordsTotal=json.totalElements;
                    json.recordsFiltered=json.totalElements;
                    //console.log(json);
                   // console.log(json.totalElements);
                    return json.content;
                }

            },
            "columns": [
                { "data": "", "defaultContent": ""},
                { "data": "id","defaultContent": "",
                "render": function(data, type, row, meta) {
                    var operations='';
                    operations+= '&nbsp;&nbsp;<a class="table-action operation" href="javascript:void(0);" onclick="udpate(\''+data+'\' )"><font color="green"><B>更新</B></font></a>';
                    
                    operations+= '&nbsp;&nbsp;<a class="table-action operation" href="javascript:void(0);" onclick="delURl(\''+data+'\' )"><font color="green"><B>删除</B></font></a>';
                      return operations;
                }},
                
                { "data": "path", "defaultContent": "",
                "render": function(data, type, row, meta) {
                    var operations='';
                    var f = data ;
                    if(f.indexOf("?")!=-1){
                      f+= "&_=" + (new Date()).valueOf(); 
                    }else  {
                     f+= "?_=" + (new Date()).valueOf(); 
                    }
                  
                    operations+='&nbsp;<a class="table-link" target="_blank" href="${rc.contextPath}/-/'+f+'";"><font color="green"><B>'+data+'</B></font></a>';
                      return operations;
                }},
                { "data": "view", "defaultContent": ""},
                { "data": "user", "defaultContent": ""},
                { "data": "comment", "defaultContent": ""},
                { "data": "created", "defaultContent": "", "render": function(data) {
                    return data == null ? "" : $.format.date(data, "yyyy-MM-dd");
              }},
              { "data": "updated", "defaultContent": "", "render": function(data) {
                    return data == null ? "" : $.format.date(data, "yyyy-MM-dd");
              }},
 
            ],
            "language": {
                "url": "${rc.contextPath}/js/jquery.dataTables.lang.cn.json"
            },
            "initComplete": initComplete,
           	 "drawCallback": drawCallback,
             "preDrawCallback": preDrawCallback ,
            
        } );
         //inMsg.fnNameOrdering("orderBy").fnNoColumnsParams();
         $('#table').dataTable().fnNameOrdering();
        
    }
  function _trimDateToDefault(v,append,d) {
       return typeof(v)!="undefined" && v != ""   ? v +  append : d;
  }
     function preDrawCallback(){
     
      //  alert(new Date());
            //  console.log(settings);
              
           if($.trim($("div#toolbar").html()) == ''){
			     	   $("div#toolbar").html(
			                '<div>' +
                   
							  
			                        '    <span>访问路经&nbsp;</span>' +
			                        '    <span><input id="path" value=""></span>&nbsp;&nbsp;' +
                                '    <span>Ftl文件名&nbsp;</span>' +
			                        '    <span><input id="view" value=""></span>&nbsp;&nbsp;' +
			                        
			                         '    <span>操作人&nbsp;</span>' +
			                        '    <span><input id="user" value=""></span>&nbsp;&nbsp;' +
			                         '    <span>备注&nbsp;</span>' +
			                        '    <span><input id="comment" value=""></span>&nbsp;&nbsp;' +
                 '</div>'
			        );
		        }
		       
     
     }

    function initDatePicker(ele){
    ele.datepicker({
    //dateFormat:"yy-mm-dd",
    autoSize:true,
    })
    }

    function initComplete() {
      initDatePicker($(".datepicker"));
    	this.api().on( 'draw', function () {
   		// alert( 'draw' );
  		});

            
           	  $('#path,#view,#user,#comment').change(function() {
	            inMsg.draw();
        });
    }

    //页码跳转
	function jumptoPage(){
		var pagenum = parseInt(document.getElementById('pagenumber').value);
		 $('#table').dataTable().fnPageChange(pagenum-1);
	}    
    function drawCallback() {
      //counter_columns( $('#table').dataTable(),0);
    	bindLayerMouseOver();
      // counter_columns(table,0);
      //设定序号列
      var api = this.api();
　　     var startIndex= api.context[0]._iDisplayStart;//获取到本页开始的条数

　　     api.column(0).nodes().each(function(cell, i) {
　　　　    cell.innerHTML = startIndex + i + 1;
　　　　 });

    	//页码跳转----------->>
   	 	var tableVar = $('#table').DataTable();
		var currPage = tableVar.page.info().page + 1;
    	$("#table_paginate").append('<span>到第</span><input id="pagenumber" onkeyup="value=value.replace(/[^\\d]/g,\'\')" style="width:45px" value = "'+currPage+'"onchange="jumptoPage()"/><span>页</span>');
    	//页码跳转-----------<<
    	
        $('.table-action').click(function() {
            $.post($(this).attr("url"), function() {
                inMsg.draw();
            })
        });

    }

    $(document).ready(function() {
        initTable();
    } );
    
</script>
<div class="withdraw-wrap color-white-bg fn-clear">
	<div class="withdraw-title"> URLMapping 
	<input type="hidden" id="cid" /><a class="block-btn" onclick="addMsg('<@security.authentication property="principal.username" />', '');" href="javascript:void(0);"> 添加数据 </a>
  </div>
<#--	<div class="double-scroll" border="2" id="sample2">-->
	<table id="table" class="trclick display nowrap" cellspacing="0" width="100%">
		<thead>
			<tr>
        <th>序号</th>
        <th>操作</th>
        <th orderBy="path">访问路经Path</th>
        <th orderBy="view">ftl文件位置</th>
        <th orderBy="user">操作人</th>
        <th orderBy="comment">备注</th>
        <th orderBy="created">创建日期</th>
        <th orderBy="updated">更新日期</th>
			</tr>
		</thead>
	</table>
	<div>
	版本信息:<a href = "/url/debug" target="_blank">1.0</a>
	<div>
	<#--</div>-->
</div> 
</@frame.html>

<script id="demo" type="text/html">



<form id="baseMsg" method="post">

  <div class="ui-form-item"> 
    <label class="ui-label mt10"> <span class="ui-form-required">* </span>访问路经Path </label>

    <input class="ui-input" type="text" name="path" id="path" value="{{d.path}}"  data-is="isAmount isEnough" autocomplete="on" disableautocomplete=""> 
  </div>

  <div class="ui-form-item"> 
    <label class="ui-label mt10"><span class="ui-form-required">* </span>ftl文件位置</label>
    <input class="ui-input" type="text" name="view" id="view" style="width:320px" value="{{d.view}}"  data-is="isAmount isEnough" autocomplete="off" disableautocomplete=""> 
  </div>

  <div class="ui-form-item"> <label class="ui-label mt10"><span class="ui-form-required">* </span>操作人</label>
    <input class="ui-input" type="text" name="user" id="user" value="{{d.user}}"  data-is="isAmount isEnough" autocomplete="off" disableautocomplete=""> 
  </div>

   

   <div class="ui-form-item"> 
    <label class="ui-label mt10">备注</label>
    <input class="ui-input" type="text" name="comment" id="comment" value="{{d.comment}}"  data-is="isAmount isEnough" autocomplete="off" disableautocomplete=""> 

  </div>
     <input id="company_s" name="company_s" type="hidden" value="" />
  <input type="hidden" name="id" id="id" value="{{d.id}}" />
  
</form>
  
  <div class="widthdrawBtBox">
    <input type="button" id="subutton" onclick="saveBase();"  class="block-btn" value="确认" >
  </div>
 

</script>

<script type="text/javascript">
  function changeCompany(k){
    var changeCompany = {'QC':'七彩中心','白马':'白马中心','CBS':'CBS中心','ZY':'自营中心'}
    return changeCompany[k];
  }
  
  
   function udpate(id){
          layer.open({
                type : 1,
                title : "修改数据",
                skin : 'layui-layer-rim',
                area : [ '650px', '500px' ],
                content : '<div id="InvoiceDetail"></div>'
              });
             var data={};
	     var settings = {
	        "async" : false,
	        "crossDomain" : true,
	        "url" : "/url/query-id" ,
	        "method" : "POST",
	        "data" : {"id":id}
	    }
	    $.ajax(settings).done(function(response) {
	    	data=response;
	    });
          var gettpl = document.getElementById('demo').innerHTML;
              laytpl(gettpl).render(data, function(html){
              $('#InvoiceDetail').html(html); 
              });
          $('#baseMsg').attr("action", "/url/mapping-update");
          $('.ui-autocomplete').css("z-index","999999999");

}
  function addMsg(userId,id){
    var userId = userId;
          layer.open({
                type : 1,
                title : "添加数据",
                skin : 'layui-layer-rim',
                area : [ '650px', '500px' ],
                content : '<div id="InvoiceDetail"></div>'
              });
          var gettpl = document.getElementById('demo').innerHTML;
          var data = {"path":'',"view":'',"comment":'',"user":''};
              laytpl(gettpl).render(data, function(html){
              $('#InvoiceDetail').html(html); 
              $('#userId').val(userId);
              });
          $('#baseMsg').attr("action", "/url/mapping-save");
          $('.ui-autocomplete').css("z-index","999999999");

}

  function saveBase() {
     

  $('#baseMsg').ajaxForm(function(data) {
    if (data.left) {
      document.getElementById('subutton').setAttribute('disabled', true);
      $("#subutton").css("background-color", "#85A2AD");
      layer.msg("保存成功");
        inMsg.draw();
    } else {
      layer.msg("保存失败");
    }
  }).submit();

}

function delURl(id) {
       layer.confirm('确定关闭该条规则吗？', {
          icon : 3
      }, function(index) {
          layer.close(index);
          if (true) {
              
			var settings = {
		        "async" : false,
		        "crossDomain" : true,
		        "url" : "/url/deleteMapping"  ,
		        "method" : "POST",
		        "data" : {"id":id}
		    }
		    $.ajax(settings).done(function(response) {
		    });
              inMsg.draw();
          }
      });
  }

function batchUdateLineById(params, toClassName) {
  //console.log(params);
    var settings = {
        "async" : false,
        "crossDomain" : true,
        "url" : "http://" + changeAddr() + "/common/saveModel?className=" + toClassName + "&checkUniq=Y&type_s=media" ,
        "method" : "POST",
        "data" : params
    }
    $.ajax(settings).done(function(response) {
    });
}



</script>
