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
		global.cityMediaContract_Table_list = mod.exports;
	}
})(this, function (_DTable) {
	"use strict";

	//set query tooblar
	var tooblar = "\n <div>\n  \t     <span>\u5BA2\u6237&nbsp;&nbsp;</span>\n\t\t <span><input id=\"c1_s\" value=\"\"></span>&nbsp;&nbsp;&nbsp;&nbsp;\n\t    \n\t     <span>\u7701&nbsp;&nbsp;</span>\n\t\t <span><input id=\"c2_s\" value=\"\"></span>&nbsp;&nbsp;&nbsp;&nbsp;\n\t    \n\t     <span>\u57CE\u5E02\u3010\u5E02\u3001\u53BF\u3011&nbsp;&nbsp;</span>\n\t\t <span><input id=\"c3_s\" value=\"\"></span>&nbsp;&nbsp;&nbsp;&nbsp;\n\t    \n\t     <span>\u5408\u540C\u6027\u8D28&nbsp;&nbsp;</span>\n\t\t <span><input id=\"c4_s\" value=\"\"></span>&nbsp;&nbsp;&nbsp;&nbsp;\n\t    \n  \t<br><br>\n\t     <span>\u5408\u540C&nbsp;&nbsp;</span>\n\t\t <span><input id=\"c11_s\" value=\"\"></span>&nbsp;&nbsp;&nbsp;&nbsp;\n\t    \n\t     <span>\u516C\u53F8\u540D\u79F0&nbsp;&nbsp;</span>\n\t\t <span><input id=\"c5_s\" value=\"\"></span>&nbsp;&nbsp;&nbsp;&nbsp;\n\t    \n\t     <span>\u6536\u4EF6\u5730\u5740&nbsp;&nbsp;</span>\n\t\t <span><input id=\"c6_s\" value=\"\"></span>&nbsp;&nbsp;&nbsp;&nbsp;\n\t    \n\t     <span>\u8054\u7CFB\u4EBA&nbsp;&nbsp;</span>\n\t\t <span><input id=\"c7_s\" value=\"\"></span>&nbsp;&nbsp;&nbsp;&nbsp;\n\t    \n  \t<br><br>\n\t     <span>\u7535\u8BDD&nbsp;&nbsp;</span>\n\t\t <span><input id=\"c8_s\" value=\"\"></span>&nbsp;&nbsp;&nbsp;&nbsp;\n\t    \n\t     <span>\u624B\u673A&nbsp;&nbsp;</span>\n\t\t <span><input id=\"c9_s\" value=\"\"></span>&nbsp;&nbsp;&nbsp;&nbsp;\n\t    \n\t     <span>\u8F66\u724C/\u8DEF\u7EBF&nbsp;&nbsp;</span>\n\t\t <span><input id=\"c35_s\" value=\"\"></span>&nbsp;&nbsp;&nbsp;&nbsp;\n\t    \n\t     <span>\u5907\u6CE8&nbsp;&nbsp;</span>\n\t\t <span><input id=\"c36_s\" value=\"\"></span>&nbsp;&nbsp;&nbsp;&nbsp;\n\t    \n  \t<br><br>\n\t     <span>\u5F55\u5165\u4EBA&nbsp;&nbsp;</span>\n\t\t <span><input id=\"c37_s\" value=\"\"></span>&nbsp;&nbsp;&nbsp;&nbsp;\n\t    \n  \t\t<span>\u662F\u5426\u5220\u9664&nbsp;&nbsp;</span>\n\t\t <select class=\"ui-input ui-input-mini\" id=\"isdelete_i_i\" style=\"width:135px\">\n\t\t <option value=\"\" >\u6240\u6709</option>\n\t\t <option value=\"0\" selected=\"selected\">\u5426</option>   \n\t\t <option value=\"1\">\u662F</option>\n\t\t </select>&nbsp;&nbsp;&nbsp;&nbsp;\n\t\t \n </div>";
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
			var c = "&nbsp;<a class=\"table-link\" target=\"_blank\" onclick=\"signIn('" + row.id + "','" + row.uniqId_s + "','" + fromValue + "&f=cityMediaContract_Table','cityMediaContract_Detail');\"><font color=\"green\"><B>" + f + "</B></font></a>";
			// if(isNotNull(row.task_ss) && row.task_ss[0] == '1'){
			c += "&nbsp;<a class=\"table-link\" target=\"_blank\" onclick=\"signIn('" + row.id + "','" + row.uniqId_s + "','" + fromValue + "&f=cityMediaContract_Table','cityMediaContract_edit');\"><font color=\"green\"><B>\u7F16\u8F91</B></font></a>";

			c += "&nbsp;<a class=\"table-link\" target=\"_blank\" onclick=\"delRow('" + row.id + "','table','R1_contract');\"><font color=\"green\"><B>\u5220\u9664</B></font></a>";
			// }
			return c;
		}
	},
	/** { "data": "task_ss","render": (data, type, row, meta) => {
      let f = data[0];
      return line_emun[f];
  } },*/
	{ "data": "c1_s" }, { "data": "c2_s" }, { "data": "c3_s" }, { "data": "c4_s" }, { "data": "c5_s" }, { "data": "c6_s" }, { "data": "c7_s" }, { "data": "c8_s" }, { "data": "c9_s" }, { "data": "c10_dt", "format": "yyyy-MM-dd" }, { "data": "c11_s" }, { "data": "c12_s" }, { "data": "营业执照" }, { "data": "c14_s" }, { "data": "c15_s" }, { "data": "c16_s" }, { "data": "c17_s" }, { "data": "c18_dt", "format": "yyyy-MM-dd" }, { "data": "c19_s" }, { "data": "c20_d" }, { "data": "c21_d" }, { "data": "c22_s" }, { "data": "c23_d" }, { "data": "c24_s" }, { "data": "c25_s" }, { "data": "c26_d" }, { "data": "c27_s" }, { "data": "c28_s" }, { "data": "c29_d" }, { "data": "c30_s" }, { "data": "c31_d" }, { "data": "c32_d" }, { "data": "c33_s" }, { "data": "c34_s" }, { "data": "c35_s" }, { "data": "c36_s" }, { "data": "c37_s" }, { "data": "c38_s" }];

	var ajaxCallback = function ajaxCallback(json) {
		return json.content;
	};

	var ta = new _DTable.DTable("table").withiDisplayLength(30).withSort([[2, "desc"]], [0]).preDrawCallback(tooblar, function () {//set tooblar and run fuction

	}).preAjaxReduce(ajaxCallback).withAjax("R1_contract", function () {
		//filter
		var st = $('#st').val();
		return {
			"filter[task_ss_ss]": st == 'Y' ? 50 : '',
			"filter[task_ss_ss_NEQ]": st == 'N' ? 50 : '',
			"filter[isdelete_i_i_EQ]": $('#isdelete_i_i').val(),

			"filter[c1_s]": $('#c1_s').val(),
			"filter[c2_s]": $('#c2_s').val(),
			"filter[c3_s]": $('#c3_s').val(),
			"filter[c4_s]": $('#c4_s').val(),
			"filter[c11_s]": $('#c11_s').val(),
			"filter[c5_s]": $('#c5_s').val(),
			"filter[c6_s]": $('#c6_s').val(),
			"filter[c7_s]": $('#c7_s').val(),
			"filter[c8_s]": $('#c8_s').val(),
			"filter[c9_s]": $('#c9_s').val(),
			"filter[c35_s]": $('#c35_s').val(),
			"filter[c36_s]": $('#c36_s').val(),
			"filter[c37_s]": $('#c37_s').val()

		};
	}).withColumns(coluns).withExcelExport(true).withCountTd(false).withEnableSort(true); // is excelport

	ta.withInitComplete(function () {
		//set initcomplete
		$('#c1_s').change(function () {
			ta.fndraw();
		});
		$('#c2_s').change(function () {
			ta.fndraw();
		});
		$('#c3_s').change(function () {
			ta.fndraw();
		});
		$('#c4_s').change(function () {
			ta.fndraw();
		});
		$('#c11_s').change(function () {
			ta.fndraw();
		});
		$('#c5_s').change(function () {
			ta.fndraw();
		});
		$('#c6_s').change(function () {
			ta.fndraw();
		});
		$('#c7_s').change(function () {
			ta.fndraw();
		});
		$('#c8_s').change(function () {
			ta.fndraw();
		});
		$('#c9_s').change(function () {
			ta.fndraw();
		});
		$('#c35_s').change(function () {
			ta.fndraw();
		});
		$('#c36_s').change(function () {
			ta.fndraw();
		});
		$('#c37_s').change(function () {
			ta.fndraw();
		});
		$('#isdelete_i_i').change(function () {
			ta.fndraw();
		});
	}).draw();

	// this file is generator by tools

	//default sort 2 ,notsort-field 1,6
});