import { DTable } from 'DTable';
//set query tooblar
let tooblar = `
<div>
        <span>省份&nbsp;&nbsp;</span>
    <span><input id="b2_s_s" value=""></span>&nbsp;&nbsp;&nbsp;&nbsp;
     
      <span>地区&nbsp;&nbsp;</span>
    <span><input id="b3_s_s" value=""></span>&nbsp;&nbsp;&nbsp;&nbsp;
     
      <span>人口(万人)&nbsp;&nbsp;</span>
    <span><input id="b4_s_s" value=""></span>&nbsp;&nbsp;&nbsp;&nbsp;
     
      <span>GDP（百万元）&nbsp;&nbsp;</span>
    <span><input id="b5_s_s" value=""></span>&nbsp;&nbsp;&nbsp;&nbsp;
     
   <br><br>
      <span>发布形式&nbsp;&nbsp;</span>
    




    <select data-is="isAmount isEnough" class="validate[required]"   id="b6_s_s" autocomplete="off" disableautocomplete="" style="width: 130px; height: 35px;">
    <option value="">全部</option>
								<option value="双层全包">双层全包</option>
								<option value="双层三侧">双层三侧</option>
								<option value="双层两侧">双层两侧</option>
								<option value="单层全包">单层全包</option>
								<option value="单层半全包">单层半全包</option>
								<option value="单层三侧">单层三侧</option>
								<option value="单层两侧">单层两侧</option>
							</select>
     
   
     
      <span>车型&nbsp;&nbsp;</span>
    

    <select data-is="isAmount isEnough" class="validate[required]" name="b9_s_s" id="b9_s_s" autocomplete="off" disableautocomplete="" style="width: 120px; height: 35px;">
    <option value="">全部</option>
    <option value="双层巴士">双层巴士</option>
    <option value="单层巴士">单层巴士</option>
    <option value="单层中巴">单层中巴</option>
    <option value="单层小巴">单层小巴</option>
    </select>
    <span>最小投放周期&nbsp;&nbsp;</span>
    

    <select data-is="isAmount isEnough" class="validate[required]" name="b11_s_s" id="b11_s_s" autocomplete="off" disableautocomplete="" style="width: 120px; height: 35px;">
    <option value="">全部</option>
    <option value="1个月">1个月</option>
    <option value="3个月">3个月</option>
    <option value="9个月">9个月</option>
    <option value="12个月">12个月</option>
  
  </select>

  <span>线路级别&nbsp;&nbsp;</span>
  <span><input id="b7_s_s" value=""></span>&nbsp;&nbsp;&nbsp;&nbsp;
   
    <span>线路&nbsp;&nbsp;</span>
  <span><input id="b8_s_s" value=""></span>&nbsp;&nbsp;&nbsp;&nbsp;


     
   <br><br>
      <span>车长（米）&nbsp;&nbsp;</span>
    <span><input id="b10_s_s" value=""></span>&nbsp;&nbsp;&nbsp;&nbsp;
     
     
     
     <span>是否删除&nbsp;&nbsp;</span>
    <select class="ui-input ui-input-mini" id="isdelete_i_i" style="width:135px">
    <option value=""  >所有</option>
    <option value="0" selected="selected" >否</option>   
    <option value="1">是</option>
    </select>&nbsp;&nbsp;&nbsp;&nbsp;
    
</div>`
/**
let line_emun = {
   "1":"媒介发起", 
"2":"总监确认",
"3":"媒介发放",
"50":"流程结束"
   };*/
