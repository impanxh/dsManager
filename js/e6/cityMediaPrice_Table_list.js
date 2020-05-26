(function (global, factory) {
  if (typeof define === "function" && define.amd) {
    define(["DTable"], factory);
  } else if (typeof exports !== "undefined") {
    factory(require("DTable"));
  } else {
    var mod = {
      exports: {}
    };
    factory(global.DTable);
    global.cityMediaPrice_Table_list = mod.exports;
  }
})(this, function (_DTable) {
  "use strict";

  //set query tooblar
  var tooblar = "\n <div>\n  \t     <span>\u7701\u4EFD&nbsp;&nbsp;</span>\n\t\t <span><input id=\"b2_s_s\" value=\"\"></span>&nbsp;&nbsp;&nbsp;&nbsp;\n\t    \n\t     <span>\u5730\u533A&nbsp;&nbsp;</span>\n\t\t <span><input id=\"b3_s_s\" value=\"\"></span>&nbsp;&nbsp;&nbsp;&nbsp;\n\t    \n\t     <span>\u4EBA\u53E3(\u4E07\u4EBA)&nbsp;&nbsp;</span>\n\t\t <span><input id=\"b4_s_s\" value=\"\"></span>&nbsp;&nbsp;&nbsp;&nbsp;\n\t    \n\t     <span>GDP\uFF08\u767E\u4E07\u5143\uFF09&nbsp;&nbsp;</span>\n\t\t <span><input id=\"b5_s_s\" value=\"\"></span>&nbsp;&nbsp;&nbsp;&nbsp;\n\t    \n  \t<br><br>\n\t     <span>\u53D1\u5E03\u5F62\u5F0F&nbsp;&nbsp;</span>\n\t\t <span><input id=\"b6_s_s\" value=\"\"></span>&nbsp;&nbsp;&nbsp;&nbsp;\n\t    \n\t     <span>\u7EBF\u8DEF\u7EA7\u522B&nbsp;&nbsp;</span>\n\t\t <span><input id=\"b7_s_s\" value=\"\"></span>&nbsp;&nbsp;&nbsp;&nbsp;\n\t    \n\t     <span>\u7EBF\u8DEF&nbsp;&nbsp;</span>\n\t\t <span><input id=\"b8_s_s\" value=\"\"></span>&nbsp;&nbsp;&nbsp;&nbsp;\n\t    \n\t     <span>\u8F66\u578B&nbsp;&nbsp;</span>\n\t\t <span><input id=\"b9_s_s\" value=\"\"></span>&nbsp;&nbsp;&nbsp;&nbsp;\n\t    \n  \t<br><br>\n\t     <span>\u8F66\u957F\uFF08\u7C73\uFF09&nbsp;&nbsp;</span>\n\t\t <span><input id=\"b10_s_s\" value=\"\"></span>&nbsp;&nbsp;&nbsp;&nbsp;\n\t    \n\t     <span>\u6700\u5C0F\u6295\u653E\u5468\u671F&nbsp;&nbsp;</span>\n\t\t <span><input id=\"b11_s_s\" value=\"\"></span>&nbsp;&nbsp;&nbsp;&nbsp;\n\t    \n  \t\t<span>\u662F\u5426\u5220\u9664&nbsp;&nbsp;</span>\n\t\t <select class=\"ui-input ui-input-mini\" id=\"isdelete_i_i\" style=\"width:135px\">\n\t\t <option value=\"\"  >\u6240\u6709</option>\n\t\t <option value=\"0\" selected=\"selected\" >\u5426</option>   \n\t\t <option value=\"1\">\u662F</option>\n\t\t </select>&nbsp;&nbsp;&nbsp;&nbsp;\n\t\t \n </div>";
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
      var c = "&nbsp;<a class=\"table-link\" target=\"_blank\" onclick=\"signIn('" + row.id + "','" + row.uniqId_s + "','" + fromValue + "&f=cityMediaPrice_Table','cityMediaPrice_Detail');\"><font color=\"green\"><B>" + f + "</B></font></a>";
      // if(isNotNull(row.task_ss) && row.task_ss[0] == '1'){
      c += "&nbsp;<a class=\"table-link\" target=\"_blank\" onclick=\"signIn('" + row.id + "','" + row.uniqId_s + "','" + fromValue + "&f=cityMediaPrice_Table','cityMediaPrice_edit');\"><font color=\"green\"><B>\u7F16\u8F91</B></font></a>";

      c += "&nbsp;<a class=\"table-link\" target=\"_blank\" onclick=\"delRow('" + row.id + "','table','R1_price');\"><font color=\"green\"><B>\u5220\u9664</B></font></a>";
      // }
      return c;
    }
  },
  /** { "data": "task_ss","render": (data, type, row, meta) => {
       let f = data[0];
       return line_emun[f];
   } },*/
  { "data": "b2_s" }, { "data": "b3_s" }, { "data": "b4_s" }, { "data": "b5_s" }, { "data": "b6_s" }, { "data": "b7_s" }, { "data": "b8_s" }, { "data": "b9_s" }, { "data": "b10_s" }, { "data": "b11_s" }, { "data": "b12_s" }, { "data": "b13_s" }, { "data": "b14_s" }, { "data": "b15_s" }, { "data": "b16_s" }, { "data": "b17_s" }, { "data": "b18_s" }, { "data": "b19_s" }, { "data": "b20_s" }, { "data": "b21_s" }, { "data": "b22_s" }, { "data": "b23_s" }, { "data": "b24_s" }, { "data": "b25_s" }, { "data": "b26_s" }, { "data": "b27_s" }, { "data": "b28_s" }, { "data": "b29_dt", "format": "yyyy-MM-dd" }];

  var ajaxCallback = function ajaxCallback(json) {
    return json.content;
  };

  var ta = new _DTable.DTable("table").withiDisplayLength(30).withSort([[2, "desc"]], [0]).preDrawCallback(tooblar, function () {//set tooblar and run fuction

  }).preAjaxReduce(ajaxCallback).withAjax("R1_price", function () {
    //filter
    var st = $('#st').val();
    return {
      "filter[task_ss_ss]": st == 'Y' ? 50 : '',
      "filter[task_ss_ss_NEQ]": st == 'N' ? 50 : '',
      "filter[isdelete_i_i_EQ]": $('#isdelete_i_i').val(),

      "filter[b2_s_s]": $('#b2_s_s').val(),
      "filter[b3_s_s]": $('#b3_s_s').val(),
      "filter[b4_s_s]": $('#b4_s_s').val(),
      "filter[b5_s_s]": $('#b5_s_s').val(),
      "filter[b6_s_s]": $('#b6_s_s').val(),
      "filter[b7_s_s]": $('#b7_s_s').val(),
      "filter[b8_s_s]": $('#b8_s_s').val(),
      "filter[b9_s_s]": $('#b9_s_s').val(),
      "filter[b10_s_s]": $('#b10_s_s').val(),
      "filter[b11_s_s]": $('#b11_s_s').val()

    };
  }).withColumns(coluns).withExcelExport(true).withCountTd(false).withEnableSort(true); // is excelport

  ta.withInitComplete(function () {
    //set initcomplete
    $('#b2_s_s').change(function () {
      ta.fndraw();
    });
    $('#b3_s_s').change(function () {
      ta.fndraw();
    });
    $('#b4_s_s').change(function () {
      ta.fndraw();
    });
    $('#b5_s_s').change(function () {
      ta.fndraw();
    });
    $('#b6_s_s').change(function () {
      ta.fndraw();
    });
    $('#b7_s_s').change(function () {
      ta.fndraw();
    });
    $('#b8_s_s').change(function () {
      ta.fndraw();
    });
    $('#b9_s_s').change(function () {
      ta.fndraw();
    });
    $('#b10_s_s').change(function () {
      ta.fndraw();
    });
    $('#b11_s_s').change(function () {
      ta.fndraw();
    });
    $('#isdelete_i_i').change(function () {
      ta.fndraw();
    });
  }).draw();

  // this file is generator by tools

  //default sort 2 ,notsort-field 1,6
});