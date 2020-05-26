function trim(a, d) {
	return typeof (a) == "undefined" ? d : a;
}

function trimNaN(a, d) {
	return a == "NaN" ? d : a;
}

function updateContractid() {
	var sid = $("#seriaNum").val();
	console.log("sid:" + sid)
	var _url = 'http://' + changeAddr() + '/report/updateContractBusI/' + sid;
	console.log(_url);
	$.ajax({
		url : _url,
		type : 'GET',
 		dataType : 'json',
		success : function(data) {
		}
	})
}
function deleteOneLine(data) {
	layer.confirm('确定删除么？', {
		icon : 3
	}, function(index) {
		layer.close(index);
		if (true) {
			$.ajax({
				url : '/busselect/ajax-remove-publishLine',
				data : {
					"seriaNum" : $("#seriaNum").val(),
					"id" : data
				},
				type : "POST",
				dataType : "json",
				success : function(data) {
					if (data.left) {
						layer.msg(data.right);
						orderBusesTable.dataTable()._fnAjaxUpdate();
						updateContractid();
						// batchCount(${seriaNum!''});
						// getLineDetail(${seriaNum!''});
					} else {
						layer.msg(data.right);
					}
				}
			});
		}
	});
}

function changeModel2(sot, url) {
	var office = getOffice($("#db_id_" + sot).val());
	$
			.ajax(
					{
						url : "/busselect/ajax-des",
						type : "POST",
						data : {
							"buslinId" : $("#db_id_" + sot).val(),
							"modelid" : 0
						},
						success : function(data) {
							var v = '';
							$
									.each(
											data,
											function(i, item) {
												var w = "<option value=" + item
														+ ">" + "&nbsp;&nbsp;"
														+ item + "</option>";
												v += w;
												if (v == '') {
													$("#desId_" + sot)
															.html(
																	'<option value="暂无描述" selected="selected">暂无描述</option>');
												} else if (office == "八方达公司"
														&& item == "(单机)汽车") {
													v = "<option value='(单机八方达)汽车'>&nbsp;&nbsp;(单机八方达)汽车</option>";
													$("#desId_" + sot).html(v);
												} else if (office == "八方达公司"
														&& item == "(单机)纯电动车") {
													v = "<option value='(单机八方达)纯电动车'>&nbsp;&nbsp;(单机八方达)纯电动车</option>";
													$("#desId_" + sot).html(v);
												} else {
													$("#desId_" + sot).html(v);
													var modelD = $(
															"#desId_"
																	+ sot
																	+ "  option:selected")
															.val();
													if (modelD == '双层') {
														$(
																"#isdouble_"
																		+ sot
																		+ " option")
																.each(
																		function() {
																			if ($(
																					this)
																					.val() == '双层') {
																				$(
																						this)
																						.attr(
																								"selected",
																								"selected");
																			}
																		});
													}

												}

											});

						}
					}, "text");

}

function getOffice(db_id_) {
	var office = "";
	$.ajax({
		url : "/api/ajaxdetail/" + db_id_,
		type : "GET",
		async : false,
		data : {},
		success : function(data) {
			office = data.office;
		}
	}, "text");
	return office;
}

var g_days;
function addBatch(url) {
	g_days = $('#term_i').val();
	if ($('#markcenter').val() == "") {
		layer.msg("请先选择营销中心");
		return;
	}
	if (g_days == 0)
		g_days = 30;
	layer
			.open({
				type : 1,
				title : "发布线路",
				skin : 'layui-layer-rim',
				area : [ '950px', '500px' ],
				content : ''
						+ '<br><input type="hidden" id ="cc" class="layui-layer-ico layui-layer-close layui-layer-close1"/>'

						+ '<br><div class="ui-form-item toggle bodyToggle"> <label class="ui-label mt10">预计上刊日期:</label>'
						+ '<input class="ui-input datepicker validate[required,custom[date],past[#planD]]" type="text" name="planD" value="" id="planD" data-is="isAmount isEnough" autocomplete="off" disableautocomplete="">'
						+ '<font color="orange">注:每个批次刊期修改的时候,将自动修改后面行相同批次的刊期.</font></div>'

						+ ' <table border="1px #ooo" id="tab" style="  width: 97%;margin-left:20px;" cellpadding="0"   cellspacing="0" width="90%">'
						+ ' <tr align="center">'
						+ ' <td style="width:10%"><input id="allCkb" checked="checked" type="checkbox"/></td><td >批次</td> <td >线路</td><td  >媒体类型</td> <td style="width:10%">刊期</td><td >发布形式</td><td >级别</td><td >数量</td><td >预计上刊内容</td>'
						+ ' </tr>'
						+ ' <tr align="center" class="count">'
						+ ' <td  width="40px"><input  type="checkbox" checked="checked" id="ckb" name="ckb" value="1"/></td>'
						+ ' <td ><select  id="batch_1"  sot="1" ><option value="1" selected="selected">1</option> <option value="2" >2</option><option value="3" >3</option><option value="4" >4</option><option value="5" >5</option></select></td> '
						+ '<td ><input style="width:75px" class="ui-input"  id="line_id_1"  sot="1" data-is="isAmount isEnough"></td> '
						+ ' <td ><select  id="isdouble_1"> <option value="单层" selected="selected">单层</option><option value="双层" >双层</option></select></td> '
						+ ' <td width="40px" id="222"><input rowid="1" onkeyup="value=value.replace(/[^\\d]/g,\'\');changeFop(1);" class="ui-input " type="text" value="'
						+ g_days
						+ '" name="days" '
						+ 'id="days_1" data-is="isAmount isEnough" autocomplete="off" disableautocomplete="" placeholder="" style="width:90px">'
						+ ' </td>'
						+ ' <td ><select  style="width:150px" class="ui-input bus-model" name="lineDesc" id="desId_1"> <option value="0" selected="selected">所有类型</option> </select></td>'
						+ '<td ><input class="ui-input"  id="levle_1" data-is="isAmount isEnough" style="width:65px"></td>'
						+ ' <td ><input class="ui-input sum" type="text" value="" sot="1" name="salesNumber" onkeyup="value=value.replace(/[^\\d]/g,\'\')" '
						+ 'id="salesNumber_1" data-is="isAmount isEnough" autocomplete="off" disableautocomplete="" placeholder=""  style="width:45px">'
						+ ' </td>'
						+ ' <td ><input class="ui-input"  id="publishValue_1" data-is="isAmount isEnough"  style="width:165px"></td>'
						+ ' <input type="hidden" value="" name="lineId" id="db_id_1"  style="width:90px"> </tr> '
						+ '</table>'
						+ '<br><div style="margin-left:20px;"> <h style="color: #00A7E8;letter-spacing: 2px;font-weight: 600;">添加</h><input style="width:45px; margin: 0 3px 0 3px;" class="ui-input" id="rows" type="text" value="" onkeyup="value=value.replace(/[^\\d]/g,\'\')"><h style="color: #00A7E8;letter-spacing: 2px;font-weight: 600;">行</h> <input type="button" onclick="addTrs(\'tab\', -1)" class="block-btn" onclick="" value="确认">'
						+ '<input type="button" class="block-btn" style="margin-left:20px;" onclick="addTr2(\'tab\', -1,\''
						+ url
						+ '\')" value="添加一行">&nbsp;'
						+ '<input type="button" class="block-btn" onclick="delTr2()" value="删除"><p></p> </div><p align="center"><input type="button" class="block-btn" onclick="batchOff(\''
						+ url + '\')" value="确定"></p>'
			});
	$('#planD').datepicker().on('click', function(ev) {
		$('.datepicker').css("z-index", "999999999");
	}).data('datepicker');

	$("#batch_1").change(function() {
		var sot = parseInt($(this).attr("sot"));
		var crt_val = $(this).val()
		var ckbs = $("select[id^='batch']");
		ckbs.each(function() {
			var sots = parseInt($(this).attr("sot"));
			if (sots > sot) {
				$(this).val(crt_val);
			}
		})
	})

	// $("#salesNumber_1").keyup(function() {
	// /* Act on the event */
	// var sot = parseInt($(this).attr("sot"));
	// var crt_val = $(this).val()
	// var ckbs=$("input[id^='salesNumber_']");
	// ckbs.each(function () {
	// var sots = parseInt($(this).attr("sot"));
	// if(sots>sot){
	// $(this).val(crt_val);
	// }
	// })
	// });

	var edit = getUrlParam('edit');
	console.log(edit);
	if (edit == 1) {

		var markcenter = '';// changeMKT($('#company_s').val());
		
		$("#line_id_1").autocomplete(
				{
					minLength : 0,
					source : "/busselect/autoComplete?tag=reLevel&company="
							+ markcenter,
					change : function(event, ui) {
					},
					select : function(event, ui) {
						var sot = $(this).attr("sot");
						$('#line_id_' + sot).val(ui.item.value);
						$("#db_id_" + sot).val(ui.item.dbId);
						$("#levle_" + sot).val(ui.item.levelStr);
						changeModel2(sot, url);
					}
				}).focus(function() {
			$(this).autocomplete("search");
		});
	} else {
		var markcenter = '';// changeMKT($('#markcenter').val());
		$("#line_id_1").autocomplete(
				{
					minLength : 0,
					source : "/busselect/autoComplete?tag=reLevel&company="
							+ markcenter,
					change : function(event, ui) {
					},
					select : function(event, ui) {
						var sot = $(this).attr("sot");
						$('#line_id_' + sot).val(ui.item.value);
						$("#db_id_" + sot).val(ui.item.dbId);
						$("#levle_" + sot).val(ui.item.levelStr);
						changeModel2(sot, url);
					}
				}).focus(function() {
			$(this).autocomplete("search");
		});
	}

	$("#allCkb").click(function() {
		if (this.checked) {
			$("input[name='ckb']").prop("checked", true);
		} else {
			$("input[name='ckb']").removeAttr('checked');
		}
	});

}

function getUrlParam(name) {
	var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
	var r = window.location.search.substr(1).match(reg);
	if (r != null)
		return unescape(r[2]);
	return null;
}

function changeMKT(markcenter) {
	var mark = "";
	if (markcenter == "QC") {
		mark = "七彩";
	} else if (markcenter.indexOf("跨中心") != -1) {
		mark = "";
	} else if (markcenter == "ZY") {
		mark = "自营中心";
	} else {
		mark = markcenter;
	}
	return mark;
}

// 刊期同步调整
function changeFop(fop) {
	var fop2 = $("#days_" + fop).val();
	var batch = $("#batch_" + fop + " option:selected").val();
	var ckbs = $("input[name='ckb']");
	ckbs.each(function() {
		var crow = $(this).val();
		var checkRow = $("#batch_" + crow + " option:selected").val();
		// console.log(crow+" ~~~~ " +checkRow );
		if (fop < crow && checkRow == batch) {
			// console.log(crow + "_"+ checkRow);
			$("#days_" + crow).val(fop2);
		}
	});
}

function batchOff(url) {
	var o = document.getElementsByName("ckb");
	var dIds = '';
	for (var i = 0; i < o.length; i++) {
		if (o[i].checked)
			dIds += o[i].value + ',';
	}
	if (dIds == "") {
		layer.msg("请选择需要添加的数据");
		return false;
	}
	for (var i = 0; i < o.length; i++) {
		if (o[i].checked) {
			var obj = new Object();
			var sot = o[i].value;
			obj.batch = $("#batch_" + sot).val();
			obj.lineId = $("#db_id_" + sot).val();
			obj.mediaType = $("#isdouble_" + sot).val();
			obj.days = $("#days_" + sot).val();
			obj.lineDesc = $("#desId_" + sot).val();
			obj.salesNumber = $("#salesNumber_" + sot).val();
			obj.publishValue = $("#publishValue_" + sot).val();
			obj.seriaNum = $("#seriaNum").val();
			if ($("#db_id_" + sot).val() > 0 && obj.salesNumber > 0) {
				saveOne(obj, url);
			}
		}
	}
	orderBusesTable.dataTable()._fnAjaxUpdate();

	updateContractid();
	batchCount($("#seriaNum").val());
	getLineDetail($("#seriaNum").val());
	$("#cc").trigger("click");
}

function saveOne(obj, url) {
	var str = JSON.stringify(obj);
	var planD = $("#planD").val();
	var param = {
		"obj" : str,
		"planD" : planD
	}
	$.ajax({
		url : url + "/busselect/savePublishLine2",
		type : "POST",
		async : false,
		dataType : "json",
		data : param,
		success : function(data) {
		}
	});
}
function delTr(ckb) {
	// 获取选中的复选框，然后循环遍历删除
	var ckbs = $("input[name=" + ckb + "]:checked");
	if (ckbs.size() == 0) {
		alert("请选择删除指定行！");
		return;
	}
	ckbs.each(function() {
		$(this).parent().parent().remove();
	});
}
function allCheck(allCkb, items) {
	$("#" + allCkb).click(function() {
		$('[name="ckb"]:checkbox').attr("checked", checked);
	});
}

var ii = 2;
function addTr2(tab, row, url) {
	var trHtml = '<tr align="center" class="count"><td width="10%"><input type="checkbox" value="'
			+ ii
			+ '" id="ckb" checked="checked" name="ckb"/></td>'
			+ ' <td ><select  sot="'
			+ ii
			+ '" id="batch_'
			+ ii
			+ '"> <option value="1" selected="selected">1</option> <option value="2" >2</option><option value="3" >3</option><option value="4" >4</option><option value="5" >5</option></select></td> '
			+ ' <td ><input class="ui-input"  style="width:75px" sot="'
			+ ii
			+ '" id="line_id_'
			+ ii
			+ '"/></td>'
			+ ' <td ><select  id="isdouble_'
			+ ii
			+ '"> <option value="单层" selected="selected">单层</option><option value="双层" >双层</option></select></td> '
			+ ' <td ><input class="ui-input " style="width:90px" type="text" value='
			+ g_days
			+ '  onkeyup="value=value.replace(/[^\\d]/g,\'\');changeFop('
			+ ii
			+ ');"  name="days" id="days_'
			+ ii
			+ '"/></td>'
			+ ' <td ><select style="width:150px" class="ui-input bus-model" name="lineDesc" id="desId_'
			+ ii
			+ '"> <option value="0" selected="selected">所有类型</option> </select></td>'
			+ ' <td ><input class="ui-input"  id="levle_'
			+ ii
			+ '" data-is="isAmount isEnough" style="width:65px"></td>'
			+ ' <td ><input class="ui-input sum" type="text" sot="'
			+ ii
			+ '" value="" style="width:45px" name="salesNumber" onkeyup="value=value.replace(/[^\\d]/g,\'\')" id="salesNumber_'
			+ ii
			+ '"/></td><input type="hidden" value="" name="lineId" id="db_id_'
			+ ii
			+ '"  style="width:90px">'
			+ ' <td ><input class="ui-input"  id="publishValue_'
			+ ii
			+ '"   style="width:165px" data-is="isAmount isEnough"></td><input type="hidden" style="width:90px" value="0" name="lineId" id="db_id_'
			+ ii + '"></tr>';
	addTr(tab, row, trHtml, url);
	ii = ii + 1;
}

