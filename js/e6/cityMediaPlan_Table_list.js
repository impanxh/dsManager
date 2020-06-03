import { DTable } from 'DTable';

  //set query tooblar
  var tooblar = "\n <div>\n  \t     <span>\u5BA2\u6237&nbsp;&nbsp;</span>\n\t\t <span><input id=\"d1_s_s\" value=\"\"></span>&nbsp;&nbsp;&nbsp;&nbsp;\n\t    \n\t     <span>\u7701\u4EFD&nbsp;&nbsp;</span>\n\t\t <span><input id=\"d2_s_s\" value=\"\"></span>&nbsp;&nbsp;&nbsp;&nbsp;\n\t    \n\t     <span>\u53BF\uFF08\u5E02\uFF09&nbsp;&nbsp;</span>\n\t\t <span><input id=\"d3_s_s\" value=\"\"></span>&nbsp;&nbsp;&nbsp;&nbsp;\n\t    \n\t     <span>\u5408\u540C\u6027\u8D28&nbsp;&nbsp;</span>\n\t\t <span><input id=\"d4_s_s\" value=\"\"></span>&nbsp;&nbsp;&nbsp;&nbsp;\n\t    \n  \t<br><br>\n\t     <span>\u8054\u7CFB\u4EBA&nbsp;&nbsp;</span>\n\t\t <span><input id=\"d5_s_s\" value=\"\"></span>&nbsp;&nbsp;&nbsp;&nbsp;\n\t    \n\t     <span>\u516C\u53F8\u540D\u79F0&nbsp;&nbsp;</span>\n\t\t <span><input id=\"d6_s_s\" value=\"\"></span>&nbsp;&nbsp;&nbsp;&nbsp;\n\t    \n\t     <span>\u94F6\u884C&nbsp;&nbsp;</span>\n\t\t <span><input id=\"d7_s_s\" value=\"\"></span>&nbsp;&nbsp;&nbsp;&nbsp;\n\t    \n\t     <span>\u5F55\u5165\u4EBA&nbsp;&nbsp;</span>\n\t\t <span><input id=\"d20_s_s\" value=\"\"></span>&nbsp;&nbsp;&nbsp;&nbsp;\n\t    \n  \t\t<span>\u662F\u5426\u5220\u9664&nbsp;&nbsp;</span>\n\t\t <select class=\"ui-input ui-input-mini\" id=\"isdelete_i_i\" style=\"width:135px\">\n\t\t <option value=\"\" >\u6240\u6709</option>\n\t\t <option value=\"0\" selected=\"selected\">\u5426</option>   \n\t\t <option value=\"1\">\u662F</option>\n\t\t </select>&nbsp;&nbsp;&nbsp;&nbsp;\n\t\t \n </div>";
  /**
  let line_emun = {
     "1":"媒介发起", 
  "2":"总监确认",
  "3":"媒介发放",
  "50":"流程结束"
     };*/
  var fromValue = $("#fromValue").val();
  var coluns = [{
    "data": "id",
    "render": function render(data, type, row, meta) {
      var f = $('#fromValue').val();
      f = f == 'list' ? '查看' : '处理';
      var c = "&nbsp;<a class=\"table-link\" target=\"_blank\" onclick=\"signIn('" + row.id + "','" + row.uniqId_s + "','" + fromValue + "&f=cityMediaPlan_Table','cityMediaPlan_Detail');\"><font color=\"green\"><B>" + f + "</B></font></a>";
      // if(isNotNull(row.task_ss) && row.task_ss[0] == '1'){
      c += "&nbsp;<a class=\"table-link\" target=\"_blank\" onclick=\"signIn('" + row.id + "','" + row.uniqId_s + "','" + fromValue + "&f=cityMediaPlan_Table','cityMediaPlan_edit');\"><font color=\"green\"><B>\u7F16\u8F91</B></font></a>";

      c += "&nbsp;<a class=\"table-link\" target=\"_blank\" onclick=\"delRow('" + row.id + "','table','R1_plan');\"><font color=\"green\"><B>\u5220\u9664</B></font></a>";
      // }
      return c;
    }
  },
  /** { "data": "task_ss","render": (data, type, row, meta) => {
       let f = data[0];
       return line_emun[f];
   } },*/
  { "data": "d1_s" }, { "data": "d2_s" }, { "data": "d3_s" }, { "data": "d4_s" }, { "data": "d5_s" }, { "data": "d6_s" }, { "data": "d7_s" }, { "data": "d8_s" }, { "data": "d9_d" }, { "data": "d10_s" }, { "data": "d11_d" }, { "data": "d12_dt", "format": "yyyy-MM-dd" }, { "data": "d13_d" }, { "data": "d14_dt", "format": "yyyy-MM-dd" }, { "data": "d15_d" }, { "data": "d16_dt", "format": "yyyy-MM-dd" }, { "data": "d17_d" }, { "data": "d18_dt", "format": "yyyy-MM-dd" }, { "data": "d19_s" }, { "data": "d20_s" }];

  var ajaxCallback = function ajaxCallback(json) {
    return json.content;
  };

  var ta = new _DTable.DTable("table").withiDisplayLength(30).withSort([[2, "desc"]], [0]).preDrawCallback(tooblar, function () {//set tooblar and run fuction

  }).preAjaxReduce(ajaxCallback).withAjax("R1_plan", function () {
    //filter
    var st = $('#st').val();
    return {
      "filter[task_ss_ss]": st == 'Y' ? 50 : '',
      "filter[task_ss_ss_NEQ]": st == 'N' ? 50 : '',
      "filter[isdelete_i_i_EQ]": $('#isdelete_i_i').val(),

      "filter[d1_s_s]": $('#d1_s_s').val(),
      "filter[d2_s_s]": $('#d2_s_s').val(),
      "filter[d3_s_s]": $('#d3_s_s').val(),
      "filter[d4_s_s]": $('#d4_s_s').val(),
      "filter[d5_s_s]": $('#d5_s_s').val(),
      "filter[d6_s_s]": $('#d6_s_s').val(),
      "filter[d7_s_s]": $('#d7_s_s').val(),
      "filter[d20_s_s]": $('#d20_s_s').val()

    };
  }).withColumns(coluns).withExcelExport(true).withCountTd(false).withEnableSort(true); // is excelport

  ta.withInitComplete(function () {
    //set initcomplete
    $('#d1_s_s').change(function () {
      ta.fndraw();
    });
    $('#d2_s_s').change(function () {
      ta.fndraw();
    });
    $('#d3_s_s').change(function () {
      ta.fndraw();
    });
    $('#d4_s_s').change(function () {
      ta.fndraw();
    });
    $('#d5_s_s').change(function () {
      ta.fndraw();
    });
    $('#d6_s_s').change(function () {
      ta.fndraw();
    });
    $('#d7_s_s').change(function () {
      ta.fndraw();
    });
    $('#d20_s_s').change(function () {
      ta.fndraw();
    });
    $('#isdelete_i_i').change(function () {
      ta.fndraw();
    });
  }).draw();

  // this file is generator by tools

  //default sort 2 ,notsort-field 1,6
