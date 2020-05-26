<#import "../template/template.ftl" as frame> <#global menu="责任清单">
<@frame.html title="责任清单"
js=["js/layer-v1.9.3/layer/layer.js","js/layer.onload.js"]
css=["js/jquery-ui/jquery-ui.css","css/jquery-ui-1.8.16.custom.css""css/sift.css","js/jquery-ui/jquery-ui.auto.complete.css","css/uploadprogess.css","css/liselect/pkg-generator.css$ver=1431443489.css"]>

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
<script type="text/javascript" language="javascript"
    src="${rc.contextPath}/js/laytpl.js"></script>
<script type="text/javascript" language="javascript"
    src="${rc.contextPath}/js/SQ.js"></script>

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

#Inspection {
    padding: 50px;
}
#content {
    width: 77% !important;
}
</style>

<script type="text/javascript">
    var inMsg;
    function initTable () {
        inMsg = $('#table').dataTable( {
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
							"iDisplayLength" : 20,
            "aLengthMenu": [[20, 100,500], [20,100,500]],
            "aaSorting": [[1, "asc"]],
            "columnDefs": [
                {
                    "orderable": false, "targets": [0,3]
                },
            ],
            "ajax": {
                type: "post",
                url: 'http://'+changeAddr()+'/common/getModelList?filter[className]=InspectionBank',
                data: function(d) {
                 return $.extend( {}, d, {
                        "filter[template_s_s]" : $('#template').val(),
                        "filter[content_s_s]" : $('#contents').val()
                    } );
                },
               "dataSrc": function (json) { 
                    json.recordsTotal=json.totalElements;
                    json.recordsFiltered=json.totalElements;
                    return json.content;
                } 
            },
            "columns": [
                { "data": "s_Map.content_s", "defaultContent": ""},
                { "data": "s_Map.dept_s", "defaultContent": ""},
                { "data": "s_Map.template_s", "defaultContent": "",
                "render": function(data, type, row, meta) {
                   if(data=="02"){  
                        return "制水"  ;  
                   }
                   else if(data=="03"){
                        return "木制品"  ;
                   }
                   else if(data=="04"){
                        return "危化品"  ;  
                   }
                   else if(data=="05"){
                        return "旅馆（民宿）"  ;
                   }
                   else if(data=="06"){
                        return "寄递业"  ;
                   }
                   else if(data=="07"){
                        return "矿山"  ;
                   }
                   else if(data=="08"){
                        return "医院"  ;
                   }
                   else if(data=="09"){
                        return "学校"  ;
                   }
                   else if(data=="10"){
                        return "散装汽油"  ;
                   }
                   else if(data=="11"){
                        return "大型商场超市"  ;
                   }
                   else if(data=="12"){
                        return "饭店、小餐饮"  ;
                   }
                   else if(data=="13"){
                        return "养老院"  ;
                   }
                   else if(data=="14"){
                        return "客运站"  ;
                   }
                   else if(data=="15"){
                        return "瓶装燃气"  ;
                   }
                   else if(data=="16"){
                        return "歌厅"  ;
                   }
                   else if(data=="17"){
                        return "放射源"  ;
                   }
                   else if(data=="18"){
                        return "印染企业"  ;
                   }
                   else if(data=="19"){
                        return "网吧"  ;
                   }
                   else if(data=="20"){
                        return "洗浴足浴"  ;
                   }
                   else if(data=="21"){
                        return "银行"  ;
                   }
                   else{
                        return data;
                   }
                }
                },

                { "data": "id","defaultContent": "",
                "render": function(data, type, row, meta) {
                    var operations='';
                    operations+='&nbsp;<a class="table-link" target="_blank" onclick="addMsg(\''+data+'\');"><font color="green"><B>编辑</B></font></a>';
                   
                    operations+= '&nbsp;&nbsp;<a class="table-action operation" href="javascript:void(0);" onclick="deleteInvoice(\''+data+'\',\'InspectionBank\'  )"><font color="green"><B>删除</B></font></a>';
                      return operations;
              }},
            ],
            "language": {
                "url": "${rc.contextPath}/js/jquery.dataTables.lang.cn.json"
            },
            "initComplete": initComplete,
            "drawCallback": drawCallback,
        } );
        inMsg.fnNameOrdering("orderBy").fnNoColumnsParams();
    }

    function initComplete() {
        
		$("div#toolbar").html(
                '<div>' +
                        '    <span>行业类型&nbsp;</span>' +
                        '<select class="ui-input ui-input-mini"  id="template" style="width:135px">' +
                                '<option value=""  selected="selected">所有</option>'+
                                '<option value="02">制水</option>'+
                                '<option value="03">木制品</option>'+
                                '<option value="04">危化品</option>'+ 
                                  '<option value="05">旅馆（民宿）</option>'+
                                  '<option value="06">寄递业</option>'+
                                  '<option value="07">矿山</option>'+
                                  '<option value="08">医院</option>'+
                                  '<option value="09">学校</option>'+
                                  '<option value="10">散装汽油</option>'+
                                  '<option value="11">大型商场超市</option>'+
                                  '<option value="12">饭店、小餐饮</option>'+
                                  '<option value="13">养老院</option>'+
                                  '<option value="14">客运站</option>'+
                                  '<option value="15">瓶装燃气</option>'+
                                  '<option value="16">歌厅</option>'+
                                  '<option value="17">放射源</option>'+
                                  '<option value="18">印染企业</option>'+
                                  '<option value="19">网吧</option>'+
                                  '<option value="20">洗浴足浴</option>'+
                                  '<option value="21">银行</option>'+
                        '</select>&nbsp;&nbsp;' +
                        '    <span>防护措施&nbsp;</span>' +
                        '    <span><input id="contents" value=""></span>&nbsp;&nbsp;' +
                        '</div>'
        );
        $('#template,#contents').change(function() {
            inMsg.fnDraw();
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
							window.location.href="${rc.contextPath}/user/role_list";
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
                inMsg.fnDraw(true);
            })
        });
    }
    
    $(document).ready(function() {
        initTable();
    } );