function addTrs(tab, row, url) {
	var rows = $('#rows').val();
	for (var i = 0; i < rows; i++) {
		var trHtml = '<tr align="center" class="count"><td width="10%"><input type="checkbox" value="'
				+ ii
				+ '" id="ckb" checked="checked" name="ckb"/></td>'
				+ ' <td ><select  sot="'
				+ ii
				+ '"  id="batch_'
				+ ii
				+ '"> <option value="1" selected="selected">1</option> <option value="2" >2</option><option value="3" >3</option><option value="4" >4</option><option value="5" >5</option></select></td> '
				+ ' <td ><input class="ui-input"  style="width:75px" sot="'
				+ ii
				+ '" id="line_id_'
				+ ii
				+ '"/></td>'
				+ ' <td ><select  id="isdouble_'
				+ ii
				+ '"> <option value="单层" selected="selected">单层</option> <option value="双层" >双层</option></select></td> '
				+ ' <td ><input class="ui-input " style="width:90px" type="text" value='
				+ g_days
				+ '  onkeyup="value=value.replace(/[^\\d]/g,\'\');changeFop('
				+ ii
				+ ');"  name="days" id="days_'
				+ ii
				+ '"/></td>'
				+ ' <td ><select style="width:150px" class="ui-input bus-model" name="lineDesc" id="desId_'
				+ ii
				+ '"> <option value="0" selected="selected">所有类型</option> </select></td>'
				+ ' <td ><input class="ui-input"  id="levle_'
				+ ii
				+ '" data-is="isAmount isEnough" style="width:65px"></td>'
				+ ' <td ><input class="ui-input sum" type="text" sot="'
				+ ii
				+ '" value="" style="width:45px" name="salesNumber" onkeyup="value=value.replace(/[^\\d]/g,\'\')" id="salesNumber_'
				+ ii
				+ '"/></td><input type="hidden" value="" name="lineId" id="db_id_'
				+ ii
				+ '"  style="width:90px">'
				+ ' <td ><input class="ui-input"  id="publishValue_'
				+ ii
				+ '"   style="width:165px" data-is="isAmount isEnough"></td><input type="hidden" style="width:90px" value="0" name="lineId" id="db_id_'
				+ ii + '"></tr>';
		addTr(tab, row, trHtml);
		ii = ii + 1;
	}
	$('#rows').val("");
}

function addTr(tab, row, trHtml, url) {
	// 获取table最后一行 $("#tab tr:last")
	// 获取table第一行 $("#tab tr").eq(0)
	// 获取table倒数第二行 $("#tab tr").eq(-2)
	var $tr = $("#" + tab + " tr").eq(row);
	if ($tr.size() == 0) {
		alert("指定的table id或行数不存在！");
		return;
	}
	$tr.after(trHtml);

	// 批量改变当前selcet下的批次
	$("#batch_" + ii).change(function() {
		var sot = parseInt($(this).attr("sot"));
		var crt_val = $(this).val()
		var ckbs = $("select[id^='batch']");
		ckbs.each(function() {
			var sots = parseInt($(this).attr("sot"));
			if (sots > sot) {
				$(this).val(crt_val);
			}
		})
	})

	// 批量改变数量
	$("#salesNumber_" + ii).keyup(function() {
		var sot = parseInt($(this).attr("sot"));
		var crt_val = $(this).val()
		var ckbs = $("input[id^='salesNumber_']");
		ckbs.each(function() {
			var sots = parseInt($(this).attr("sot"));
			if (sots > sot) {
				$(this).val(crt_val);
			}
		})
	})
	var edit = getUrlParam('edit');
	if (edit == 1) {
		var markcenter = changeMKT($('#company_s').val());
		$("#line_id_" + ii).autocomplete(
				{
					minLength : 0,
					source : "/busselect/autoComplete?tag=reLevel&company="
							+ markcenter,
					change : function(event, ui) {
					},
					select : function(event, ui) {
						var sot = $(this).attr("sot");
						$('#line_id_' + sot).val(ui.item.value);
						$("#db_id_" + sot).val(ui.item.dbId);
						$("#levle_" + sot).val(ui.item.levelStr);
						changeModel2(sot, url);
					}
				}).focus(function() {
			$(this).autocomplete("search");
		});
	} else {
		var markcenter = changeMKT($('#markcenter').val());
		$("#line_id_" + ii).autocomplete(
				{
					minLength : 0,
					source : "/busselect/autoComplete?tag=reLevel&company="
							+ markcenter,
					change : function(event, ui) {
					},
					select : function(event, ui) {
						var sot = $(this).attr("sot");
						$('#line_id_' + sot).val(ui.item.value);
						$("#db_id_" + sot).val(ui.item.dbId);
						$("#levle_" + sot).val(ui.item.levelStr);
						changeModel2(sot, url);
					}
				}).focus(function() {
			$(this).autocomplete("search");
		});
	}
}

function isNotEmptyString(str) {
	if (str != null && typeof (str) != "undefined" && str != "") {
		return str;
	}
	return '';
}

function delTr2() {
	delTr('ckb');
}

function editPublish(tourl, id) {

	$
			.ajax(
					{
						url : tourl + "/busselect/queryPublishLineByid/" + id,
						type : "GET",
						data : {},
						success : function(data) {
							var msg = '';
							var readonly = '';
							if (data.remainNuber > 0) {
								msg = '因为该批次已经有车辆上刊了,线路不能修改'
								readonly = "readonly";
							}

							layer
									.open({
										type : 1,
										title : "信息修改",
										skin : 'layui-layer-rim',
										area : [ '400px', '430px' ],
										content : '&nbsp;&nbsp;&nbsp;&nbsp;'
												+ msg
												+ ''
												+ '<form id="editPublishLineform" action='
												+ tourl
												+ '/busselect/savePublishLine2>'
												+ '<div class="inputs" style="margin-top: 20px;margin-left: -42px;">'
												+ '<div class="ui-form-item"><input type="hidden" name="id" value="'
												+ data.id
												+ '"/><input type="hidden" id ="cc" class="layui-layer-ico layui-layer-close layui-layer-close1"/>'
												+ '<label class="ui-label mt10">线路：</label>'
												+ '<input class="ui-input" value="'
												+ data.line.name
												+ '" readonly="readonly" id="line_id" data-is="isAmount isEnough">'
												+ '</div>'
												+ '<div class="ui-form-item"> <label class="ui-label mt10">订购数量：</label>'
												+ '<input class="ui-input " type="text" value="'
												+ data.salesNumber
												+ '" name="salesNumber" onkeyup="value=value.replace(/[^\\d]/g,\'\')" '
												+ 'id="busNumber" data-is="isAmount isEnough" autocomplete="off" disableautocomplete="" placeholder="">'
												+ '</div>'
												+ '<div class="ui-form-item"> <label class="ui-label mt10">刊期：</label>'
												+ '<input class="ui-input " type="text" value="'
												+ data.days
												+ '" name="days"  '
												+ 'id="batch" data-is="isAmount isEnough" autocomplete="off" disableautocomplete="" placeholder="">'
												+ '</div>'
												+ '<div class="ui-form-item"> <label class="ui-label mt10">广告内容：</label>'
												+ '<input class="ui-input " type="text" value="'
												+ isNotEmptyString(data.publishValue)
												+ '" name="publishValue"  '
												+ 'id="batch" data-is="isAmount isEnough" autocomplete="off" disableautocomplete="" placeholder="">'
												+ '</div>'
												+ '<div class="ui-form-item"> <label class="ui-label mt10">媒体类型：</label>'
												+ '<input class="ui-input " type="text" readonly="readonly" value="'
												+ data.mediaType
												+ '" name="mediaType"  '
												+ 'id="mediaType" data-is="isAmount isEnough" autocomplete="off" disableautocomplete="" placeholder="">'
												+ '</div>'
												+ '<div class="widthdrawBtBox" style="position: absolute; width:124%; bottom: 10px;">'
												+ '<input type="button" onclick="editLine2(\''
												+ tourl
												+ '\')" class="block-btn" value="保存" ></div>'
												+ '</div>'
												+ '<input type="hidden" value="'
												+ data.line.id
												+ '" name="lineId" id="db_id"></form>'
												+ '<div id="worm-tips" class="worm-tips" style="width:350px;display:none;"></div>'
									});

							$("#line_id")
									.autocomplete(
											{
												minLength : 0,
												source : tourl
														+ "/busselect/autoComplete?tag=reLevel",
												change : function(event, ui) {
												},
												select : function(event, ui) {
													var sot = $(this).attr(
															"sot");
													$('#line_id').val(
															ui.item.value);
													$("#db_id").val(
															ui.item.dbId);
													changeModel3(tourl);
												}
											}).focus(function() {
										$(this).autocomplete("search");
									});
							$('.ui-autocomplete').css("z-index", "999999999");

						}
					}, "text");
}

// 根据线路id查找单双层
function changeModel3(tourl) {
	$.ajax({
		url : tourl + "/busselect/findModelByLineId",
		type : "POST",
		data : {
			"lineId" : $("#db_id").val()
		},
		success : function(data) {
			$("#mediaType").val(data.right);
		}
	}, "text");

}
// 编辑保存
function editLine2(purl) {
	var lineid = $("#db_id").val();
	if (lineid == 0) {
		alert("请选择线路");
		return;
	}
	if ($("#busNumber").val() == 0) {
		alert("数量要大于0");
		return;
	}
	$('#editPublishLineform').ajaxForm(function(data) {
		if (data.left) {
			updateContractid();
			layer.msg("编辑成功");
			orderBusesTable.dataTable()._fnAjaxUpdate();
			$("#cc").trigger("click");

		} else {
			layer.msg(data.right);
		}
	}).submit();
}

// 合同分期
var planTableOfPlan;
function initPlan() {
	planTableOfPlan = $('#planTableOfPlan')
			.DataTable(
					{
						"dom" : '<"#toolbar">rt',
						"searching" : false,
						"ordering" : true,
						"aaSorting" : [ [ 1, "desc" ] ],
						"columnDefs" : [ {
							"orderable" : false,
							"targets" : [ 0, 2, 3, ]
						}, ],
						"iDisplayLength" : 1500,
						"ordering" : true,
						"serverSide" : false,
						"ajax" : {
							type : "GET",
							url : 'http://'
									+ changeAddr()
									+ '/common/getModelList?filter[className]=PayPlan',
							data : function(d) {
								return $.extend({}, d, {
									"filter[seriaNum_s_s]" : $('#seriaNum')
											.val(),
								});
							},
							"dataSrc" : function(json) {
								json.recordsTotal = json.totalElements;
								json.recordsFiltered = json.totalElements;
								return json.content;
							}

						},
						"columns" : [
								{
									"data" : "d_Map.price_d",
									"defaultContent" : ""
								},
								{
									"data" : "dt_Map.payDate_dt",
									"defaultContent" : "",
									"render" : function(data) {
										return data == null ? "" : $.format
												.date(data, "yyyy-MM-dd");
									}
								},
								{
									"data" : "s_Map.remarks_s",
									"defaultContent" : "",
									"render" : function(data) {
										if (data == ""
												|| typeof (data) == "undefined") {
											return '';
										}
										return data;
									}
								},

								{
									"data" : "id",
									"defaultContent" : "",
									"render" : function(data, type, row, meta) {
										var operations = '';
										operations += '&nbsp;<a class="operation" href="javascript:void(0);" onclick="deletePayPlan(\''
												+ data + '\');" >删除</a>';
										operations += '&nbsp;&nbsp;<a class="operation" href="javascript:void(0)"; onclick="toeditPayPlan(\''
												+ data + '\');" >修改</a>';
										return operations;
									}
								},

						],
						"language" : {
							"url" : "/js/jquery.dataTables.lang.cn.json"
						},
						"initComplete" : initComplete2,
						"drawCallback" : drawCallback_plan,
					});
}
function drawCallback_plan() {
	var sum = 0;
	planTableOfPlan.rows().eq(0).each(function(index) {
		var row = planTableOfPlan.row(index);
		var data = row.data();
		sum += data.d_Map.price_d;
	})
	$('#planTableOfPlanInfo').html(
			'合同分期总金额：<span id="sumT" style="color:red;">' + sum
					+ '</span>（元）<br>');
}

function drawCallback_actual() {
	var sum = 0;
	actualPayment.rows().eq(0).each(function(index) {
		var row = actualPayment.row(index);
		var data = row.data();
		sum += data.d_Map.price_d;
	})
	$('#actualPaymentInfo').html(
			'实际付款总金额：<span id="sumT" style="color:red;">' + sum
					+ '</span>（元）<br>');
}

function drawCallback_Invoice() {
	var sum = 0;
	Invoice.rows().eq(0).each(function(index) {
		var row = Invoice.row(index);
		var data = row.data();
		sum += data.d_Map.price_d;
	})
	$('#InvoiceInfo').html(
			'发票总金额：<span id="sumT" style="color:red;">' + sum
					+ '</span>（元）<br>');
}

// 实际付款
var actualPayment;
function initactualPayment() {
	actualPayment = $('#actualPayment')
			.DataTable(
					{
						"dom" : '<"#toolbar">rt',
						"searching" : false,
						"iDisplayLength" : 1500,
						"ordering" : false,
						"serverSide" : false,
						"ajax" : {
							type : "GET",
							url : 'http://'
									+ changeAddr()
									+ '/common/getModelList?filter[className]=Payed',
							data : function(d) {
								return $.extend({}, d, {
									"filter[seriaNum_s_s]" : $('#seriaNum')
											.val(),
								});
							},
							"dataSrc" : function(json) {
								json.recordsTotal = json.totalElements;
								json.recordsFiltered = json.totalElements;
								return json.content;
							}

						},
						"columns" : [
								{
									"data" : "d_Map.price_d",
									"defaultContent" : ""
								},
								{
									"data" : "dt_Map.payDate_dt",
									"defaultContent" : "",
									"render" : function(data) {
										return data == null ? "" : $.format
												.date(data, "yyyy-MM-dd");
									}
								},
								{
									"data" : "id",
									"defaultContent" : "",
									"render" : function(data, type, row, meta) {
										var operations = '';
										operations += '&nbsp;<a class="operation" href="javascript:void(0);" onclick="deletePayed(\''
												+ data + '\');" >删除</a>';
										operations += '&nbsp;&nbsp;<a class="operation" href="javascript:void(0)"; onclick="toeditPayed(\''
												+ data + '\');" >修改</a>';
										return operations;
									}
								},

						],
						"language" : {
							"url" : "/js/jquery.dataTables.lang.cn.json"
						},
						"initComplete" : initComplete2,
						"drawCallback" : drawCallback_actual,
					});
}

