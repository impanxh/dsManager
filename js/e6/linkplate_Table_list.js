

  //set query tooblar
  var tooblar = "\n <div>\n  \t     <span>\u6240\u5C5E\u7EBF\u8DEF&nbsp;&nbsp;</span>\n\t\t <span><input id=\"lineName_s_s\" value=\"\"></span>&nbsp;&nbsp;&nbsp;&nbsp;\n\t    \n\t     <span>\u8F66\u53F7&nbsp;&nbsp;</span>\n\t\t <span><input id=\"serianumber_s_s\" value=\"\"></span>&nbsp;&nbsp;&nbsp;&nbsp;\n\t    \n\t     <span>\u724C\u7167\u53F7&nbsp;&nbsp;</span>\n\t\t <span><input id=\"plateNumber_s_s\" value=\"\"></span>&nbsp;&nbsp;&nbsp;&nbsp;\n\t    \n\t     <span>\u4E0A\u520A\u5185\u5BB9&nbsp;&nbsp;</span>\n\t\t <span><input id=\"adcontext_s_s\" value=\"\"></span>&nbsp;&nbsp;&nbsp;&nbsp;\n\t    \n  \t<br><br>\n\t     <span>\u8F66\u578B&nbsp;&nbsp;</span>\n\t\t <span><input id=\"model_s_s\" value=\"\"></span>&nbsp;&nbsp;&nbsp;&nbsp;\n\t    \n\t\t <span>\u6240\u5C5E\u516C\u53F8&nbsp;&nbsp;</span>\n\t\t <select class=\"ui-input ui-input-mini\" id=\"company_s_s\" style=\"width:135px\">\n\t\t <option value=\"\" selected=\"selected\">\u6240\u6709</option>\n\t\t    <option value=\"\u5BA2\u4E00\">\u5BA2\u4E00</option>   \n\t\t    <option value=\"\u5BA2\u4E00\">\u5BA2\u4E00</option>   \n\t\t    <option value=\"\u5BA2\u4E09\">\u5BA2\u4E09</option>   \n\t\t    <option value=\"\u5BA2\u56DB\">\u5BA2\u56DB</option>   \n\t\t    <option value=\"\u5BA2\u4E5D\">\u5BA2\u4E5D</option>   \n\t\t </select>&nbsp;&nbsp;&nbsp;&nbsp;\n\t    \n\t\t <span>\u8F66\u8F86\u6027\u8D28&nbsp;&nbsp;</span>\n\t\t <select class=\"ui-input ui-input-mini\" id=\"type_s_s\" style=\"width:135px\">\n\t\t <option value=\"\" selected=\"selected\">\u6240\u6709</option>\n\t\t    <option value=\"\u5927\u706F\u7247\">\u5927\u706F\u7247</option>   \n\t\t    <option value=\"\u6302\u677F\">\u6302\u677F</option>   \n\t\t    <option value=\"\u6302\u677F\u8D34\">\u6302\u677F\u8D34</option>   \n\t\t    <option value=\"\u5185\u5305\u8F66\">\u5185\u5305\u8F66</option>   \n\t\t    <option value=\"\u672A\u88C5\u677F\">\u672A\u88C5\u677F</option>   \n\t\t </select>&nbsp;&nbsp;&nbsp;&nbsp;\n\t    \n  \t\t<span>\u662F\u5426\u5220\u9664&nbsp;&nbsp;</span>\n\t\t <select class=\"ui-input ui-input-mini\" id=\"isdelete_i_i\" style=\"width:135px\">\n\t\t <option value=\"\" selected=\"selected\">\u6240\u6709</option>\n\t\t <option value=\"0\">\u5426</option>   \n\t\t <option value=\"1\">\u662F</option>\n\t\t </select>&nbsp;&nbsp;&nbsp;&nbsp;\n\t\t \n </div>";
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
      var c = "&nbsp;<a class=\"table-link\" target=\"_blank\" onclick=\"signIn('" + row.id + "','" + row.uniqId_s + "','" + fromValue + "&f=linkplate_Table','linkplate_Detail');\"><font color=\"green\"><B>" + f + "</B></font></a>";
      // if(isNotNull(row.task_ss) && row.task_ss[0] == '1'){
      c += "&nbsp;<a class=\"table-link\" target=\"_blank\" onclick=\"signIn('" + row.id + "','" + row.uniqId_s + "','" + fromValue + "&f=linkplate_Table','linkplate_edit');\"><font color=\"green\"><B>\u7F16\u8F91</B></font></a>";

      c += "&nbsp;<a class=\"table-link\" target=\"_blank\" onclick=\"delRow('" + row.id + "','table','R1_linkplate');\"><font color=\"green\"><B>\u5220\u9664</B></font></a>";
      // }
      return c;
    }
  },
  /** { "data": "task_ss","render": (data, type, row, meta) => {
       let f = data[0];
       return line_emun[f];
   } },*/
  { "data": "lineName_s" }, { "data": "company_s" }, { "data": "serianumber_s" }, { "data": "plateNumber_s" }, { "data": "type_s" }, { "data": "model_s" }, { "data": "number_s" }, { "data": "adcontext_s" }, { "data": "start_dt", "format": "yyyy-MM-dd" }, { "data": "end_dt", "format": "yyyy-MM-dd" }, { "data": "comment_s" }];

  var ajaxCallback = function ajaxCallback(json) {
    return json.content;
  };

  var ta = new _DTable.DTable("table").withiDisplayLength(30).withSort([[2, "desc"]], [0]).preDrawCallback(tooblar, function () {//set tooblar and run fuction

  }).preAjaxReduce(ajaxCallback).withAjax("R1_linkplate", function () {
    //filter
    var st = $('#st').val();
    return {
      "filter[task_ss_ss]": st == 'Y' ? 50 : '',
      "filter[task_ss_ss_NEQ]": st == 'N' ? 50 : '',
      "filter[isdelete_i_i_EQ]": $('#isdelete_i_i').val(),

      "filter[lineName_s_s]": $('#lineName_s_s').val(),
      "filter[serianumber_s_s]": $('#serianumber_s_s').val(),
      "filter[plateNumber_s_s]": $('#plateNumber_s_s').val(),
      "filter[adcontext_s_s]": $('#adcontext_s_s').val(),
      "filter[model_s_s]": $('#model_s_s').val(),
      "filter[company_s_s]": $('#company_s_s').val(),
      "filter[type_s_s]": $('#type_s_s').val()

    };
  }).withColumns(coluns).withExcelExport(true).withCountTd(false).withEnableSort(true); // is excelport

  ta.withInitComplete(function () {
    //set initcomplete
    $('#lineName_s_s').change(function () {
      ta.fndraw();
    });
    $('#serianumber_s_s').change(function () {
      ta.fndraw();
    });
    $('#plateNumber_s_s').change(function () {
      ta.fndraw();
    });
    $('#adcontext_s_s').change(function () {
      ta.fndraw();
    });
    $('#model_s_s').change(function () {
      ta.fndraw();
    });
    $('#company_s_s').change(function () {
      ta.fndraw();
    });
    $('#type_s_s').change(function () {
      ta.fndraw();
    });
    $('#isdelete_i_i').change(function () {
      ta.fndraw();
    });
  }).draw();

  // this file is generator by tools

  //default sort 2 ,notsort-field 1,6