var fromValue = $("#fromValue").val();
let coluns = [{
        "data": "id",
        "render": (data, type, row, meta) => {
            let f = $('#fromValue').val();
            f = f == 'list' ? '查看' : '处理';
           let c =  `&nbsp;<a class="table-link" target="_blank" onclick="signIn('${row.id}','${row.uniqId_s}','${fromValue}&f=cityMediaPrice_Table','cityMediaPrice_Detail');"><font color="green"><B>${f}</B></font></a>`;
          // if(isNotNull(row.task_ss) && row.task_ss[0] == '1'){
               c+= `&nbsp;<a class="table-link" target="_blank" onclick="signIn('${row.id}','${row.uniqId_s}','${fromValue}&f=cityMediaPrice_Table','cityMediaPrice_edit');"><font color="green"><B>编辑</B></font></a>`;

               c+= `&nbsp;<a class="table-link" target="_blank" onclick="delRow('${row.id}','table','R1_price');"><font color="green"><B>删除</B></font></a>`;
          // }
           return c;
        }
    },
  /** { "data": "task_ss","render": (data, type, row, meta) => {
       let f = data[0];
       return line_emun[f];
   } },*/
        { "data": "b2_s", },
        { "data": "b3_s", },
        { "data": "b4_s", },
        { "data": "b5_s", },
        { "data": "b6_s", },
        { "data": "b7_s", },
        { "data": "b8_s", },
        { "data": "b9_s", },
        { "data": "b10_s", },
        { "data": "b11_s", },
        { "data": "b12_s", },
        { "data": "b13_s", },
        { "data": "b14_s", },
        { "data": "b15_s", },
        { "data": "b16_s", },
        { "data": "b17_s", },
        { "data": "b18_s", },
        { "data": "b19_s", },
        { "data": "b20_s", },
        { "data": "b21_s", },
        { "data": "b22_s", },
        { "data": "b23_s", },
        { "data": "b24_s", },
        { "data": "b25_s", },
        { "data": "b26_s", },
        { "data": "b27_s", },
        { "data": "b28_s", },
        { "data": "b29_dt", "format": "yyyy-MM-dd" },
];

let ajaxCallback = (json) => {
    return json.content;
};

let ta = new DTable("table").withiDisplayLength(30).withSort(
    [
        [2, "desc"]
    ], [0]).
preDrawCallback(tooblar, () => { //set tooblar and run fuction

    }).preAjaxReduce(ajaxCallback).withAjax("R1_price", () => { //filter
        var st = $('#st').val();
        return {
            "filter[task_ss_ss]": (st == 'Y' ? 50 : ''),
            "filter[task_ss_ss_NEQ]": (st == 'N' ? 50 : ''),
            "filter[isdelete_i_i_EQ]":  $('#isdelete_i_i').val(),
            
           
           "filter[b2_s_s]": $('#b2_s_s').val(),
           "filter[b3_s_s]": $('#b3_s_s').val(),
           "filter[b4_s_s]": $('#b4_s_s').val(),
           "filter[b5_s_s]": $('#b5_s_s').val(),
           "filter[b6_s_s]": $('#b6_s_s').val(),
           "filter[b7_s_s]": $('#b7_s_s').val(),
           "filter[b8_s_s]": $('#b8_s_s').val(),
           "filter[b9_s_s]": $('#b9_s_s').val(),
           "filter[b10_s_s]": $('#b10_s_s').val(),
           "filter[b11_s_s]": $('#b11_s_s').val(),
     
     
        }
    }).withColumns(coluns).withExcelExport(true).withCountTd(false).withEnableSort(true) // is excelport

ta.withInitComplete(() => { //set initcomplete
            $('#b2_s_s').change(() => { ta.fndraw();});
            $('#b3_s_s').change(() => { ta.fndraw();});
            $('#b4_s_s').change(() => { ta.fndraw();});
            $('#b5_s_s').change(() => { ta.fndraw();});
            $('#b6_s_s').change(() => { ta.fndraw();});
            $('#b7_s_s').change(() => { ta.fndraw();});
            $('#b8_s_s').change(() => { ta.fndraw();});
            $('#b9_s_s').change(() => { ta.fndraw();});
            $('#b10_s_s').change(() => { ta.fndraw();});
            $('#b11_s_s').change(() => { ta.fndraw();});
   $('#isdelete_i_i').change(() => { ta.fndraw();});
}).draw();

// this file is generator by tools

//default sort 2 ,notsort-field 1,6