// 弹出添加付款窗口
function addActualPay() {
	var seriaNum = $('#seriaNum').val();
	layer
			.open({
				type : 1,
				title : "实际收款",
				skin : 'layui-layer-rim',
				area : [ '470px', '300px' ],
				content : '' + '<form id="fenqiform" method="post" action='
						+ 'http://'
						+ changeAddr()
						+ '/common/saveModel'
						+ '>'
						+ '<div class="inputs" style="margin-top: 40px;margin-left: -30px;">'
						+ '<input type="hidden" name="seriaNum_s" value="'
						+ seriaNum
						+ '"/>'
						+ '<input type="hidden" name="className" value="Payed"/>'
						+ '<input type="hidden" name="checkUniq" value="N"/>'
						+ '<input type="hidden" id ="cc" class="layui-layer-ico layui-layer-close layui-layer-close1"/> '
						+ '<br><div class="ui-form-item"> <label class="ui-label mt10">金额：</label>'
						+ '<input class="ui-input validate[required]" type="text" value="" id="price_d" name="price_d" onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^\\d.]/g,\'\')}else{this.value=this.value.replace(/[^\\d.]/g,\'\')}"'
						+ 'id="price" data-is="isAmount isEnough" autocomplete="off" disableautocomplete="" placeholder="">'
						+ '</div>'
						+ '<div class="ui-form-item toggle bodyToggle"> <label class="ui-label mt10">付款日期:</label>'
						+ '<input class="ui-input datepicker validate[required,custom[date],past[#payDate1]]" type="text" name="payDate_dt" value="" id="payDate1" data-is="isAmount isEnough" autocomplete="off" disableautocomplete="">'
						+ '</div>'
						+ '<input type="hidden" name="payMonth_s" value="" id="payMonth_id" >'
						+ '</div>'
						+ '<div class="widthdrawBtBox" style="position: absolute; bottom: 10px;">'
						+ '<input type="button" onclick="savePayed()" class="block-btn" value="确认" ></div>'
						+ '</form>'
						+ '<div id="worm-tips" class="worm-tips" style="width:350px;display:none;"></div>'
			});
	var checkin = $('#payDate1').datepicker().on('click', function(ev) {
		$('.datepicker').css("z-index", "999999999");
	}).data('datepicker');
}
// 弹出添加分期付款的窗口
function addPayPlan() {
	var seriaNum = $('#seriaNum').val();
	layer
			.open({
				type : 1,
				title : "合同分期",
				skin : 'layui-layer-rim',
				area : [ '470px', '400px' ],
				content : '' + '<form id="fenqiform" method="post" action='
						+ 'http://'
						+ changeAddr()
						+ '/common/saveModel'
						+ '>'
						+ '<div class="inputs" style="margin-top: 40px;margin-left: -30px;">'
						+ '<input type="hidden" name="seriaNum_s" value="'
						+ seriaNum
						+ '"/>'
						+ '<input type="hidden" name="className" value="PayPlan"/>'
						+ '<input type="hidden" name="checkUniq" value="N"/>'
						+ '<input type="hidden" id ="cc" class="layui-layer-ico layui-layer-close layui-layer-close1"/> '
						+ '<br><div class="ui-form-item"> <label class="ui-label mt10">金额：</label>'
						+ '<input class="ui-input validate[required]" type="text" value="" id="price_d" name="price_d" onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^\\d.]/g,\'\')}else{this.value=this.value.replace(/[^\\d.]/g,\'\')}"'
						+ 'id="price" data-is="isAmount isEnough" autocomplete="off" disableautocomplete="" placeholder="">'
						+ '</div>'
						+ '<div class="ui-form-item toggle bodyToggle"> <label class="ui-label mt10">付款日期:</label>'
						+ '<input class="ui-input datepicker validate[required,custom[date],past[#payDate1]]" type="text" name="payDate_dt" value="" id="payDate1" data-is="isAmount isEnough" autocomplete="off" disableautocomplete="">'
						+ '</div>'
						+ '<input type="hidden" name="payMonth_s" value="" id="payMonth_id" >'
						+ '<div class="ui-form-item"> <label class="ui-label mt10">备注：</label>'
						+ '<textarea rows="5" cols="30"  data-is="isAmount isEnough" style="resize: none;" id="remarks" name="remarks_s"></textarea>'
						+ '</div>'
						+ '</div>'
						+ '<div class="widthdrawBtBox" style="position: absolute; bottom: 10px;">'
						+ '<input type="button" onclick="savePayPlan()" class="block-btn" value="确认" ></div>'
						+ '</form>'
						+ '<div id="worm-tips" class="worm-tips" style="width:350px;display:none;"></div>'
			});
	var checkin = $('#payDate1').datepicker().on('click', function(ev) {
		$('.datepicker').css("z-index", "999999999");
	}).data('datepicker');
}

// 弹出编辑分期付款的窗口
function toeditPayPlan(id) {
	var seriaNum = $('#seriaNum').val();
	$
			.ajax(
					{
						url : 'http://' + changeAddr()
								+ '/common/queryById?className=PayPlan&id='
								+ id,
						type : "GET",
						data : {},
						success : function(data) {
							layer
									.open({
										type : 1,
										title : "合同分期修改",
										skin : 'layui-layer-rim',
										area : [ '470px', '400px' ],
										content : ''
												+ '<form id="editPayPlanForm" method="post" action='
												+ 'http://'
												+ changeAddr()
												+ '/common/saveModel'
												+ '>'
												+ '<div class="inputs" style="margin-top: 40px;margin-left: -30px;">'
												+ '<input type="hidden" name="seriaNum_s" value="'
												+ seriaNum
												+ '"/>'
												+ '<input type="hidden" name="className" value="PayPlan"/>'
												+ '<input type="hidden" name="id" value="'
												+ id
												+ '"/>'
												+ '<input type="hidden" name="payMonth_s" value="" id="payMonth_id" >'
												+ '<input type="hidden" name="selectByField" value="id"/>'
												+ '<input type="hidden" id ="cc" class="layui-layer-ico layui-layer-close layui-layer-close1"/> '
												+ '<div class="ui-form-item"> <label class="ui-label mt10">金额：</label>'
												+ '<input class="ui-input " type="text" value="'
												+ data.d_Map.price_d
												+ '" name="price_d"  '
												+ 'id="price_d" data-is="isAmount isEnough" autocomplete="off" disableautocomplete="" placeholder="">'
												+ '</div>'
												+ '<div class="ui-form-item toggle bodyToggle"> <label class="ui-label mt10">付款日期:</label>'
												+ '<input class="ui-input datepicker validate[required,custom[date],past[#payDate1]]" type="text" name="payDate_dt" value="'
												+ $.format.date(
														data.dt_Map.payDate_dt,
														"yyyy-MM-dd")
												+ '" id="payDate1" data-is="isAmount isEnough" autocomplete="off" disableautocomplete="">'
												+ '</div>'
												+ '<div class="ui-form-item"> <label class="ui-label mt10">备注：</label>'
												+ '<textarea rows="4" cols="30"  data-is="isAmount isEnough" style="resize: none;" name="remarks_s">'
												+ data.s_Map.remarks_s
												+ '</textarea>'
												+ '</div>'
												+ '</div>'
												+ '<div class="widthdrawBtBox" style="position: absolute; bottom: 10px;">'
												+ '<input type="button" onclick="editPayPlan()"; class="block-btn" value="确认" ></div>'
												+ '</form>'
												+ '<div id="worm-tips" class="worm-tips" style="width:350px;display:none;"></div>'
									});
							var checkin = $('#payDate1').datepicker().on(
									'click',
									function(ev) {
										$('.datepicker').css("z-index",
												"999999999");
									}).data('datepicker');
						}
					}, "text");

}


//每月26号后算下一天
function getNextMonth(dayString){
	var st = dayString.split("-");
	var day = parseInt(st[2]);
	var month = parseInt(st[1]);
	var year = parseInt(st[0]);
	
	if(day > 25){
		month = month + 1;
		if(month > 12){
			month = 1
			year = year + 1 ; 
		}
	}
	month = month < 10 ? "0" + month : month;
	var r = year + "-" + month;
	console.log("month:" + r)
	return r;
}



// 弹出编辑实际付款的窗口
function toeditPayed(id) {
	var seriaNum = $('#seriaNum').val();
	$
			.ajax(
					{
						url : 'http://' + changeAddr()
								+ '/common/queryById?className=Payed&id=' + id,
						type : "GET",
						data : {},
						success : function(data) {
							layer
									.open({
										type : 1,
										title : "实际收款内容修改",
										skin : 'layui-layer-rim',
										area : [ '470px', '300px' ],
										content : ''
												+ '<form id="editPayPlanForm" method="post" action='
												+ 'http://'
												+ changeAddr()
												+ '/common/saveModel'
												+ '>'
												+ '<div class="inputs" style="margin-top: 40px;margin-left: -30px;">'
												+ '<input type="hidden" name="seriaNum_s" value="'
												+ seriaNum
												+ '"/>'
												+ '<input type="hidden" name="className" value="Payed"/>'
												+ '<input type="hidden" name="id" value="'
												+ id
												+ '"/>'
												+ '<input type="hidden" name="payMonth_s" value="" id="payMonth_id" >'
												+ '<input type="hidden" name="selectByField" value="id"/>'
												+ '<input type="hidden" id ="cc" class="layui-layer-ico layui-layer-close layui-layer-close1"/> '
												+ '<div class="ui-form-item"> <label class="ui-label mt10">金额：</label>'
												+ '<input class="ui-input " type="text" value="'
												+ data.d_Map.price_d
												+ '" name="price_d"  '
												+ 'id="price_d" data-is="isAmount isEnough" autocomplete="off" disableautocomplete="" placeholder="">'
												+ '</div>'
												+ '<div class="ui-form-item toggle bodyToggle"> <label class="ui-label mt10">付款日期:</label>'
												+ '<input class="ui-input datepicker validate[required,custom[date],past[#payDate1]]" type="text" name="payDate_dt" value="'
												+ $.format.date(
														data.dt_Map.payDate_dt,
														"yyyy-MM-dd")
												+ '" id="payDate1" data-is="isAmount isEnough" autocomplete="off" disableautocomplete="">'
												+ '</div>'
												+ '</div>'
												+ '<div class="widthdrawBtBox" style="position: absolute; bottom: 10px;">'
												+ '<input type="button" onclick="editPayed()"; class="block-btn" value="确认" ></div>'
												+ '</form>'
												+ '<div id="worm-tips" class="worm-tips" style="width:350px;display:none;"></div>'
									});
							var checkin = $('#payDate1').datepicker().on(
									'click',
									function(ev) {
										$('.datepicker').css("z-index",
												"999999999");
									}).data('datepicker');
						}
					}, "text");

}

function savePayPlan() {
	var today = GetDateStr();
	var payDate = $("#payDate1").val();
	var price_d = $("#price_d").val();
	if (price_d == "") {
		layer.msg("请填写正确金额");
		return;
	}
	var m = payDate.substring(0, 7);
	$("#payMonth_id").val(m);
	$('#fenqiform').ajaxForm(function(data) {
		if (data.status == 200) {
			layer.msg("添加成功");
			planTableOfPlan.ajax.reload();
			$("#cc").trigger("click");
		} else {
			layer.msg(data.errorMessage, {
				icon : 5
			});
		}
	}).submit();
}
function savePayed() {
	var today = GetDateStr();
	var payDate = $("#payDate1").val();
	var price_d = $("#price_d").val();
	if (price_d == "") {
		layer.msg("请填写正确金额");
		return;
	}
	var m = payDate.substring(0, 7);
	  m = getNextMonth(payDate);//.substring(0, 7);
	$("#payMonth_id").val(m);
	$('#fenqiform').ajaxForm(function(data) {
		if (data.status == 200) {
			layer.msg("添加成功");
			actualPayment.ajax.reload();
			$("#cc").trigger("click");
		} else {
			layer.msg(data.errorMessage, {
				icon : 5
			});
		}
	}).submit();
}

function initComplete2() {
	$("div#toolbar").attr("style", "width: 70%;")
	$("div#toolbar").html('');
	bindLayerMouseOver();
}
// 修改分期
function editPayPlan() {
	var today = GetDateStr();
	var payDate = $("#payDate1").val();
	var price_d = $("#price_d").val();
	if (price_d == "") {
		layer.msg("请填写正确金额");
		return;
	}
	var m = payDate.substring(0, 7);
	$("#payMonth_id").val(m);
	$('#editPayPlanForm').ajaxForm(function(data) {
		if (data.status == 200) {
			layer.msg("修改成功");
			planTableOfPlan.ajax.reload();
			$("#cc").trigger("click");
		} else {
			layer.msg("修改失败");
		}
	}).submit();
}
// 修改实际
function editPayed() {
	var today = GetDateStr();
	var payDate = $("#payDate1").val();
	var price_d = $("#price_d").val();
	if (price_d == "") {
		layer.msg("请填写正确金额");
		return;
	}
	var m = getNextMonth(payDate);//.substring(0, 7);
	$("#payMonth_id").val(m);
	$('#editPayPlanForm').ajaxForm(function(data) {
		if (data.status == 200) {
			layer.msg("修改成功");
			actualPayment.ajax.reload();
			$("#cc").trigger("click");
		} else {
			layer.msg("修改失败");
		}
	}).submit();
}
// 删除分期
function deletePayPlan(id) {
	layer.confirm('确定删除吗？', {
		icon : 3
	}, function(index) {
		layer.close(index);
		if (true) {
			$.ajax({
				url : "http://" + changeAddr() + "/common/delById?id=" + id
						+ "&className=PayPlan",
				type : "GET",
				async : false,
				dataType : "json",
				success : function(data) {
					if (data == true) {
						layer.msg("删除成功");
						planTableOfPlan.ajax.reload();
					} else {
						layer.msg("删除失败", {
							icon : 5
						});
					}
				}
			});
		}
	});

}
// 删除实际付款
function deletePayed(id) {
	layer.confirm('确定删除吗？', {
		icon : 3
	}, function(index) {
		layer.close(index);
		if (true) {
			$.ajax({
				url : "http://" + changeAddr() + "/common/delById?id=" + id
						+ "&className=Payed",
				type : "GET",
				async : false,
				dataType : "json",
				success : function(data) {
					if (data == true) {
						layer.msg("删除成功");
						actualPayment.ajax.reload();
					} else {
						layer.msg("删除失败", {
							icon : 5
						});
					}
				}
			});
		}
	});

}

// 发票列表
var Invoice;
function initInvoice() {
	Invoice = $('#Invoice')
			.DataTable(
					{
						"dom" : '<"#toolbar">rt',
						"searching" : false,
						"iDisplayLength" : 1500,
						"ordering" : false,
						"serverSide" : false,
						"ajax" : {
							type : "GET",
							url : 'http://'
									+ changeAddr()
									+ '/common/getModelList?filter[className]=Invoice',
							data : function(d) {
								return $.extend({}, d, {
									"filter[seriaNum_s_s]" : $('#seriaNum')
											.val(),
								});
							},
							"dataSrc" : function(json) {
								json.recordsTotal = json.totalElements;
								json.recordsFiltered = json.totalElements;
								return json.content;
							}

						},
						"columns" : [
								{
									"data" : "d_Map.price_d",
									"defaultContent" : ""
								},
								{
									"data" : "dt_Map.payDate_dt",
									"defaultContent" : "",
									"render" : function(data) {
										return data == null ? "" : $.format
												.date(data, "yyyy-MM-dd");
									}
								},
								{
									"data" : "s_Map.invoiceNo_s",
									"defaultContent" : ""
								},
								{ "data": "s_Map.invoiceType_s", "defaultContent": "",
				                "render": function(data, type, row, meta) {
				                   if(data=="zp"){  
				                        return "专用发票"  ;  
				                   }
				                   else{
				                        return "普通发票";
				                   }
				                }
				                },
				                { "data": "s_Map.invoiceMsg_s", "defaultContent": ""},
								{
									"data" : "id",
									"defaultContent" : "",
									"render" : function(data, type, row, meta) {
										var operations = '';
										operations += '&nbsp;<a class="operation" href="javascript:void(0);" onclick="deleteInvoice(\''
												+ data + '\');" >删除</a>';
										operations += '&nbsp;&nbsp;<a class="operation" href="javascript:void(0)"; onclick="toeditInvoice(\''
												+ data + '\');" >修改</a>';
										return operations;
									}
								},

						],
						"language" : {
							"url" : "/js/jquery.dataTables.lang.cn.json"
						},
						"initComplete" : initComplete2,
						"drawCallback" : drawCallback_Invoice,
					});
}

