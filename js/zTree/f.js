function fetchData(selectAllTag) {
	var result = [];
	result.push({
		id : 1,
		pId : 0,
		name : "全部辖区",
		title : "",
		checked : selectAllTag,
		open : true
	});
	$.ajax({
		url : "http://" + changeAddr() + "/roleTree",
		type : "GET",
		async : false,
		dataType : "json",
		success : function(data) {
			if (isNotNull(data)) {
				$.each(data, function(index, item) {
					if (selectAllTag) {
						item.checked = true
					}
					result.push(item)
				})
			}
		}
	});
	return result
}
function _fetchIndustry() {
	$
			.ajax({
				url : "http://"
						+ changeAddr()
						+ "/common/getModelList?filter[className]=industry&filter[type_s_s]=industry&length=100",
				type : "GET",
				async : false,
				dataType : "json",
				success : function(data) {
					var f = "";
					$
							.each(
									data.content,
									function(index, data) {
										index++;
										var template1 = '<input type="checkbox" value="{0}" name="industry" id="region" />{1} &nbsp;&nbsp; ';
										f += template1.format(data.id,
												data.s_Map.name_s);
										if (index % 5 == 0 && index != 0) {
											f += "<br>"
										}
									});
					$("#c2").html(f)
				}
			})
}
var setting = {
	check : {
		enable : true
	},
	data : {
		key : {
			title : "title"
		},
		simpleData : {
			enable : true
		}
	},
	callback : {
		onCheck : onCheck
	}
};
function onCheck(e, treeId, treeNode) {
	count()
}
function setTitle(node) {
	var zTree = $.fn.zTree.getZTreeObj("treeDemo");
	var nodes = node ? [ node ] : zTree.transformToArray(zTree.getNodes());
	for (var i = 0, l = nodes.length; i < l; i++) {
		var n = nodes[i];
		n.title = "[" + n.id + "] isFirstNode = " + n.isFirstNode
				+ ", isLastNode = " + n.isLastNode;
		zTree.updateNode(n)
	}
}
function count() {
	function isForceHidden(node) {
		if (!node.parentTId) {
			return false
		}
		var p = node.getParentNode();
		return !!p.isHidden ? true : isForceHidden(p)
	}
	var zTree = $.fn.zTree.getZTreeObj("treeDemo"), checkCount = zTree
			.getCheckedNodes(true).length, nocheckCount = zTree
			.getCheckedNodes(false).length, hiddenNodes = zTree
			.getNodesByParam("isHidden", true), hiddenCount = hiddenNodes.length;
	for (var i = 0, j = hiddenNodes.length; i < j; i++) {
		var n = hiddenNodes[i];
		if (isForceHidden(n)) {
			hiddenCount -= 1
		} else {
			if (n.isParent) {
				hiddenCount += zTree.transformToArray(n.children).length
			}
		}
	}
	$("#isHiddenCount").text(hiddenNodes.length);
	$("#hiddenCount").text(hiddenCount);
	$("#checkCount").text(checkCount);
	$("#nocheckCount").text(nocheckCount)
}
function c2() {
	function isForceHidden(node) {
		if (!node.parentTId) {
			return false
		}
		var p = node.getParentNode();
		return !!p.isHidden ? true : isForceHidden(p)
	}
	var zTree = $.fn.zTree.getZTreeObj("treeDemo");
	var checkedNodes = zTree.getCheckedNodes(true);
	var rd = $("input[name='r']:checked").val();
	var sString = [];
	var checkPlaceCount = 0;
	var checkPlaceAdminCount = 0;
	var _industry = [];
	var _region = [];
	var _place = [];
	$.each(checkedNodes, function(index, data) {
		if (data.pId != 1 && data.pId != null) {
			checkPlaceCount++;
			_region.push(data.id)
		}
		if (data.pId == 1) {
			checkPlaceAdminCount++;
			_place.push(data.id)
		}
		sString.push(data.id)
	});
	console.log(sString);
	sString = sString.join(",");
	_place = _place.join(",");
	_region = _region.join(",");
	if (rd == "place") {
		if (checkPlaceCount > 1) {
			jDialog.Alert("您可能为民警选择了多个辖区,请重新选择?");
			return false
		}
	}
	if (rd == "placeAdmin") {
		if (checkPlaceAdminCount > 1) {
			jDialog.Alert("您可能为‘派出所领导’ 选择了多个派出所,请重新选择?");
			return false
		}
	}
	if (rd == "hzadmin") {
		$("input[name='industry']:checkbox:checked").each(function() {
			_industry.push($(this).val())
		});
		_industry = _industry.join(",")
	}
	var uid = $("#username").val();
	var settings = {
		async : false,
		crossDomain : true,
		url : "http://" + changeAddr() + "/common/delByField?className=urole",
		method : "GET",
		data : {
			dByField : "gid_s_s",
			value : uid
		}
	};
	$.ajax(settings).done(function(response) {
		console.log(response);
		if(rd =='hzadmin'){
    		_place = _region = sString =   '';
    	}else  {
    		_industry ='';
    	}
		var postData = {
			placeIds_s : _place,
			rd_s : rd,
			roleTree_s : sString,
			region_s : _region,
			industry_s : _industry,
			gid_s : uid,
			checkUniq : "N"
		};
		
		saveDataModel(postData, "urole")
	});
	return true
}
function showNodes() {
	var zTree = $.fn.zTree.getZTreeObj("treeDemo"), nodes = zTree
			.getNodesByParam("isHidden", true);
	zTree.showNodes(nodes);
	setTitle();
	count()
}
function hideNodes() {
	var zTree = $.fn.zTree.getZTreeObj("treeDemo"), nodes = zTree
			.getSelectedNodes();
	if (nodes.length == 0) {
		alert("请至少选择一个节点");
		return
	}
	zTree.hideNodes(nodes);
	setTitle();
	count()
}
var i = 0;
function selectAll(selectAllTag) {
	var f = fetchData(selectAllTag);
	$.fn.zTree.init($("#treeDemo"), setting, f);
	setTitle();
	count()
}
$(document).ready(function() {
	var f = fetchData(false);
	$.fn.zTree.init($("#treeDemo"), setting, f);
	$("#hideNodesBtn").bind("click", {
		type : "rename"
	}, hideNodes);
	$("#showNodesBtn").bind("click", {
		type : "icon"
	}, showNodes);
	setTitle();
	count();
	$("#c2ALDiv").hide();
	$(":radio").click(function() {
		var selected = $(this).val();
		if (selected != "hzadmin") {
			$("#roleOPer").show();
			$("#c2ALDiv").hide();
			selectAll(selected == "admin" ? true : false)
		} else {
			$("#c2ALDiv").show();
			$("#roleOPer").hide()
		}
	});
	_fetchIndustry();
	$("#c2AL").click(function() {
		if (this.checked) {
			$("#c2ALDiv :checkbox").prop("checked", true)
		} else {
			$("#c2ALDiv :checkbox").prop("checked", false)
		}
	})
});