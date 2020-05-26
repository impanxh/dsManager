/**
 * 导出excep pushlet 封装 add by impanxh
 * 
 */

function initLayerInfo() {
	var t = "<span id='infoText'></span>";
	layer
			.open({
				title : '[执行过程窗口]',
				type : 1,
				skin : 'layui-layer-demo',
				closeBtn : 0,
				shift : 2,
				area : [ '400px', '400px' ],
				shadeClose : false,
				content : '<div><input type="hidden" id ="cc" class="layui-layer-ico layui-layer-close layui-layer-close1"/>'
						+ t + "</div>"
			});
}

function sysmsgLayer() {
	var t = "<span id='infoText'></span>";
	layer
			.open({
				title : '系统通知',
				type : 1,
				skin : 'layui-layer-demo',
				shift : 2,
				area : [ '400px', '200px' ],
				shadeClose : false,
				content : '<div><input type="hidden" id ="cc" class="layui-layer-ico layui-layer-close layui-layer-close1"/>'
						+ t + "</div>"
			});
}
var _isFrist = 0;
function onData(event) {
	var msg = decodeURIComponent(event.get("message"));
	var f = decodeURIComponent(event.get("from"));
	var json = event.get("json");
	var isSysMsg = false;
	if (typeof json != "undefined") {
		var jsonObj = decodeURIComponent(json);
		var obj = jQuery.parseJSON(jsonObj);
		if (typeof (obj.type) != "undefined" && obj.type == 's') {
			layer.closeAll();
			isSysMsg = true;
			console.log("syslog");
			sysmsgLayer();
			_isFrist = 0;
			$("#infoText").prepend("<span style='margin-left:130px;color:#ff9966'>" + obj.msg + "</span><br>");
		}

	}
	if (!isSysMsg) {

		if (_isFrist == 0) {
			layer.load(1);
			_isFrist = 1;
			initLayerInfo();
		}
		console.log("msg:" + msg);
		$("#infoText").prepend(
				"<span style='margin-left:130px'>" + msg + "</span><br>");
		if (typeof json != "undefined") {
			_isFrist = 0;
			layer.closeAll("loading");
			var t2 = decodeURIComponent(json);
			var obj = jQuery.parseJSON(t2);
			if (obj.tag == 'ok') {
				$("#cc").trigger("click");
				location.href = obj.excelPath;
			} else {
				layer.alert('导出失败,可能服务器存储已满!', {
					icon : 6
				});
			}
		}

	}
}
function initExportExcelPushLet(url) {
	//console.log(" pushlet ->"+url)
	//PL.joinListen(url);
	PL.join();  
	PL.listen(url);
}