// 弹出添加发票窗口
function addInvoice() {
	var seriaNum = $('#seriaNum').val();
	layer
			.open({
				type : 1,
				title : "添加发票",
				skin : 'layui-layer-rim',
				area : [ '470px', '500px' ],
				content : '' + '<form id="fenqiform" method="post" action='
						+ 'http://'
						+ changeAddr()
						+ '/common/saveModel'
						+ '>'
						+ '<div class="inputs" style="margin-top: 40px;margin-left: -30px;">'
						+ '<input type="hidden" name="seriaNum_s" value="'
						+ seriaNum
						+ '"/>'
						+ '<input type="hidden" name="className" value="Invoice"/>'
						+ '<input type="hidden" name="checkUniq" value="N"/>'
						+ '<input type="hidden" id ="cc" class="layui-layer-ico layui-layer-close layui-layer-close1"/> '
						+ '<br><div class="ui-form-item"> <label class="ui-label mt10">金额：</label>'
						+ '<input class="ui-input validate[required]" type="text" value="" id="price_d" name="price_d" onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^\\d.]/g,\'\')}else{this.value=this.value.replace(/[^\\d.]/g,\'\')}"'
						+ ' data-is="isAmount isEnough" autocomplete="off" disableautocomplete="" placeholder="">'
						+ '</div>'
						+ '<div class="ui-form-item toggle bodyToggle"> <label class="ui-label mt10">付款日期:</label>'
						+ '<input class="ui-input datepicker validate[required,custom[date],past[#payDate1]]" type="text" name="payDate_dt" value="" id="payDate1" data-is="isAmount isEnough" autocomplete="off" disableautocomplete="">'
						+ '</div>'
						+ '<div class="ui-form-item"> <label class="ui-label mt10">发票号：</label>'
						+ '<input class="ui-input validate[required]" type="text" value="" id="invoiceNo_s" name="invoiceNo_s" '
						+ ' data-is="isAmount isEnough" autocomplete="off">'
						+ '</div>'
						+ '</div>'
						+ '<div class="widthdrawBtBox" style="position: absolute; bottom: 10px;">'
						+ '<input type="button" onclick="saveInvoice()" class="block-btn" value="确认" ></div>'
						+ '</form>'
						+ '<div id="worm-tips" class="worm-tips" style="width:350px;display:none;"></div>'
			});
	var checkin = $('#payDate1').datepicker().on('click', function(ev) {
		$('.datepicker').css("z-index", "999999999");
	}).data('datepicker');
}

function saveInvoice() {
	var today = GetDateStr();
	var payDate = $("#payDate1").val();
	var price_d = $("#price_d").val();
	var invoiceNo_s = $("#invoiceNo_s").val();
	if (price_d == "") {
		layer.msg("请填写正确金额");
		return;
	}
	if (invoiceNo_s == "") {
		layer.msg("请填写发票号");
	}
	$('#fenqiform').ajaxForm(function(data) {
		if (data.status == 200) {
			layer.msg("添加成功");
			Invoice.ajax.reload();
			$("#cc").trigger("click");
		} else {
			layer.msg(data.errorMessage, {
				icon : 5
			});
		}
	}).submit();
}

// 弹出编辑发票的窗口
function toeditInvoice(id) {
	var seriaNum = $('#seriaNum').val();
	$
			.ajax(
					{
						url : 'http://' + changeAddr()
								+ '/common/queryById?className=Invoice&id='
								+ id,
						type : "GET",
						data : {},
						success : function(data) {
							layer
									.open({
										type : 1,
										title : "发票内容修改",
										skin : 'layui-layer-rim',
										area : [ '770px', '600px' ],
										content : ''
												+ '<form id="editPayPlanForm" method="post" action='
												+ 'http://'
												+ changeAddr()
												+ '/common/saveModel'
												+ '>'
												+ '<div class="inputs" style="margin-top: 40px;margin-left: -30px;">'
												+ '<input type="hidden" name="seriaNum_s" value="'
												+ seriaNum
												+ '"/>'
												+ '<input type="hidden" name="className" value="Invoice"/>'
												+ '<input type="hidden" name="id" value="'
												+ id
												+ '"/>'

												+ '<input id="user_s" name="user_s" type="hidden" value="'+data.s_Map.user_s+'" />'
												+ '<input type="hidden" name="selectByField" value="id"/>'
												+ '<input type="hidden" id ="cc" class="layui-layer-ico layui-layer-close layui-layer-close1"/> '

												+ '<div class="ui-form-item"> <label class="ui-label mt10">合同编号</label>'
												+ '<input class="ui-input " readonly="readonly" type="text" value="'
												+ data.s_Map.contractCode_s
												+ '" name="contractCode_s"  '
												+ 'id="contractCode_s" data-is="isAmount isEnough" autocomplete="off" disableautocomplete="" placeholder="">'
												+ '</div>'

												+ '<div class="ui-form-item"> <label class="ui-label mt10">发票类型</label>'
												+ '<select class="ui-input ui-input" name="invoiceType_s" id="invoiceType_s">'
												+ '<option value="'
												+ trim(data.s_Map.invoiceType_s, "")
												+ '">'
												+ trim(data.s_Map.invoiceType_s, "")
												+ '</option>'
												+ '<option value="pp">普通发票</option>'
												+ '<option value="zp">专用发票</option>'
												+ '</select>'
												+ '</div>'

												+ '<div class="ui-form-item"> <label class="ui-label mt10">发票金额</label>'
												+ '<input class="ui-input " type="text" value="'
												+ data.d_Map.price_d
												+ '" name="price_d"  '
												+ 'id="price_d" data-is="isAmount isEnough" autocomplete="off" disableautocomplete="" placeholder="">'
												+ '</div>'

												+ '<div class="ui-form-item"> <label class="ui-label mt10">营销中心</label>'
												+ '<input class="ui-input "  readonly="readonly" type="text" value="'
												+ data.s_Map.company_s
												+ '" name="company_s"  '
												+ 'id="company_s" data-is="isAmount isEnough" autocomplete="off" disableautocomplete="" placeholder="">'
												+ '</div>'

												+ '<div class="ui-form-item"> <label class="ui-label mt10">发票内容</label>'
												+ '<select class="ui-input ui-input" name="invoiceMsg_s" id="invoiceMsg_s">'
												+ '<option value="'
												+ trim(data.s_Map.invoiceMsg_s, "")
												+ '">'
												+ trim(data.s_Map.invoiceMsg_s, "")
												+ '</option>'
												+ '<option value="广告发布费">广告发布费</option>'
												+ '<option value="广告制作费">广告制作费</option>'
												+ '<option value="制作费">制作费</option>'
												+ '<option value="其他">其他</option>'
												+ '</select>'
												+ '</div>'

												+ '<div class="ui-form-item toggle bodyToggle"> <label class="ui-label mt10"><span class="ui-form-required">* </span>开票日期</label>'
												+ '<input class="ui-input datepicker validate[required,custom[date],past[#payDate1]]" type="text" name="payDate_dt" value="'
												+ $.format.date(
														data.dt_Map.payDate_dt,
														"yyyy-MM-dd")
												+ '" id="payDate1" data-is="isAmount isEnough" autocomplete="off" disableautocomplete="">'
												+ '</div>'
												+ '<input id="payDate_mon" name="payDate_mon_s" type="hidden" value="" />'
												+ '<div class="ui-form-item"> <label class="ui-label mt10"><span class="ui-form-required">* </span>发票编号</label>'
												+ '<input class="ui-input validate[required,minSize[8],maxSize[8]]" type="text" value="'
												+ data.s_Map.invoiceNo_s
												+ '" name="invoiceNo_s"  '
												+ 'id="invoiceNo_s" data-is="isAmount isEnough" autocomplete="off" disableautocomplete="" placeholder="">'
												+ '</div>'

												+'<input id="img1_url" name="img1_url_s" type="hidden" value="'+data.s_Map.img1_url_s+'" />'

												+ '</form>'
												+ '<div class="ui-form-item"> <label class="ui-label mt10">发票文件</label>'
  												+ '<form id="img1" method="post" enctype="multipart/form-data">'
												+ '<img src="/upload_temp/'+data.s_Map.img1_url_s+'" id="img1_img" name="img1_img" border="1px solid #d0d0d0;" /><br/>'
												+ '<input id="img1_file" class="select_img" name="img1_file" type="file" onchange="uploadImaget(\'img1\');" />'
												+ '</form></div>'
												+ '</div>'


												+ '<div class="widthdrawBtBox" style="position: absolute; bottom: 10px;">'
												+ '<input type="button" onclick="editInvoice()"; class="block-btn" value="确认" ></div>'
												+ '<div id="worm-tips" class="worm-tips" style="width:350px;display:none;"></div>'
									});
							var checkin = $('#payDate1').datepicker().on(
									'click',
									function(ev) {
										$('.datepicker').css("z-index",
												"999999999");
									}).data('datepicker');
						}
					}, "text");

}

// 修改发票
function editInvoice() {
	var today = GetDateStr();
	var payDate1 = $("#payDate1").val();
	var payDate = parseInt(payDate1.substr(5, 2));
	$('#payDate_mon').val(payDate);
	var price_d = $("#price_d").val();
	var invoiceNo_s = $("#invoiceNo_s").val();
	if (price_d == "") {
		layer.msg("请填写正确金额");
		return;
	}
	if (invoiceNo_s == "") {
		layer.msg("请填写发票号");
	}
	$('#editPayPlanForm').ajaxForm(function(data) {
		if (data.status == 200) {
			layer.msg("修改成功");
			inMsg.draw();
			Invoice.ajax.reload();
			window.location.reload();
			$("#cc").trigger("click");
		} else {
			layer.msg("修改失败");
		}
	}).submit();
}
// 删除分期
function deleteInvoice(id,className) {
	layer.confirm('确定删除吗？', {
		icon : 3
	}, function(index) {
		layer.close(index);
		if (true) {
			$.ajax({
				url : "http://" + changeAddr() + "/common/delById?id=" + id
						+ "&className="+className,
				type : "GET",
				async : false,
				dataType : "json",
				success : function(data) {
					if (data == true) {
						layer.msg("删除成功");
						inMsg.draw();
						Invoice.ajax.reload();
					} else {
						layer.msg("删除失败", {
							icon : 5
						});
					}
				}
			});
		}
	});

}
function GetDateStr() {
	var dd = new Date();
	var y = dd.getFullYear();
	var m = dd.getMonth() + 1;// 获取当前月份的日期
	var d = dd.getDate();
	m = m < 10 ? "0" + m : m;
	d = d < 10 ? "0" + d : d;
	return y + "-" + m + "-" + d;
}


