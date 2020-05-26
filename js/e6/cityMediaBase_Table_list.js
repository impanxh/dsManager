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
		global.cityMediaBase_Table_list = mod.exports;
	}
})(this, function (_DTable) {
	"use strict";

	//set query tooblar
	var tooblar = "\n <div>\n  \t     <span>\u5730\u533A&nbsp;&nbsp;</span>\n\t\t <span><input id=\"a2_s_s\" value=\"\"></span>&nbsp;&nbsp;&nbsp;&nbsp;\n\t    \n\t     <span>\u53BF\uFF08\u5E02\uFF09&nbsp;&nbsp;</span>\n\t\t <span><input id=\"a3_s_s\" value=\"\"></span>&nbsp;&nbsp;&nbsp;&nbsp;\n\t    \n\t     <span>GDP(\u767E\u4E07\u5143) &nbsp;&nbsp;</span>\n\t\t <span><input id=\"a4_s_s\" value=\"\"></span>&nbsp;&nbsp;&nbsp;&nbsp;\n\t    \n\t     <span>\u53BF\u57DF\u4EBA\u53E3\uFF08\u4E07\u4EBA\uFF09&nbsp;&nbsp;</span>\n\t\t <span><input id=\"a5_i_i\" value=\"\"></span>&nbsp;&nbsp;&nbsp;&nbsp;\n\t    \n  \t<br><br>\n\t     <span>\u8986\u76D6\u4E61\u9547&nbsp;&nbsp;</span>\n\t\t <span><input id=\"a6_s_s\" value=\"\"></span>&nbsp;&nbsp;&nbsp;&nbsp;\n\t    \n\t     <span>\u8FD0\u7BA1\u6240 \u7535\u8BDD&nbsp;&nbsp;</span>\n\t\t <span><input id=\"a7_s_s\" value=\"\"></span>&nbsp;&nbsp;&nbsp;&nbsp;\n\t    \n\t     <span>\u662F\u5426\u6709\u5408\u4F5C&nbsp;&nbsp;</span>\n\t\t <span><input id=\"a8_s_s\" value=\"\"></span>&nbsp;&nbsp;&nbsp;&nbsp;\n\t    \n\t     <span>\u8054\u7CFB\u60C5\u51B5&nbsp;&nbsp;</span>\n\t\t <span><input id=\"a9_s_s\" value=\"\"></span>&nbsp;&nbsp;&nbsp;&nbsp;\n\t    \n  \t<br><br>\n\t     <span>\u5A92\u4F53\u7C7B\u578B&nbsp;&nbsp;</span>\n\t\t <span><input id=\"a10_s_s\" value=\"\"></span>&nbsp;&nbsp;&nbsp;&nbsp;\n\t    \n\t     <span>\u516C\u4EA4\u516C\u53F8&nbsp;&nbsp;</span>\n\t\t <span><input id=\"a11_s_s\" value=\"\"></span>&nbsp;&nbsp;&nbsp;&nbsp;\n\t    \n\t     <span>\u8054\u7CFB\u4EBA&nbsp;&nbsp;</span>\n\t\t <span><input id=\"a12_s_s\" value=\"\"></span>&nbsp;&nbsp;&nbsp;&nbsp;\n\t    \n\t     <span>\u804C\u4F4D&nbsp;&nbsp;</span>\n\t\t <span><input id=\"a13_s_s\" value=\"\"></span>&nbsp;&nbsp;&nbsp;&nbsp;\n\t    \n  \t<br><br>\n\t     <span>\u7535\u8BDD&nbsp;&nbsp;</span>\n\t\t <span><input id=\"a14_s_s\" value=\"\"></span>&nbsp;&nbsp;&nbsp;&nbsp;\n\t    \n\t     <span>\u624B\u673A\uFF0F\u5C0F\u7075\u901A&nbsp;&nbsp;</span>\n\t\t <span><input id=\"a15_s_s\" value=\"\"></span>&nbsp;&nbsp;&nbsp;&nbsp;\n\t    \n\t     <span>\u4F20\u771F&nbsp;&nbsp;</span>\n\t\t <span><input id=\"a16_s_s\" value=\"\"></span>&nbsp;&nbsp;&nbsp;&nbsp;\n\t    \n\t     <span>\u5176\u5B83\u8054\u7CFB\u65B9\u5F0F&nbsp;&nbsp;</span>\n\t\t <span><input id=\"a17_s_s\" value=\"\"></span>&nbsp;&nbsp;&nbsp;&nbsp;\n\t    \n  \t<br><br>\n\t     <span>\u4EE3\u7406\u516C\u53F8&nbsp;&nbsp;</span>\n\t\t <span><input id=\"a18_s_s\" value=\"\"></span>&nbsp;&nbsp;&nbsp;&nbsp;\n\t    \n\t     <span>\u8054\u7CFB\u4EBA&nbsp;&nbsp;</span>\n\t\t <span><input id=\"a19_s_s\" value=\"\"></span>&nbsp;&nbsp;&nbsp;&nbsp;\n\t    \n\t     <span>\u804C\u4F4D&nbsp;&nbsp;</span>\n\t\t <span><input id=\"a20_s_s\" value=\"\"></span>&nbsp;&nbsp;&nbsp;&nbsp;\n\t    \n\t     <span>\u7535\u8BDD&nbsp;&nbsp;</span>\n\t\t <span><input id=\"a21_s_s\" value=\"\"></span>&nbsp;&nbsp;&nbsp;&nbsp;\n\t    \n  \t\t<span>\u662F\u5426\u5220\u9664&nbsp;&nbsp;</span>\n\t\t <select class=\"ui-input ui-input-mini\" id=\"isdelete_i_i\" style=\"width:135px\">\n\t\t <option value=\"\"  >\u6240\u6709</option>\n\t\t <option value=\"0\" selected=\"selected\">\u5426</option>   \n\t\t <option value=\"1\">\u662F</option>\n\t\t </select>&nbsp;&nbsp;&nbsp;&nbsp;\n\t\t \n </div>";
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
			var c = "&nbsp;<a class=\"table-link\" target=\"_blank\" onclick=\"signIn('" + row.id + "','" + row.uniqId_s + "','" + fromValue + "&f=cityMediaBase_Table','cityMediaBase_Detail');\"><font color=\"green\"><B>" + f + "</B></font></a>";
			// if(isNotNull(row.task_ss) && row.task_ss[0] == '1'){
			c += "&nbsp;<a class=\"table-link\" target=\"_blank\" onclick=\"signIn('" + row.id + "','" + row.uniqId_s + "','" + fromValue + "&f=cityMediaBase_Table','cityMediaBase_edit');\"><font color=\"green\"><B>\u7F16\u8F91</B></font></a>";

			c += "&nbsp;<a class=\"table-link\" target=\"_blank\" onclick=\"delRow('" + row.id + "','table','R1_base');\"><font color=\"green\"><B>\u5220\u9664</B></font></a>";
			// }
			return c;
		}
	},
	/** { "data": "task_ss","render": (data, type, row, meta) => {
      let f = data[0];
      return line_emun[f];
  } },*/
	{ "data": "a2_s" }, { "data": "a3_s" }, { "data": "a4_s" }, { "data": "a5_i" }, { "data": "a6_s" }, { "data": "a7_s" }, { "data": "a8_s" }, { "data": "a9_s" }, { "data": "a10_s" }, { "data": "a11_s" }, { "data": "a12_s" }, { "data": "a13_s" }, { "data": "a14_s" }, { "data": "a15_s" }, { "data": "a16_s" }, { "data": "a17_s" }, { "data": "a18_s" }, { "data": "a19_s" }, { "data": "a20_s" }, { "data": "a21_s" }, { "data": "a22_s" }, { "data": "a23_s" }, { "data": "a24_s" }, { "data": "a25_s" }, { "data": "a26_s" }, { "data": "a27_s" }, { "data": "a28_s" }, { "data": "a29_s" }, { "data": "a30_d" }, { "data": "a31_s" }, { "data": "a32_d" }, { "data": "a33_s" }, { "data": "a34_s" }, { "data": "a35_s" }, { "data": "a39_s" }, { "data": "a40_s" }, { "data": "a41_s" }, { "data": "a42_dt", "format": "yyyy-MM-dd" }];

	var ajaxCallback = function ajaxCallback(json) {
		return json.content;
	};

	var ta = new _DTable.DTable("table").withiDisplayLength(30).withSort([[2, "desc"]], [0]).preDrawCallback(tooblar, function () {//set tooblar and run fuction

	}).preAjaxReduce(ajaxCallback).withAjax("R1_base", function () {
		//filter
		var st = $('#st').val();
		return {
			"filter[task_ss_ss]": st == 'Y' ? 50 : '',
			"filter[task_ss_ss_NEQ]": st == 'N' ? 50 : '',
			"filter[isdelete_i_i_EQ]": $('#isdelete_i_i').val(),

			"filter[a2_s_s]": $('#a2_s_s').val(),
			"filter[a3_s_s]": $('#a3_s_s').val(),
			"filter[a4_s_s]": $('#a4_s_s').val(),
			"filter[a5_i_i]": $('#a5_i_i').val(),
			"filter[a6_s_s]": $('#a6_s_s').val(),
			"filter[a7_s_s]": $('#a7_s_s').val(),
			"filter[a8_s_s]": $('#a8_s_s').val(),
			"filter[a9_s_s]": $('#a9_s_s').val(),
			"filter[a10_s_s]": $('#a10_s_s').val(),
			"filter[a11_s_s]": $('#a11_s_s').val(),
			"filter[a12_s_s]": $('#a12_s_s').val(),
			"filter[a13_s_s]": $('#a13_s_s').val(),
			"filter[a14_s_s]": $('#a14_s_s').val(),
			"filter[a15_s_s]": $('#a15_s_s').val(),
			"filter[a16_s_s]": $('#a16_s_s').val(),
			"filter[a17_s_s]": $('#a17_s_s').val(),
			"filter[a18_s_s]": $('#a18_s_s').val(),
			"filter[a19_s_s]": $('#a19_s_s').val(),
			"filter[a20_s_s]": $('#a20_s_s').val(),
			"filter[a21_s_s]": $('#a21_s_s').val()

		};
	}).withColumns(coluns).withExcelExport(true).withCountTd(false).withEnableSort(true); // is excelport

	ta.withInitComplete(function () {
		//set initcomplete
		$('#a2_s_s').change(function () {
			ta.fndraw();
		});
		$('#a3_s_s').change(function () {
			ta.fndraw();
		});
		$('#a4_s_s').change(function () {
			ta.fndraw();
		});
		$('#a5_i_i').change(function () {
			ta.fndraw();
		});
		$('#a6_s_s').change(function () {
			ta.fndraw();
		});
		$('#a7_s_s').change(function () {
			ta.fndraw();
		});
		$('#a8_s_s').change(function () {
			ta.fndraw();
		});
		$('#a9_s_s').change(function () {
			ta.fndraw();
		});
		$('#a10_s_s').change(function () {
			ta.fndraw();
		});
		$('#a11_s_s').change(function () {
			ta.fndraw();
		});
		$('#a12_s_s').change(function () {
			ta.fndraw();
		});
		$('#a13_s_s').change(function () {
			ta.fndraw();
		});
		$('#a14_s_s').change(function () {
			ta.fndraw();
		});
		$('#a15_s_s').change(function () {
			ta.fndraw();
		});
		$('#a16_s_s').change(function () {
			ta.fndraw();
		});
		$('#a17_s_s').change(function () {
			ta.fndraw();
		});
		$('#a18_s_s').change(function () {
			ta.fndraw();
		});
		$('#a19_s_s').change(function () {
			ta.fndraw();
		});
		$('#a20_s_s').change(function () {
			ta.fndraw();
		});
		$('#a21_s_s').change(function () {
			ta.fndraw();
		});
		$('#isdelete_i_i').change(function () {
			ta.fndraw();
		});
	}).draw();

	// this file is generator by tools

	//default sort 2 ,notsort-field 1,6
});