</script>
<div class="withdraw-wrap color-white-bg fn-clear">
	<div class="withdraw-title">
		${menu!''} <a class="block-btn" onclick="addMsg('');" href="javascript:void(0);">添加信息</a>
	</div>
	<table id="table" class="display" cellspacing="0" width="100%">
		<thead>
			<tr>
				<th id="content" style="width: 77% !important;">防护措施</th> 
				<th orderBy="dept_s_s">监管部门</th>
				<th orderBy="template_s_s">行业类型</th>
				<th>操作</th>
			</tr>
		</thead>

	</table>
</div>
</@frame.html>
<script id="demo" type="text/html">
<form id="baseMsg" method="post">

  <div class="ui-form-item"> 
    <label class="ui-label mt10"> <span class="ui-form-required">* </span>防护措施 </label>
    <textarea rows="4" cols="40" style="resize: none;" id="content_s" name="content_s">
        {{ typeof(d.s_Map)!='undefined'?  d.s_Map.content_s:''}}
    </textarea> 
  </div>

  <div class="ui-form-item"> 
    <label class="ui-label mt10"><span class="ui-form-required">* </span>责任部门</label>
    <input class="ui-input" type="text" name="dept_s" id="dept_s" value="{{ typeof(d.s_Map)!='undefined'?  d.s_Map.dept_s:''}}"  data-is="isAmount isEnough" autocomplete="off" disableautocomplete=""> 
  </div>

  <div class="ui-form-item"> <label class="ui-label mt10"><span class="ui-form-required">* </span>类型</label>
    <select class="ui-input ui-input-mini" name="template_s" id="template_s">
    {{# if(typeof(d.s_Map)!='undefined') { }}
      <option selected="selected" value="{{d.s_Map.template_s}}">{{d.s_Map.template_s}}</option>
   {{#  } }}

      <option value="02">制水</option>
      <option value="03">木制品</option>
      <option value="04">危化品</option>
      <option value="05">旅馆（民宿）</option>
      <option value="06">寄递业</option>
      <option value="07">矿山</option>
      <option value="08">医院</option>
      <option value="09">学校</option>
      <option value="10">散装汽油</option>
      <option value="11">大型商场超市</option>
      <option value="12">饭店、小餐饮</option>
      <option value="13">养老院</option>
      <option value="14">客运站</option>
      <option value="15">瓶装燃气</option>
      <option value="16">歌厅</option>
      <option value="17">放射源</option>
      <option value="18">印染企业</option>
      <option value="19">网吧</option>
      <option value="20">洗浴足浴</option>
      <option value="21">银行</option>
  
 
    </select>
  </div>

 <input type="hidden" name="className" value="InspectionBank"/>
  {{# if(typeof(d.id)=='undefined') { }}
  <input type="hidden" name="checkUniq" value="N"/>
  {{# } else { }}
  <input type="hidden" name="id" id="_id"  value="{{d.id}}"/>
  <input type="hidden" name="selectByField" value="id"/>
  {{#  } }}
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
  function addMsg(id){
          layer.open({
                type : 1,
                title : "添加数据",
                skin : 'layui-layer-rim',
                area : [ '650px', '500px' ],
                content : '<div id="Inspection"></div>'
              });
          var gettpl = document.getElementById('demo').innerHTML;
          var InvData ={};
          if(id!=""){
            InvData = selectInsByid(id);
          }

          laytpl(gettpl).render(InvData, function(html){
              $('#Inspection').html(html); 
              });
          $('#baseMsg').attr("action", "http://"+changeAddr()+"/common/saveModel");
          $('.ui-autocomplete').css("z-index","999999999");

}
  function selectInsByid(id){
    var InvData ={};
    InvData.d_Map = {};
    InvData.s_Map = {};
    InvData.dt_Map = {};
    $.ajax({
            url : 'http://' + changeAddr() + '/common/queryById?className=InspectionBank&id='+ id,
            type : "GET",
            data : {},
            async : false,
            dataType : "json",
            success : function(data) {
              InvData= data;
            }
    });

    $.ajax({
            url : 'http://' + changeAddr() + '/common/getModelList?filter[className]=industry',
            type : "GET",
            data : {},
            async : false,
            dataType : "json",
            success : function(data) {
              InvData += data;
            }
    });

    return InvData;
  }
  function saveBase() {
    if (!$("#baseMsg").validationEngine('validateBeforeSubmit'))
            return;
  $('#baseMsg').ajaxForm(function(data) {
    if (data.status == 200) {
      document.getElementById('subutton').setAttribute('disabled', true);
      $("#subutton").css("background-color", "#85A2AD");
      layer.msg("保存成功");
      var uptime = window.setTimeout(function() {
        window.location = "/inspection_list";
        clearTimeout(uptime);
      }, 2000)
    } else {
      layer.msg("保存失败");
    }
  }).submit();

}


</script>