function addReport(userId) {
	var userId = userId;
	$
			.ajax({
				url : 'http://'
						+ changeAddr()
						+ '/report/queryReport?filter[changeToContract_s]=1&filter[status_s]=online&start=0&length=500&filter[userId]='
						+ userId+'&order[0][contractCode_s]=desc',
				type : 'GET',
				data : {},
				async : false,
				dataType : 'json',
				success : function(data) {
					layer
							.open({
								type : 1,
								title : "收入确认",
								skin : 'layui-layer-rim',
								area : [ '970px', '600px' ],
								content : ''
										+ '<form id="reportMsg" method="post" action='
										+ 'http://'
										+ changeAddr()
										+ '/common/saveModel'
										+ '>'
										+ '<input type="hidden" name="className" value="Contract_in"/>'
										+ '<input type="hidden" name="checkUniq" value="N"/>'
										+ '<input type="hidden" id ="cc" class="layui-layer-ico layui-layer-close layui-layer-close1"/> '
										+ '<input class="ui-input"'
										+ 'type="hidden" name="id" id="id">'
										+ '<div class="inputs" style="margin-top: 40px;float:left;">'
										+ '<div class="ui-form-item"> <label class="ui-label mt10"><span class="ui-form-required">* </span>合同编号： </label>'
										+ '<select class="ui-input ui-input-mini" name="contractCode_s" id="contractCode_s">'
										+ '<option value="">请选择</option>'
										+ '</select>'
										+ '</div>'

										+ '<div class="ui-form-item"> <label class="ui-label mt10">客户名称：</label><input class="ui-input"'
										+ 'type="text" name="customer_s" id="customer_s" value=""  data-is="isAmount isEnough" autocomplete="off" disableautocomplete=""> <p class="ui-term-placeholder"></p> </div>'

										+ '<div class="ui-form-item"> <label class="ui-label mt10">广告内容：</label><input class="ui-input"'
										+ 'type="text" name="adContent_s" id="adContent_s" value=""  data-is="isAmount isEnough" autocomplete="off" disableautocomplete=""> <p class="ui-term-placeholder"></p> </div>'

										+ '<div class="ui-form-item"> <label class="ui-label mt10">总合同额：</label><input class="ui-input"'
										+ 'type="text" name="hj_d" id="hj_d" value=""  data-is="isAmount isEnough" autocomplete="off" disableautocomplete=""> <p class="ui-term-placeholder"></p> </div>'

										+ '<div class="ui-form-item"> <label class="ui-label mt10"><span class="ui-form-required">* </span>确认金额：</label><input class="ui-input validate[required]"'
										+ 'type="text" name="qrje_d" id="qrje_d" value=""  data-is="isAmount isEnough" autocomplete="off" disableautocomplete=""> <p class="ui-term-placeholder"></p> </div>'

										+ '<div class="ui-form-item"> <label class="ui-label mt10">刊出费：</label><input class="ui-input" '
										+ 'type="text" name="kcf_d" id="kcf_d" value=""  data-is="isAmount isEnough" autocomplete="off" disableautocomplete=""> <p class="ui-term-placeholder"></p> </div>'

										+ '<div class="ui-form-item"> <label class="ui-label mt10">制作费：</label><input class="ui-input"'
										+ 'type="text" name="zzf_d" id="zzf_d" value=""  data-is="isAmount isEnough" autocomplete="off" disableautocomplete=""> <p class="ui-term-placeholder"></p> </div>'

										+ '<div class="ui-form-item"> <label class="ui-label mt10">媒体类别：</label><input class="ui-input"'
										+ 'type="text" name="mediaType_s" id="mediaType_s" value=""  data-is="isAmount isEnough" autocomplete="off" disableautocomplete=""> <p class="ui-term-placeholder"></p> </div>'

										+ '<div class="ui-form-item"> <label class="ui-label mt10">刊期：</label><input class="ui-input"'
										+ 'type="text" name="term_i" id="term_i" value=""  data-is="isAmount isEnough" autocomplete="off" disableautocomplete=""> <p class="ui-term-placeholder"></p> </div>'

										+ '<div class="ui-form-item"> <label class="ui-label mt10">数量：</label><input class="ui-input"'
										+ 'type="text" name="busNum_i" id="busNum_i" value=""  data-is="isAmount isEnough" autocomplete="off" disableautocomplete=""> <p class="ui-term-placeholder"></p> </div></div>'

										+ '<div class="inputs" style="margin-top: 40px;margin-right: 80px;float:right;">'

										+ '<div class="ui-form-item"> <label class="ui-label mt10">预计发布时间：</label><input class="ui-input datepicker"'
										+ 'type="text" name="yjsksj_dt" id="yjsksj_dt" value=""  data-is="isAmount isEnough" autocomplete="off" disableautocomplete=""> <p class="ui-term-placeholder"></p> </div>'

										+ '<div class="ui-form-item"> <label class="ui-label mt10">合同规模（万元）：</label>'
										+ '<p class="ui-term-placeholder"></p> '
										+ '<select class="ui-input ui-input-mini" name="contractSize_s" id="contractSize_s">'
										+ '<option value="">请选择</option>'
										+ '<option value="0-10">0-10</option>'
										+ '<option value="10-50">10-50</option>'
										+ '<option value="50-100">50-100</option>'
										+ '<option value="100-300">100-300</option>'
										+ '<option value="300-600">300-600</option>'
										+ '<option value="600-1000">600-1000</option>'
										+ '<option value="1000以上">1000以上</option>'
										+ '</select>'
										+ '</div>'

										+ '<div class="ui-form-item"> <label class="ui-label mt10">价格方案：</label><input class="ui-input"'
										+ 'type="text" name="jgfa_s" id="jgfa_s" value=""  data-is="isAmount isEnough" autocomplete="off" disableautocomplete=""> <p class="ui-term-placeholder"></p> </div>'

										+ '<div class="ui-form-item"> <label class="ui-label mt10">行业：</label>'
										+ '<select class="ui-input ui-input-mini" name="hy_s" id="hy_s">'
										+ '<option value="">请选择</option>'
										+ '</select>'
										+ ' </div>'

										+ '<input type="text" style="display:none;" id="yf1" name="yf1_i">'
										+ '<input type="text" style="display:none;" id="yf2" name="yf2_i">'
										+ '<input type="text" style="display:none;" id="yf3" name="yf3_i">'
										+ '<input type="text" style="display:none;" id="yf4" name="yf4_i">'
										+ '<input type="text" style="display:none;" id="yf5" name="yf5_i">'
										+ '<input type="text" style="display:none;" id="yf6" name="yf6_i">'
										+ '<input type="text" style="display:none;" id="yf7" name="yf7_i">'
										+ '<input type="text" style="display:none;" id="yf8" name="yf8_i">'
										+ '<input type="text" style="display:none;" id="yf9" name="yf9_i">'
										+ '<input type="text" style="display:none;" id="yf10" name="yf10_i">'
										+ '<input type="text" style="display:none;" id="yf11" name="yf11_i">'
										+ '<input type="text" style="display:none;" id="yf12" name="yf12_i">'
										+ '<input type="text" style="display:none;" id="yf13" name="yf13_i">'
										+ '<input type="text" style="display:none;" id="yf14" name="yf14_i">'
										+ '<input type="text" style="display:none;" id="yf15" name="yf15_i">'
										+ '<input type="text" style="display:none;" id="yf16" name="yf16_i">'
										+ '<input type="text" style="display:none;" id="yf17" name="yf17_i">'
										+ '<input type="text" style="display:none;" id="yf18" name="yf18_i">'
										+ '<input type="text" style="display:none;" id="yf19" name="yf19_i">'
										+ '<input type="text" style="display:none;" id="yf20" name="yf20_i">'
										+ '<input type="text" style="display:none;" id="yf21" name="yf21_i">'
										+ '<input type="text" style="display:none;" id="yf22" name="yf22_i">'
										+ '<input type="text" style="display:none;" id="yf23" name="yf23_i">'
										+ '<input type="text" style="display:none;" id="yf24" name="yf24_i">'

										+ '<input type="text" style="display:none;" id="yj1" name="yj1_d">'
										+ '<input type="text" style="display:none;" id="yj2" name="yj2_d">'
										+ '<input type="text" style="display:none;" id="yj3" name="yj3_d">'
										+ '<input type="text" style="display:none;" id="yj4" name="yj4_d">'
										+ '<input type="text" style="display:none;" id="yj5" name="yj5_d">'
										+ '<input type="text" style="display:none;" id="yj6" name="yj6_d">'
										+ '<input type="text" style="display:none;" id="yj7" name="yj7_d">'
										+ '<input type="text" style="display:none;" id="yj8" name="yj8_d">'
										+ '<input type="text" style="display:none;" id="yj9" name="yj9_d">'
										+ '<input type="text" style="display:none;" id="yj10" name="yj10_d">'
										+ '<input type="text" style="display:none;" id="yj11" name="yj11_d">'
										+ '<input type="text" style="display:none;" id="yj12" name="yj12_d">'
										+ '<input type="text" style="display:none;" id="yj13" name="yj13_d">'
										+ '<input type="text" style="display:none;" id="yj14" name="yj14_d">'
										+ '<input type="text" style="display:none;" id="yj15" name="yj15_d">'
										+ '<input type="text" style="display:none;" id="yj16" name="yj16_d">'
										+ '<input type="text" style="display:none;" id="yj17" name="yf17_d">'
										+ '<input type="text" style="display:none;" id="yj18" name="yj18_d">'
										+ '<input type="text" style="display:none;" id="yj19" name="yj19_d">'
										+ '<input type="text" style="display:none;" id="yj20" name="yj20_d">'
										+ '<input type="text" style="display:none;" id="yj21" name="yj21_d">'
										+ '<input type="text" style="display:none;" id="yj22" name="yj22_d">'
										+ '<input type="text" style="display:none;" id="yj23" name="yj23_d">'
										+ '<input type="text" style="display:none;" id="yj24" name="yj24_d">'

										+ '<div class="ui-form-item"> <label class="ui-label mt10">计算月份：</label><input class="ui-input datepicker"'
										+ 'type="text" name="qdyf_dt" id="qdyf_dt" value=""  data-is="isAmount isEnough" autocomplete="off" disableautocomplete=""> <p class="ui-term-placeholder"></p> </div>'

										+ '<div class="ui-form-item"> <label class="ui-label mt10">开始确认月份：</label>'
										+ '<select style="width: 80px;" class="ui-input ui-input-mini" name="ksqrnf_i" id="ksqrnf_i">'
										+ '<option value="">年</option>'
										+ '<option value="2017">2017</option>'
										+ '<option value="2018">2018</option>'
										+ '</select>'
										+ '<select style="width: 50px;    margin-left: 10px;" class="ui-input ui-input-mini" name="ksqryf_i" id="ksqryf_i">'
										+ '<option value="">月</option>'
										+ '<option value="1">1</option>'
										+ '<option value="2">2</option>'
										+ '<option value="3">3</option>'
										+ '<option value="4">4</option>'
										+ '<option value="5">5</option>'
										+ '<option value="6">6</option>'
										+ '<option value="7">7</option>'
										+ '<option value="8">8</option>'
										+ '<option value="9">9</option>'
										+ '<option value="10">10</option>'
										+ '<option value="11">11</option>'
										+ '<option value="12">12</option>'
										+ '</select>'
										+ ' </div>'

										+ '<div class="ui-form-item"> <label class="ui-label mt10">上刊时间：</label><input class="ui-input datepicker"'
										+ 'type="text" name="sksh_dt" id="sksh_dt" value=""  data-is="isAmount isEnough" autocomplete="off" disableautocomplete=""> <p class="ui-term-placeholder"></p> </div>'

										+ '<div class="ui-form-item"> <label class="ui-label mt10">下刊时间：</label><input class="ui-input datepicker"'
										+ 'type="text" name="xksj_dt" id="xksj_dt" value=""  data-is="isAmount isEnough" autocomplete="off" disableautocomplete=""> <p class="ui-term-placeholder"></p> </div></div>'

										+ '<input class="ui-input"'
										+ 'type="hidden" name="sjkq_i" id="sjkq_i" value=""> '

										+ '<input class="ui-input"'
										+ 'type="hidden" name="seriaNum_s" id="seriaNum_s"> '

										+ '<input class="ui-input"'
										+ 'type="hidden" name="company_s" id="company_s"> '

										+ '<input class="ui-input"'
										+ 'type="hidden" name="dayPrice_d" id="dayPrice_d" value=""  data-is="isAmount isEnough">'

										+ '<div class="widthdrawBtBox">'
										+ '<input type="button" id="subutton" onclick="saveMsg(\''
										+ userId
										+ '\')" class="block-btn" value="确认" ></div>'
										+ '<input type="hidden" value="" name="lineId" id="db_id"></form>'
							});
					var v = '';
					$.each(data.content, function(i, item) {
						var w = "<option adid=" + item.id + " value="
								+ item.contractCode_s + ">"
								+ item.contractCode_s + "</option>";
						v += w;
					});
					if (v == '') {
						$("#contractCode_s")
								.html(
										'<option value="未生成合同" selected="selected">未生成合同</option>');
					} else {
						$("#contractCode_s").append(v);
					}

					var checkin = $('.datepicker').datepicker().on('click',
							function(ev) {
								$('.datepicker').css("z-index", "999999999");
							}).data('datepicker');
					getHy();
				}
			})

	$('#contractCode_s').change(
			function(event) {
				if ($(this).val() != "") {
					var adid = $(this).find("option:selected").attr("adid");
					$.ajax({
						url : 'http://' + changeAddr()
								+ '/report/findReportById/' + adid,
						type : "GET",
						data : {},
						async : false,
						dataType : "json",
						success : function(data) {
							$("#customer_s").val(data.customer_s);
							$("#adContent_s").val(data.adContent_s);
							$("#busNum_i").val(data.busNum_i);
							$("#term_i").val(data.term_i);
							$("#id").val(adid);
							$("#sjkq_i").val("");
							$("#seriaNum_s").val(data.seriaNum_s);
							$("#company_s").val(trim(data.company_s, ""));
							getMore(trim(data.seriaNum_s, 0));
						}
					});
				} else {
					$("input").val("");
					$('#hy_s').val("");
				}

			});

	$("#sksh_dt").change(function(event) {
		var sksh_dt = $('#sksh_dt').val();
		// DateTime dt = DateTime.ParseExact(sksh_dt, "yyyy-MM-dd", null);
		// Date date = new SimpleDateFormat("yyyy-MM-dd").parse(sksh_dt);
		sksh_dt = sksh_dt.replace(/[^\d]/g, '/');
		var date = new Date(sksh_dt);
		var term_i = parseInt($('#term_i').val());
		var ms = term_i * (1000 * 60 * 60 * 24) - 1;
		var newDate = new Date(date.getTime() + ms);
		newDate = $.format.date(newDate, "yyyy-MM-dd");
		$('#xksj_dt').val(newDate);
	})
}

function getMore(seriaNum) {
	$.ajax({
		url : 'http://' + changeAddr() + '/report/getReportRole/' + seriaNum,
		type : 'GET',
		async : false,
		dataType : 'json',
		success : function(data) {
			$("#kcf_d").val(trim(data.d_Map.zhkcf_d, 0));
			$("#hj_d").val(trim(data.d_Map.hj_d, 0));
			$("#zzf_d").val(trim(data.d_Map.zzf_d, 0));
			$("#jgfa_s").val(trim(data.s_Map.jgfa_s, "2017"));
			var fatherQrje_d = data.d_Map.fatherQrje_d;
			// 补录
			if (typeof (data.dt_Map) != "undefined") {
				var sksh = trim(data.dt_Map.sksh_dt, "");
				if (sksh != "") {
					sksh = $.format.date(sksh, "yyyy-MM-dd");
				}
				var xksj = trim(data.dt_Map.xksj_dt, "");
				if (xksj != "") {
					xksj = $.format.date(xksj, "yyyy-MM-dd");
				}
				var yjsksj = trim(data.dt_Map.yjsksj_dt, "");
				if (yjsksj != "") {
					yjsksj = $.format.date(yjsksj, "yyyy-MM-dd");
				}
				var qdyf = trim(data.dt_Map.qdyf_dt, "");
				if (qdyf != "") {
					qdyf = $.format.date(qdyf, "yyyy-MM-dd");
				}
				$("#qdyf_dt").val(qdyf);
				$("#sksh_dt").val(sksh);
				$("#xksj_dt").val(xksj);
				$("#yjsksj_dt").val(yjsksj);
			}
			if (typeof (data.s_Map) != "undefined") {
				$("#hy_s").val(trim(data.s_Map.hy_s, ""));
			}
		}
	})
}

function trim(a, d) {
	return typeof (a) == "undefined" ? d : a;
}

var dayPrice_r = ""; // 日价，不取整计算确认数用
function getTime2Time() {
	var timex = ""
	var time1 = $('#sksh_dt').val();
	var time2 = $('#xksj_dt').val();
	var dayPrice_d = ""; // 日价，取两位小数，显示使用
	if (time1 != "" && time2 != "") {
		time1 = Date.parse(time1) / 1000;
		time2 = Date.parse(time2) / 1000;
		var time_ = time2 - time1;
		timex = (time_ / (3600 * 24) + 1);
		$('#sjkq_i').val(timex);
		if ($('#company_s').val() == "ZY") {
			dayPrice_d = ($('#qrje_d').val() / timex).toFixed(2);
			dayPrice_r = $('#qrje_d').val() / timex;
		} else {
			dayPrice_d = ($('#qrje_d').val() / timex).toFixed(2);
			dayPrice_r = $('#qrje_d').val() / timex;
		}
		$('#dayPrice_d').val(dayPrice_d);
	}

}

function saveMsg(userId) {
	var seriam = $("#seriaNum_s").val();
	if (!$("#reportMsg").validationEngine('validateBeforeSubmit'))
		return;
	if ($('#contractCode_s').val() == "") {
		layer.msg('请选择合同');
		return;
	}

	if ($('#ksqryf_i').val() != "" && $('#sksh_dt').val() != ""
			&& $('#xksj_dt').val() != "") {
		getTime2Time();
		var qryf = $.format.date($('#sksh_dt').val(), "MM");
		qryf = parseInt(qryf.slice(5, 7));
		if (qryf > $('#ksqryf_i').val()) {
			layer.msg("上刊月份必须小于/等于确认月份");
			return;
		}
		if ($('#sjkq_i').val() < 0) {
			layer.msg("下刊时间不能早于上刊时间");
			return;
		}
		getMonthPrice();
	}
	countQrje(seriam, userId);

	$('#reportMsg').ajaxForm(function(data) {
		if (data.status == 200) {
			document.getElementById('subutton').setAttribute('disabled', true);
			$("#subutton").css("background-color", "#85A2AD");
			layer.msg("保存成功");
			var uptime = window.setTimeout(function() {
				$("#cc").trigger("click");
				clearTimeout(uptime);
			}, 2000)
		} else {
			layer.msg("保存失败");
		}
	}).submit();

}
function saveMsgManual(userId) {
	var seriam = $("#seriaNum_s").val();
	if (!$("#reportMsg").validationEngine('validateBeforeSubmit'))
		return;
	if ($('#contractCode_s').val() == "") {
		layer.msg('请选择合同');
		console.log(data);
		return;
	}
	getTime2Time();
	var qryf = $.format.date($('#sksh_dt').val(), "MM");
	qryf = parseInt(qryf.slice(5, 7));
	if (qryf > $('#ksqryf_i').val()) {
		layer.msg("上刊月份必须小于/等于确认月份");
		return;
	}
	if ($('#sjkq_i').val() < 0) {
		layer.msg("下刊时间不能早于上刊时间");
		return;
	}

	// countQrje(seriam,userId);
	// getMonthPrice();
	$('#reportMsg').ajaxForm(function(data) {
		if (data.status == 200) {
			document.getElementById('subutton').setAttribute('disabled', true);
			$("#subutton").css("background-color", "#85A2AD");
			layer.msg("保存成功");
			var uptime = window.setTimeout(function() {
				$("#cc").trigger("click");
				clearTimeout(uptime);
			}, 2000)
		} else {
			layer.msg("保存失败");
		}
	}).submit();

}

function countQrje(seriam, userId) {
	var qrje_d = $("#qrje_d").val();
	var contractSize_s = $("#contractSize_s").val();
	var id;
	$
			.ajax({
				url : 'http://'
						+ changeAddr()
						+ '/report/getModelList?filter[className]=Contract_in&start=0&length=20&filter[seriaNum_s_s]='
						+ seriam + '&filter[fatherCtrct_s_s]=1&filter[userId]='
						+ userId,
				type : 'GET',
				async : false,
				dataType : 'json',
				success : function(data) {
					$
							.each(
									data.content,
									function(index, item) {
										item.d_Map.qrje_d -= parseFloat(qrje_d);
										item.qrje_d = item.d_Map.qrje_d;
										id = item.id;
										$
												.ajax({
													url : 'http://'
															+ changeAddr()
															+ '/common/saveModel?selectByField=id&className=Contract_in&id='
															+ id
															+ '&fatherCtrct_s=1',
													type : 'POST',
													async : false,
													data : {
														"qrje_d" : item.qrje_d
													},
													success : function(data) {
													}
												})

									});

				}
			})

	$
			.ajax({
				url : 'http://'
						+ changeAddr()
						+ '/report/getModelList?filter[className]=Contract_in&start=0&length=20&filter[seriaNum_s_s]='
						+ seriam + '&filter[userId]=' + userId,
				type : 'GET',
				async : false,
				dataType : 'json',
				success : function(data) {
					$
							.each(
									data.content,
									function(index, item) {
										item.contractSize_s = contractSize_s;
										id = item.id;
										$
												.ajax({
													url : 'http://'
															+ changeAddr()
															+ '/common/saveModel?selectByField=id&className=Contract_in&id='
															+ id + '',
													type : 'POST',
													async : false,
													data : {
														"contractSize_s" : item.contractSize_s
													},
													success : function(data) {
													}
												})

									});

				}
			})
}

function getDays($time1, $time2) {
	var time1 = arguments[0], time2 = arguments[1];
	time1 = Date.parse(time1) / 1000;
	time2 = Date.parse(time2) / 1000;
	var time_ = time1 - time2;
	return (time_ / (3600 * 24) + 1);
}

function getMonthPrice() {
	var mydata = new Array()
	mydata[0] = 25;
	mydata[1] = 31;
	mydata[2] = 28;
	mydata[3] = 31;
	mydata[4] = 30;
	mydata[5] = 31;
	mydata[6] = 30;
	mydata[7] = 31;
	mydata[8] = 31;
	mydata[9] = 30;
	mydata[10] = 31;
	mydata[11] = 36;
	mydata[12] = 25;
	mydata[13] = 31;
	mydata[14] = 28;
	mydata[15] = 31;
	mydata[16] = 30;
	mydata[17] = 31;
	mydata[18] = 30;
	mydata[19] = 31;
	mydata[20] = 31;
	mydata[21] = 30;
	mydata[22] = 31;
	mydata[23] = 36;

	var mydata1 = new Array()
	mydata1[0] = "2017-01-25";
	mydata1[1] = "2017-02-25";
	mydata1[2] = "2017-03-25";
	mydata1[3] = "2017-04-25";
	mydata1[4] = "2017-05-25";
	mydata1[5] = "2017-06-25";
	mydata1[6] = "2017-07-25";
	mydata1[7] = "2017-08-25";
	mydata1[8] = "2017-09-25";
	mydata1[9] = "2017-10-25";
	mydata1[10] = "2017-11-25";
	mydata1[11] = "2017-12-31";

	mydata1[12] = "2018-01-25";
	mydata1[13] = "2018-02-25";
	mydata1[14] = "2018-03-25";
	mydata1[15] = "2018-04-25";
	mydata1[16] = "2018-05-25";
	mydata1[17] = "2018-06-25";
	mydata1[18] = "2018-07-25";
	mydata1[19] = "2018-08-25";
	mydata1[20] = "2018-09-25";
	mydata1[21] = "2018-10-25";
	mydata1[22] = "2018-11-25";
	mydata1[23] = "2018-12-31";

	var sksh_dt = $('#sksh_dt').val();

	// 计算总天数
	var total = parseInt($('#sjkq_i').val());
	var begin = "";
	if ($('#ksqrnf_i').val() == "2018") {
		begin = parseInt($('#ksqryf_i').val()) + 12;
	} else {
		begin = parseInt($('#ksqryf_i').val());
	}
	var left;
	var monthPrice = 0;

	// 计算第一个月天数
	// yue_total=$('#sjkq_i').val();
	// 下刊日期
	var xksj_dt = $("#xksj_dt").val();

	var mydate = getDays(mydata1[begin - 1], xksj_dt);
	if (mydate <= 0) {
		yue_total = getDays(mydata1[begin - 1], sksh_dt);
		left = total - yue_total;
		console.log(left);
	} else {
		yue_total = getDays(xksj_dt, sksh_dt);
		left = total - yue_total;
		console.log(left);
	}

	var dayPrice = dayPrice_r;

	// 最后一个月的确认金额，用总价减掉前几个月的金额，避免由于四舍五入导致误差。
	var TotalPrice = $('#qrje_d').val();
	console.log(TotalPrice);
	var i;
	for (i = 1; i < 25; i++) {
		$('#yf' + i).val(0);
		$('#yj' + i).val(0);
	}

	$('#yf' + begin).val(yue_total);
	monthPrice = (parseInt(yue_total) * parseFloat(dayPrice)).toFixed(2);
	$('#yj' + begin).val(monthPrice);
	TotalPrice -= monthPrice;

	//上下刊间隔一月
	if (left >= 0) {
		while (left >= mydata[begin - 1]) {
			begin++;
			yue_total = mydata[begin - 1];
			left -= yue_total;

			monthPrice = (parseInt(yue_total) * parseFloat(dayPrice))
					.toFixed(2);
			TotalPrice -= monthPrice;

			$('#yf' + begin).val(yue_total);
			$('#yj' + begin).val(monthPrice);

		}

		begin++;
		yue_total = left;
		$('#yf' + begin).val(yue_total);
		$('#yj' + begin).val((yue_total * dayPrice).toFixed(2));
		// 重置最后一个月的金额;
		$('#yj' + begin).val(TotalPrice.toFixed(2));

	} else {
		//
		$('#yj' + begin).val(TotalPrice);
	}
}

function editReport(userId, id) {
	$
			.ajax({
				url : 'http://' + changeAddr()
						+ '/common/queryById?className=Contract_in&id=' + id,
				type : "GET",
				data : {},
				success : function(data) {
					var yjsksj_dt = "";
					var sksh_dt = "";
					var xksj_dt = "";
					var qdyf_dt = "";
					var hj_d = "";
					var zzf_d = "";
					var qrje_d = "";
					var kcf_d = "";
					if (typeof (data.dt_Map) != "undefined") {
						yjsksj_dt = data.dt_Map.yjsksj_dt;
						sksh_dt = data.dt_Map.sksh_dt;
						xksj_dt = data.dt_Map.xksj_dt;
						qdyf_dt = data.dt_Map.qdyf_dt;
					}
					if (typeof (data.d_Map) != "undefined") {
						hj_d = data.d_Map.hj_d;
						zzf_d = data.d_Map.zzf_d;
						qrje_d = data.d_Map.qrje_d;
						kcf_d = data.d_Map.kcf_d;
					}
					layer
							.open({
								type : 1,
								title : "收入确认修改",
								skin : 'layui-layer-rim',
								area : [ '970px', '600px' ],
								content : ''
										+ '<form id="reportMsg" method="post" action='
										+ 'http://'
										+ changeAddr()
										+ '/common/saveModel?selectByField=id&id='
										+ id
										+ '>'
										+ '<input type="hidden" name="className" value="Contract_in"/>'
										+ '<input class="ui-input"'
										+ 'type="hidden" name="id" id="id" value="'
										+ id
										+ '">'
										+ '<div class="inputs" style="margin-top: 40px;float:left;">'
										+ '<input type="hidden" id ="cc" class="layui-layer-ico layui-layer-close layui-layer-close1"/> '
										+ '<div class="ui-form-item"> <label class="ui-label mt10"><span class="ui-form-required">* </span>合同编号： </label>'
										+ '<input type="text" value="'
										+ data.s_Map.contractCode_s
										+ '" class="ui-input ui-input-mini" readonly="readonly" name="contractCode_s" id="contractCode_s">'
										+ ' </div>'

										+ '<div class="ui-form-item"> <label class="ui-label mt10">客户名称：</label><input class="ui-input"'
										+ 'type="text" name="customer_s" id="customer_s" value="'
										+ trim(data.s_Map.customer_s, "")
										+ '"  data-is="isAmount isEnough" autocomplete="off" disableautocomplete=""> <p class="ui-term-placeholder"></p> </div>'

										+ '<div class="ui-form-item"> <label class="ui-label mt10">广告内容：</label><input class="ui-input"'
										+ 'type="text" name="adContent_s" id="adContent_s" value="'
										+ trim(data.s_Map.adContent_s, "")
										+ '"  data-is="isAmount isEnough" autocomplete="off" disableautocomplete=""> <p class="ui-term-placeholder"></p> </div>'

										+ '<div class="ui-form-item"> <label class="ui-label mt10">总合同额：</label><input class="ui-input"'
										+ 'type="text" name="hj_d" id="hj_d" value="'
										+ hj_d
										+ '"  data-is="isAmount isEnough" autocomplete="off" disableautocomplete=""> <p class="ui-term-placeholder"></p> </div>'

										+ '<div class="ui-form-item"> <label class="ui-label mt10">确认金额：</label><input class="ui-input"'
										+ 'type="text" name="qrje_d" id="qrje_d" value="'
										+ qrje_d
										+ '"  data-is="isAmount isEnough" autocomplete="off" disableautocomplete=""> <p class="ui-term-placeholder"></p> </div>'

										+ '<div class="ui-form-item"> <label class="ui-label mt10">刊出费：</label><input class="ui-input"'
										+ 'type="text" name="kcf_d" id="kcf_d" value="'
										+ kcf_d
										+ '"  data-is="isAmount isEnough" autocomplete="off" disableautocomplete=""> <p class="ui-term-placeholder"></p> </div>'

										+ '<div class="ui-form-item"> <label class="ui-label mt10">制作费：</label><input class="ui-input"'
										+ 'type="text" name="zzf_d" id="zzf_d" value="'
										+ zzf_d
										+ '"  data-is="isAmount isEnough" autocomplete="off" disableautocomplete=""> <p class="ui-term-placeholder"></p> </div>'

										+ '<div class="ui-form-item"> <label class="ui-label mt10">媒体类别：</label><input class="ui-input"'
										+ 'type="text" name="mediaType_s" id="mediaType_s" value="'
										+ trim(data.s_Map.mediaType_s, "")
										+ '"  data-is="isAmount isEnough" autocomplete="off" disableautocomplete=""> <p class="ui-term-placeholder"></p> </div>'

										+ '<div class="ui-form-item"> <label class="ui-label mt10">刊期：</label><input class="ui-input"'
										+ 'type="text" name="term_i" id="term_i" value="'
										+ trim(data.i_Map.term_i, "")
										+ '"  data-is="isAmount isEnough" autocomplete="off" disableautocomplete=""> <p class="ui-term-placeholder"></p> </div>'

										+ '<div class="ui-form-item"> <label class="ui-label mt10">数量：</label><input class="ui-input"'
										+ 'type="text" name="busNum_i" id="busNum_i" value="'
										+ trim(data.i_Map.busNum_i, "")
										+ '"  data-is="isAmount isEnough" autocomplete="off" disableautocomplete=""> <p class="ui-term-placeholder"></p> </div></div>'

										+ '<div class="inputs" style="margin-top: 40px;margin-right: 80px;float:right;">'

										+ '<div class="ui-form-item"> <label class="ui-label mt10">预计发布时间：</label><input class="ui-input datepicker"'
										+ 'type="text" name="yjsksj_dt" id="yjsksj_dt" value="'
										+ $.format.date(yjsksj_dt, "yyyy-MM-dd")
										+ '"  data-is="isAmount isEnough" autocomplete="off" disableautocomplete=""> <p class="ui-term-placeholder"></p> </div>'

										+ '<div class="ui-form-item"> <label class="ui-label mt10">合同规模（万元）：</label>'
										+ '<p class="ui-term-placeholder"></p> '
										+ '<select class="ui-input ui-input-mini" name="contractSize_s" id="contractSize_s">'
										+ '<option value="'
										+ trim(data.s_Map.contractSize_s, "")
										+ '">'
										+ trim(data.s_Map.contractSize_s, "")
										+ '</option>'
										+ '<option value="0-10">0-10</option>'
										+ '<option value="10-50">10-50</option>'
										+ '<option value="50-100">50-100</option>'
										+ '<option value="100-300">100-300</option>'
										+ '<option value="300-600">300-600</option>'
										+ '<option value="600-1000">600-1000</option>'
										+ '<option value="1000以上">1000以上</option>'
										+ '</select>'
										+ '</div>'

										+ '<div class="ui-form-item"> <label class="ui-label mt10">价格方案：</label><input class="ui-input"'
										+ 'type="text" name="jgfa_s" id="jgfa_s" value="'
										+ trim(data.s_Map.jgfa_s, "")
										+ '"  data-is="isAmount isEnough" autocomplete="off" disableautocomplete=""> <p class="ui-term-placeholder"></p> </div>'

										+ '<div class="ui-form-item"> <label class="ui-label mt10">行业：</label>'
										+ '<select class="ui-input ui-input-mini" name="hy_s" id="hy_s">'
										+ '<option value="'
										+ trim(data.s_Map.hy_s, "")
										+ '">'
										+ trim(data.s_Map.hy_s, "")
										+ '</option>'
										+ '</select>'
										+ ' </div>'

										+ '<input type="hidden" value="'
										+ data.i_Map.yf1_i
										+ '" id="yf1" name="yf1_i">'
										+ '<input type="hidden" value="'
										+ data.i_Map.yf2_i
										+ '" id="yf2" name="yf2_i">'
										+ '<input type="hidden" value="'
										+ data.i_Map.yf3_i
										+ '" id="yf3" name="yf3_i">'
										+ '<input type="hidden" value="'
										+ data.i_Map.yf4_i
										+ '" id="yf4" name="yf4_i">'
										+ '<input type="hidden" value="'
										+ data.i_Map.yf5_i
										+ '" id="yf5" name="yf5_i">'
										+ '<input type="hidden" value="'
										+ data.i_Map.yf6_i
										+ '" id="yf6" name="yf6_i">'
										+ '<input type="hidden" value="'
										+ data.i_Map.yf7_i
										+ '" id="yf7" name="yf7_i">'
										+ '<input type="hidden" value="'
										+ data.i_Map.yf8_i
										+ '" id="yf8" name="yf8_i">'
										+ '<input type="hidden" value="'
										+ data.i_Map.yf9_i
										+ '" id="yf9" name="yf9_i">'
										+ '<input type="hidden" value="'
										+ data.i_Map.yf10_i
										+ '" id="yf10" name="yf10_i">'
										+ '<input type="hidden" value="'
										+ data.i_Map.yf11_i
										+ '" id="yf11" name="yf11_i">'
										+ '<input type="hidden" value="'
										+ data.i_Map.yf12_i
										+ '" id="yf12" name="yf12_i">'
										+ '<input type="hidden" value="'
										+ data.i_Map.yf13_i
										+ '" id="yf13" name="yf13_i">'
										+ '<input type="hidden" value="'
										+ data.i_Map.yf14_i
										+ '" id="yf14" name="yf14_i">'
										+ '<input type="hidden" value="'
										+ data.i_Map.yf15_i
										+ '" id="yf15" name="yf15_i">'
										+ '<input type="hidden" value="'
										+ data.i_Map.yf16_i
										+ '" id="yf16" name="yf16_i">'
										+ '<input type="hidden" value="'
										+ data.i_Map.yf17_i
										+ '" id="yf17" name="yf17_i">'
										+ '<input type="hidden" value="'
										+ data.i_Map.yf18_i
										+ '" id="yf18" name="yf18_i">'
										+ '<input type="hidden" value="'
										+ data.i_Map.yf19_i
										+ '" id="yf19" name="yf19_i">'
										+ '<input type="hidden" value="'
										+ data.i_Map.yf20_i
										+ '" id="yf20" name="yf20_i">'
										+ '<input type="hidden" value="'
										+ data.i_Map.yf21_i
										+ '" id="yf21" name="yf21_i">'
										+ '<input type="hidden" value="'
										+ data.i_Map.yf22_i
										+ '" id="yf22" name="yf22_i">'
										+ '<input type="hidden" value="'
										+ data.i_Map.yf23_i
										+ '" id="yf23" name="yf23_i">'
										+ '<input type="hidden" value="'
										+ data.i_Map.yf24_i
										+ '" id="yf24" name="yf24_i">'

										+ '<input type="hidden" value="'
										+ data.d_Map.yj1_d
										+ '" id="yj1" name="yj1_d">'
										+ '<input type="hidden" value="'
										+ data.d_Map.yj2_d
										+ '" id="yj2" name="yj2_d">'
										+ '<input type="hidden" value="'
										+ data.d_Map.yj3_d
										+ '" id="yj3" name="yj3_d">'
										+ '<input type="hidden" value="'
										+ data.d_Map.yj4_d
										+ '" id="yj4" name="yj4_d">'
										+ '<input type="hidden" value="'
										+ data.d_Map.yj5_d
										+ '" id="yj5" name="yj5_d">'
										+ '<input type="hidden" value="'
										+ data.d_Map.yj6_d
										+ '" id="yj6" name="yj6_d">'
										+ '<input type="hidden" value="'
										+ data.d_Map.yj7_d
										+ '" id="yj7" name="yj7_d">'
										+ '<input type="hidden" value="'
										+ data.d_Map.yj8_d
										+ '" id="yj8" name="yj8_d">'
										+ '<input type="hidden" value="'
										+ data.d_Map.yj9_d
										+ '" id="yj9" name="yj9_d">'
										+ '<input type="hidden" value="'
										+ data.d_Map.yj10_d
										+ '" id="yj10" name="yj10_d">'
										+ '<input type="hidden" value="'
										+ data.d_Map.yj11_d
										+ '" id="yj11" name="yj11_d">'
										+ '<input type="hidden" value="'
										+ data.d_Map.yj12_d
										+ '" id="yj12" name="yj12_d">'
										+ '<input type="hidden" value="'
										+ data.d_Map.yj13_d
										+ '" id="yj13" name="yj13_d">'
										+ '<input type="hidden" value="'
										+ data.d_Map.yj14_d
										+ '" id="yj14" name="yj14_d">'
										+ '<input type="hidden" value="'
										+ data.d_Map.yj15_d
										+ '" id="yj15" name="yj15_d">'
										+ '<input type="hidden" value="'
										+ data.d_Map.yj16_d
										+ '" id="yj16" name="yj16_d">'
										+ '<input type="hidden" value="'
										+ data.d_Map.yj17_d
										+ '" id="yj17" name="yj17_d">'
										+ '<input type="hidden" value="'
										+ data.d_Map.yj18_d
										+ '" id="yj18" name="yj18_d">'
										+ '<input type="hidden" value="'
										+ data.d_Map.yj19_d
										+ '" id="yj19" name="yj19_d">'
										+ '<input type="hidden" value="'
										+ data.d_Map.yj20_d
										+ '" id="yj20" name="yj20_d">'
										+ '<input type="hidden" value="'
										+ data.d_Map.yj21_d
										+ '" id="yj21" name="yj21_d">'
										+ '<input type="hidden" value="'
										+ data.d_Map.yj22_d
										+ '" id="yj22" name="yj22_d">'
										+ '<input type="hidden" value="'
										+ data.d_Map.yj23_d
										+ '" id="yj23" name="yj23_d">'
										+ '<input type="hidden" value="'
										+ data.d_Map.yj24_d
										+ '" id="yj24" name="yj24_d">'

										+ '<div class="ui-form-item"> <label class="ui-label mt10">计算月份：</label><input class="ui-input datepicker"'
										+ 'type="text" name="qdyf_dt" id="qdyf_dt" value="'
										+ $.format.date(qdyf_dt, "yyyy-MM-dd")
										+ '"  data-is="isAmount isEnough" autocomplete="off" disableautocomplete=""> <p class="ui-term-placeholder"></p> </div>'

										+ '<div class="ui-form-item"> <label class="ui-label mt10">开始确认月份：</label>'
										+ '<select style="width: 80px;" class="ui-input ui-input-mini" name="ksqrnf_i" id="ksqrnf_i">'
										+ '<option selected="selected" value="'
										+ trim(data.i_Map.ksqrnf_i, "")
										+ '">'
										+ trim(data.i_Map.ksqrnf_i, "")
										+ '</option>'
										+ '<option value="2017">2017</option>'
										+ '<option value="2018">2018</option>'
										+ '</select>'
										+ '<select style="width: 50px;    margin-left: 10px;" class="ui-input ui-input-mini" name="ksqryf_i" id="ksqryf_i">'
										+ '<option selected="selected" value="'
										+ trim(data.i_Map.ksqryf_i, "")
										+ '">'
										+ trim(data.i_Map.ksqryf_i, "")
										+ '</option>'
										+ '<option value="1">1</option>'
										+ '<option value="2">2</option>'
										+ '<option value="3">3</option>'
										+ '<option value="4">4</option>'
										+ '<option value="5">5</option>'
										+ '<option value="6">6</option>'
										+ '<option value="7">7</option>'
										+ '<option value="8">8</option>'
										+ '<option value="9">9</option>'
										+ '<option value="10">10</option>'
										+ '<option value="11">11</option>'
										+ '<option value="12">12</option>'
										+ '</select>'
										+ '</div>'

										+ '<div class="ui-form-item"> <label class="ui-label mt10">上刊时间：</label><input class="ui-input datepicker"'
										+ 'type="text" name="sksh_dt" id="sksh_dt" value="'
										+ $.format.date(sksh_dt, "yyyy-MM-dd")
										+ '"  data-is="isAmount isEnough" autocomplete="off" disableautocomplete=""> <p class="ui-term-placeholder"></p> </div>'

										+ '<div class="ui-form-item"> <label class="ui-label mt10">下刊时间：</label><input class="ui-input datepicker"'
										+ 'type="text" name="xksj_dt" id="xksj_dt" value="'
										+ $.format.date(xksj_dt, "yyyy-MM-dd")
										+ '"  data-is="isAmount isEnough" autocomplete="off" disableautocomplete=""> <p class="ui-term-placeholder"></p> </div></div>'

										+ '<input class="ui-input"'
										+ 'type="hidden" name="sjkq_i" id="sjkq_i" value="'
										+ trim(data.i_Map.sjkq_i, "")
										+ '"> '

										+ '<input class="ui-input"'
										+ 'type="hidden" name="seriaNum_s" id="seriaNum_s" value="'
										+ trim(data.s_Map.seriaNum_s, "")
										+ '"> '

										+ '<input class="ui-input"'
										+ 'type="hidden" name="company_s" id="company_s" value="'
										+ trim(data.s_Map.company_s, "")
										+ '"> '

										+ '<input class="ui-input"'
										+ 'type="hidden" name="dayPrice_d" id="dayPrice_d" value="'
										+ trim(data.d_Map.dayPrice_d, "")
										+ '"  data-is="isAmount isEnough">'

										+ '<div class="widthdrawBtBox">'
										+ '<input type="button" id="subutton" onclick="saveMsg(\''
										+ userId
										+ '\')" class="block-btn" value="确认" ></div>'
										+ '<input type="hidden" value="" name="lineId" id="db_id"></form>'
							});
					var checkin = $('.datepicker').datepicker().on('click',
							function(ev) {
								$('.datepicker').css("z-index", "999999999");
							}).data('datepicker');
					getHy();

					$("#sksh_dt").change(function(event) {
						var sksh_dt = $('#sksh_dt').val();
						console.log(sksh_dt);
						// DateTime dt = DateTime.ParseExact(sksh_dt,
						// "yyyy-MM-dd", null);
						// Date date = new
						// SimpleDateFormat("yyyy-MM-dd").parse(sksh_dt);
						sksh_dt = sksh_dt.replace(/[^\d]/g, '/');
						var date = new Date(sksh_dt);
						var term_i = parseInt($('#term_i').val());
						var ms = term_i * (1000 * 60 * 60 * 24) - 1;
						var newDate = new Date(date.getTime() + ms);
						newDate = $.format.date(newDate, "yyyy-MM-dd");
						$('#xksj_dt').val(newDate);
					})
				}
			});
}

// 手工调整收入确认表
function editReportManual(userId, id) {
	$
			.ajax({
				url : 'http://' + changeAddr()
						+ '/common/queryById?className=Contract_in&id=' + id,
				type : "GET",
				data : {},
				success : function(data) {
					var yjsksj_dt = "";
					var sksh_dt = "";
					var xksj_dt = "";
					var qdyf_dt = "";
					var hj_d = "";
					var zzf_d = "";
					var qrje_d = "";
					var kcf_d = "";
					if (typeof (data.dt_Map) != "undefined") {
						yjsksj_dt = data.dt_Map.yjsksj_dt;
						sksh_dt = data.dt_Map.sksh_dt;
						xksj_dt = data.dt_Map.xksj_dt;
						qdyf_dt = data.dt_Map.qdyf_dt;
					}
					if (typeof (data.d_Map) != "undefined") {
						hj_d = data.d_Map.hj_d;
						zzf_d = data.d_Map.zzf_d;
						qrje_d = data.d_Map.qrje_d;
						kcf_d = data.d_Map.kcf_d;
					}
					layer.open({
								type : 1,
								title : "收入确认手工调整[可以手工修改任何月份的天数和金额，系统不再自动计算]",
								skin : 'layui-layer-rim',
								area : [ '1200px', '600px' ],
								content : ''
										+ '<form id="reportMsg" method="post" action='
										+ 'http://'
										+ changeAddr()
										+ '/common/saveModel?selectByField=id&id='
										+ id
										+ '>'
										+ '<input type="hidden" id ="cc" class="layui-layer-ico layui-layer-close layui-layer-close1"/>'
										+ '<input type="hidden" name="className" value="Contract_in"/>'
										+ '<input class="ui-input"'
										+ 'type="hidden" name="id" id="id" value="'
										+ id
										+ '">'
										+ '<div class="inputs" style="margin-top: 40px;float:left;">'
										+ '<div class="ui-form-item"> <label class="ui-label mt10"><span class="ui-form-required">* </span>合同编号： </label>'
										+ '<input type="text" value="'
										+ data.s_Map.contractCode_s
										+ '" class="ui-input ui-input-mini" readonly="readonly" name="contractCode_s" id="contractCode_s">'
										+ ' </div>'

										+ '<div class="ui-form-item"> <label class="ui-label mt10">客户名称：</label><input class="ui-input"'
										+ 'type="text" name="customer_s" id="customer_s" value="'
										+ trim(data.s_Map.customer_s, "")
										+ '"  data-is="isAmount isEnough" autocomplete="off" disableautocomplete=""> <p class="ui-term-placeholder"></p> </div>'

										+ '<div class="ui-form-item"> <label class="ui-label mt10">广告内容：</label><input class="ui-input"'
										+ 'type="text" name="adContent_s" id="adContent_s" value="'
										+ trim(data.s_Map.adContent_s, "")
										+ '"  data-is="isAmount isEnough" autocomplete="off" disableautocomplete=""> <p class="ui-term-placeholder"></p> </div>'

										+ '<div class="ui-form-item"> <label class="ui-label mt10">总合同额：</label><input class="ui-input"'
										+ 'type="text" name="hj_d" id="hj_d" value="'
										+ hj_d
										+ '"  data-is="isAmount isEnough" autocomplete="off" disableautocomplete=""> <p class="ui-term-placeholder"></p> </div>'

										+ '<div class="ui-form-item"> <label class="ui-label mt10">确认金额：</label><input class="ui-input"'
										+ 'type="text" name="qrje_d" id="qrje_d" value="'
										+ qrje_d
										+ '"  data-is="isAmount isEnough" autocomplete="off" disableautocomplete=""> <p class="ui-term-placeholder"></p> </div>'

										+ '<div class="ui-form-item"> <label class="ui-label mt10">刊出费：</label><input class="ui-input"'
										+ 'type="text" name="kcf_d" id="kcf_d" value="'
										+ kcf_d
										+ '"  data-is="isAmount isEnough" autocomplete="off" disableautocomplete=""> <p class="ui-term-placeholder"></p> </div>'

										+ '<div class="ui-form-item"> <label class="ui-label mt10">制作费：</label><input class="ui-input"'
										+ 'type="text" name="zzf_d" id="zzf_d" value="'
										+ zzf_d
										+ '"  data-is="isAmount isEnough" autocomplete="off" disableautocomplete=""> <p class="ui-term-placeholder"></p> </div>'

										+ '<div class="ui-form-item"> <label class="ui-label mt10">刊期：</label><input class="ui-input"'
										+ 'type="text" name="term_i" id="term_i" value="'
										+ trim(data.i_Map.term_i, "")
										+ '"  data-is="isAmount isEnough" autocomplete="off" disableautocomplete=""> <p class="ui-term-placeholder"></p> </div>'

										+ '<div class="ui-form-item"> <label class="ui-label mt10">数量：</label><input class="ui-input"'
										+ 'type="text" name="busNum_i" id="busNum_i" value="'
										+ trim(data.i_Map.busNum_i, "")
										+ '"  data-is="isAmount isEnough" autocomplete="off" disableautocomplete=""> <p class="ui-term-placeholder"></p> </div></div>'

										+ '<div class="inputs" style="margin-top: 40px;float:left;">'

										+ '<div class="ui-form-item"> <label class="ui-label mt10">预计发布时间：</label><input class="ui-input datepicker"'
										+ 'type="text" name="yjsksj_dt" id="yjsksj_dt" value="'
										+ $.format
												.date(yjsksj_dt, "yyyy-MM-dd")
										+ '"  data-is="isAmount isEnough" autocomplete="off" disableautocomplete=""> <p class="ui-term-placeholder"></p> </div>'

										+ '<div class="ui-form-item"> <label class="ui-label mt10">媒体类别：</label><input class="ui-input"'
										+ 'type="text" name="mediaType_s" id="mediaType_s" value="'
										+ trim(data.s_Map.mediaType_s, "")
										+ '"  data-is="isAmount isEnough" autocomplete="off" disableautocomplete=""> <p class="ui-term-placeholder"></p> </div>'

										+ '<div class="ui-form-item"> <label class="ui-label mt10">合同规模（万元）：</label>'
										+ '<p class="ui-term-placeholder"></p> '
										+ '<select class="ui-input ui-input-mini" name="contractSize_s" id="contractSize_s">'
										+ '<option value="'
										+ trim(data.s_Map.contractSize_s, "")
										+ '">'
										+ trim(data.s_Map.contractSize_s, "")
										+ '</option>'
										+ '<option value="0-10">0-10</option>'
										+ '<option value="10-50">10-50</option>'
										+ '<option value="50-100">50-100</option>'
										+ '<option value="100-300">100-300</option>'
										+ '<option value="300-600">300-600</option>'
										+ '<option value="600-1000">600-1000</option>'
										+ '<option value="1000以上">1000以上</option>'
										+ '</select>'
										+ '</div>'

										+ '<div class="ui-form-item"> <label class="ui-label mt10">价格方案：</label><input class="ui-input"'
										+ 'type="text" name="jgfa_s" id="jgfa_s" value="'
										+ trim(data.s_Map.jgfa_s, "")
										+ '"  data-is="isAmount isEnough" autocomplete="off" disableautocomplete=""> <p class="ui-term-placeholder"></p> </div>'

										+ '<div class="ui-form-item"> <label class="ui-label mt10">行业：</label>'
										+ '<select class="ui-input ui-input-mini" name="hy_s" id="hy_s">'
										+ '<option value="'
										+ trim(data.s_Map.hy_s, "")
										+ '">'
										+ trim(data.s_Map.hy_s, "")
										+ '</option>'
										+ '</select>'
										+ ' </div>'

										+ '<div class="ui-form-item"> <label class="ui-label mt10">计算月份：</label><input class="ui-input datepicker"'
										+ 'type="text" name="qdyf_dt" id="qdyf_dt" value="'
										+ $.format.date(qdyf_dt, "yyyy-MM-dd")
										+ '"  data-is="isAmount isEnough" autocomplete="off" disableautocomplete=""> <p class="ui-term-placeholder"></p> </div>'

										+ '<div class="ui-form-item"> <label class="ui-label mt10">开始确认月份：</label>'
										+ '<select style="width: 80px;" class="ui-input ui-input-mini" name="ksqrnf_i" id="ksqrnf_i">'
										+ '<option selected="selected" value="'
										+ trim(data.i_Map.ksqrnf_i, "")
										+ '">'
										+ trim(data.i_Map.ksqrnf_i, "")
										+ '</option>'
										+ '<option value="2017">2017</option>'
										+ '<option value="2018">2018</option>'
										+ '</select>'
										+ '<select style="width: 50px;    margin-left: 10px;" class="ui-input ui-input-mini" name="ksqryf_i" id="ksqryf_i">'
										+ '<option selected="selected" value="'
										+ trim(data.i_Map.ksqryf_i, "")
										+ '">'
										+ trim(data.i_Map.ksqryf_i, "")
										+ '</option>'
										+ '<option value="1">1</option>'
										+ '<option value="2">2</option>'
										+ '<option value="3">3</option>'
										+ '<option value="4">4</option>'
										+ '<option value="5">5</option>'
										+ '<option value="6">6</option>'
										+ '<option value="7">7</option>'
										+ '<option value="8">8</option>'
										+ '<option value="9">9</option>'
										+ '<option value="10">10</option>'
										+ '<option value="11">11</option>'
										+ '<option value="12">12</option>'
										+ '</select>'
										+ '</div>'

										+ '<div class="ui-form-item"> <label class="ui-label mt10">上刊时间：</label><input class="ui-input datepicker"'
										+ 'type="text" name="sksh_dt" id="sksh_dt" value="'
										+ $.format.date(sksh_dt, "yyyy-MM-dd")
										+ '"  data-is="isAmount isEnough" autocomplete="off" disableautocomplete=""> <p class="ui-term-placeholder"></p> </div>'

										+ '<div class="ui-form-item"> <label class="ui-label mt10">下刊时间：</label><input class="ui-input datepicker"'
										+ 'type="text" name="xksj_dt" id="xksj_dt" value="'
										+ $.format.date(xksj_dt, "yyyy-MM-dd")
										+ '"  data-is="isAmount isEnough" autocomplete="off" disableautocomplete=""> <p class="ui-term-placeholder"></p> </div></div>'

										+ '<div class="inputs" style="margin-left:20px;margin-top: 40px;float:left;">'

										+ '01月<input class="ui-input" style="width: 50px;" value="'
										+ trim(data.i_Map.yf1_i, "")
										+ '" id="yf1" name="yf1_i"><br>'
										+ '02月<input class="ui-input" style="width: 50px;" value="'
										+ trim(data.i_Map.yf2_i, "")
										+ '" id="yf2" name="yf2_i"><br>'
										+ '03月<input class="ui-input" style="width: 50px;" value="'
										+ trim(data.i_Map.yf3_i, "")
										+ '" id="yf3" name="yf3_i"><br>'
										+ '04月<input class="ui-input" style="width: 50px;" value="'
										+ trim(data.i_Map.yf4_i, "")
										+ '" id="yf4" name="yf4_i"><br>'
										+ '05月<input class="ui-input" style="width: 50px;" value="'
										+ trim(data.i_Map.yf5_i, "")
										+ '" id="yf5" name="yf5_i"><br>'
										+ '06月<input class="ui-input" style="width: 50px;" value="'
										+ trim(data.i_Map.yf6_i, "")
										+ '" id="yf6" name="yf6_i"><br>'
										+ '07月<input class="ui-input" style="width: 50px;" value="'
										+ trim(data.i_Map.yf7_i, "")
										+ '" id="yf7" name="yf7_i"><br>'
										+ '08月<input class="ui-input" style="width: 50px;" value="'
										+ trim(data.i_Map.yf8_i, "")
										+ '" id="yf8" name="yf8_i"><br>'
										+ '09月<input class="ui-input" style="width: 50px;" value="'
										+ trim(data.i_Map.yf9_i, "")
										+ '" id="yf9" name="yf9_i"><br>'
										+ '10月<input class="ui-input" style="width: 50px;" value="'
										+ trim(data.i_Map.yf10_i, "")
										+ '" id="yf10" name="yf10_i"><br>'
										+ '11月<input class="ui-input" style="width: 50px;" value="'
										+ trim(data.i_Map.yf11_i, "")
										+ '" id="yf11" name="yf11_i"><br>'
										+ '12月<input class="ui-input" style="width: 50px;" value="'
										+ trim(data.i_Map.yf12_i, "")
										+ '" id="yf12" name="yf12_i"></div>'

										+ '<div class="inputs" style="margin-left:20px;margin-top: 40px;float:left;">'
										+ '01月<input class="ui-input" style="width: 50px;" value="'
										+ trim(data.i_Map.yf13_i, "")
										+ '" id="yf13" name="yf13_i"><br>'
										+ '02月<input class="ui-input" style="width: 50px;" value="'
										+ trim(data.i_Map.yf14_i, "")
										+ '" id="yf14" name="yf14_i"><br>'
										+ '03月<input class="ui-input" style="width: 50px;" value="'
										+ trim(data.i_Map.yf15_i, "")
										+ '" id="yf15" name="yf15_i"><br>'
										+ '04月<input class="ui-input" style="width: 50px;" value="'
										+ trim(data.i_Map.yf16_i, "")
										+ '" id="yf16" name="yf16_i"><br>'
										+ '05月<input class="ui-input" style="width: 50px;" value="'
										+ trim(data.i_Map.yf17_i, "")
										+ '" id="yf17" name="yf17_i"><br>'
										+ '06月<input class="ui-input" style="width: 50px;" value="'
										+ trim(data.i_Map.yf18_i, "")
										+ '" id="yf18" name="yf18_i"><br>'
										+ '07月<input class="ui-input" style="width: 50px;" value="'
										+ trim(data.i_Map.yf19_i, "")
										+ '" id="yf19" name="yf19_i"><br>'
										+ '08月<input class="ui-input" style="width: 50px;" value="'
										+ trim(data.i_Map.yf20_i, "")
										+ '" id="yf20" name="yf20_i"><br>'
										+ '09月<input class="ui-input" style="width: 50px;" value="'
										+ trim(data.i_Map.yf21_i, "")
										+ '" id="yf21" name="yf21_i"><br>'
										+ '10月<input class="ui-input" style="width: 50px;" value="'
										+ trim(data.i_Map.yf22_i, "")
										+ '" id="yf22" name="yf22_i"><br>'
										+ '11月<input class="ui-input" style="width: 50px;" value="'
										+ trim(data.i_Map.yf23_i, "")
										+ '" id="yf23" name="yf23_i"><br>'
										+ '12月<input class="ui-input" style="width: 50px;" value="'
										+ trim(data.i_Map.yf24_i, "")
										+ '" id="yf24" name="yf24_i"></div>'

										+ '<div class="inputs" style="margin-left:20px;margin-top: 40px;float:left;">'
										+ '01月确认<input class="ui-input" style="width: 80px;" value="'
										+ trim(data.d_Map.yj1_d, "")
										+ '" id="yj1" name="yj1_d"><br>'
										+ '02月确认<input class="ui-input" style="width: 80px;" value="'
										+ trim(data.d_Map.yj2_d, "")
										+ '" id="yj2" name="yj2_d"><br>'
										+ '03月确认<input class="ui-input" style="width: 80px;" value="'
										+ trim(data.d_Map.yj3_d, "")
										+ '" id="yj3" name="yj3_d"><br>'
										+ '04月确认<input class="ui-input" style="width: 80px;" value="'
										+ trim(data.d_Map.yj4_d, "")
										+ '" id="yj4" name="yj4_d"><br>'
										+ '05月确认<input class="ui-input" style="width: 80px;" value="'
										+ trim(data.d_Map.yj5_d, "")
										+ '" id="yj5" name="yj5_d"><br>'
										+ '06月确认<input class="ui-input" style="width: 80px;" value="'
										+ trim(data.d_Map.yj6_d, "")
										+ '" id="yj6" name="yj6_d"><br>'
										+ '07月确认<input class="ui-input" style="width: 80px;" value="'
										+ trim(data.d_Map.yj7_d, "")
										+ '" id="yj7" name="yj7_d"><br>'
										+ '08月确认<input class="ui-input" style="width: 80px;" value="'
										+ trim(data.d_Map.yj8_d, "")
										+ '" id="yj8" name="yj8_d"><br>'
										+ '09月确认<input class="ui-input" style="width: 80px;" value="'
										+ trim(data.d_Map.yj9_d, "")
										+ '" id="yj9" name="yj9_d"><br>'
										+ '10月确认<input class="ui-input" style="width: 80px;" value="'
										+ trim(data.d_Map.yj10_d, "")
										+ '" id="yj10" name="yj10_d"><br>'
										+ '11月确认<input class="ui-input" style="width: 80px;" value="'
										+ trim(data.d_Map.yj11_d, "")
										+ '" id="yj11" name="yj11_d"><br>'
										+ '12月确认<input class="ui-input" style="width: 80px;" value="'
										+ trim(data.d_Map.yj12_d, "")
										+ '" id="yj12" name="yj12_d"></div>'

										+ '<div class="inputs" style="margin-left:20px;margin-top: 40px;float:left;">'
										+ '01月确认<input class="ui-input" style="width: 80px;" value="'
										+ trim(data.d_Map.yj13_d, "")
										+ '" id="yj13" name="yj13_d"><br>'
										+ '02月确认<input class="ui-input" style="width: 80px;" value="'
										+ trim(data.d_Map.yj14_d, "")
										+ '" id="yj14" name="yj14_d"><br>'
										+ '03月确认<input class="ui-input" style="width: 80px;" value="'
										+ trim(data.d_Map.yj15_d, "")
										+ '" id="yj15" name="yj15_d"><br>'
										+ '04月确认<input class="ui-input" style="width: 80px;" value="'
										+ trim(data.d_Map.yj16_d, "")
										+ '" id="yj16" name="yj16_d"><br>'
										+ '05月确认<input class="ui-input" style="width: 80px;" value="'
										+ trim(data.d_Map.yj17_d, "")
										+ '" id="yj17" name="yj17_d"><br>'
										+ '06月确认<input class="ui-input" style="width: 80px;" value="'
										+ trim(data.d_Map.yj18_d, "")
										+ '" id="yj18" name="yj18_d"><br>'
										+ '07月确认<input class="ui-input" style="width: 80px;" value="'
										+ trim(data.d_Map.yj19_d, "")
										+ '" id="yj19" name="yj19_d"><br>'
										+ '08月确认<input class="ui-input" style="width: 80px;" value="'
										+ trim(data.d_Map.yj20_d, "")
										+ '" id="yj20" name="yj20_d"><br>'
										+ '09月确认<input class="ui-input" style="width: 80px;" value="'
										+ trim(data.d_Map.yj21_d, "")
										+ '" id="yj21" name="yj21_d"><br>'
										+ '10月确认<input class="ui-input" style="width: 80px;" value="'
										+ trim(data.d_Map.yj22_d, "")
										+ '" id="yj22" name="yj22_d"><br>'
										+ '11月确认<input class="ui-input" style="width: 80px;" value="'
										+ trim(data.d_Map.yj23_d, "")
										+ '" id="yj23" name="yj23_d"><br>'
										+ '12月确认<input class="ui-input" style="width: 80px;" value="'
										+ trim(data.d_Map.yj24_d, "")
										+ '" id="yj24" name="yj24_d"></div>'

										+ '<input class="ui-input"'
										+ 'type="hidden" name="sjkq_i" id="sjkq_i" value="'
										+ trim(data.i_Map.sjkq_i, "")
										+ '"> '

										+ '<input class="ui-input"'
										+ 'type="hidden" name="seriaNum_s" id="seriaNum_s" value="'
										+ trim(data.s_Map.seriaNum_s, "")
										+ '"> '

										+ '<input class="ui-input"'
										+ 'type="hidden" name="company_s" id="company_s" value="'
										+ trim(data.s_Map.company_s, "")
										+ '"> '

										+ '<input class="ui-input"'
										+ 'type="hidden" name="dayPrice_d" id="dayPrice_d" value="'
										+ trim(data.d_Map.dayPrice_d, "")
										+ '"  data-is="isAmount isEnough">'

										+ '<div class="widthdrawBtBox">'
										+ '<input type="button" id="subutton" onclick="saveMsgManual(\''
										+ userId
										+ '\')" class="block-btn" value="确认" ></div>'
										+ '<input type="hidden" value="" name="lineId" id="db_id"></form>'
							});
					var checkin = $('.datepicker').datepicker().on('click',
							function(ev) {
								$('.datepicker').css("z-index", "999999999");
							}).data('datepicker');
					getHy();

					$("#sksh_dt").change(function(event) {
						var sksh_dt = $('#sksh_dt').val();
						console.log(sksh_dt);
						// DateTime dt = DateTime.ParseExact(sksh_dt,
						// "yyyy-MM-dd", null);
						// Date date = new
						// SimpleDateFormat("yyyy-MM-dd").parse(sksh_dt);
						sksh_dt = sksh_dt.replace(/[^\d]/g, '/');
						var date = new Date(sksh_dt);
						var term_i = parseInt($('#term_i').val());
						var ms = term_i * (1000 * 60 * 60 * 24) - 1;
						var newDate = new Date(date.getTime() + ms);
						newDate = $.format.date(newDate, "yyyy-MM-dd");
						$('#xksj_dt').val(newDate);
					})
				}
			});
}
function delReport(id) {
	layer.confirm('确定删除吗？', {
		icon : 3
	}, function(index) {
		layer.close(index);
		if (true) {
			$.ajax({
				url : "http://" + changeAddr() + "/common/delById?id=" + id
						+ "&className=Contract_in",
				type : "GET",
				async : false,
				dataType : "json",
				success : function(data) {
					if (data == true) {
						layer.msg("删除成功");
						reportMsg.draw();
					} else {
						layer.msg("删除失败", {
							icon : 5
						});
					}
				}
			});
		}
	});

}

function getHy() {
	// 行业列表
	$.ajax({
		url : 'http://' + changeAddr() + '/price/industry',
		type : 'GET',
		async : false,
		dataType : 'json',
		success : function(data) {
			$.each(data.content, function(index, val) {
				$("#hy_s").append(
						"<option value=\'" + $.trim(val.name_s) + "\'>"
								+ $.trim(val.name_s) + "</option>");
			});
		}
	})
}
