var dsheet_taskJson = {
		"1" : "营销中心_通知",
		"2" : "合同部_生成",
		"3" : "财务_核实进款",
		"4" : "销售总监_审批",
		"5" : "媒介_审核车型",
		"6" : "设计部_接收",
		"7" : "设计部_完成",
		"8" : "营销中心_设计单签收",
		"50" : "流程结束"
};

function genDSheetCode(keyword, tag){
    var code = "";
    if(keyword != ""){
        $.ajax({
            url : 'http://' + changeAddr() + '/con/getCode?tag='  + tag + '&company=' + keyword ,
            type : "GET",
            data : {},
            async : false,
            dataType : "json",
            success : function(data) {
                if (data != undefined){
                    //console.log(data);
                    if (tag == 1)	//保存序号
                        code = data.i_Map.val_i;
                    else
                        code = data.i_Map.val_i + 1;
                }
            }
        });
    }
    return code;
}

function cloneLineTable() {
    var pageId = $("#seriaNum_s").val();
    if(!isNotNull(pageId)) {
    	return;
	}

	$.ajax({
        url : "http://" + changeAddr() + "/common/getModelList?filter[className]=DesignSheet_line&length=1024&filter[seriaNum_s_s]="+pageId,
		type : 'GET',
		async : false,
		dataType : 'json',
        success : function(data) {
            var settings = {
                "async" : false,
                "url" : "http://" + changeAddr() + "/common/getModelList?filter[className]=DesignSheet_user&length=1&filter[seriaNum_s_s]="+pageId,
                "method" : "GET",
            }
            $.ajax(settings).done(function(response) {
                if(response.totalElements == 0){//或判断context是否为空
                    cloneLinesInfo(data.content);
                }
            });
        }
    });
}

function cloneLinesInfo(data){
	var list = [];//定义数组
	//遍历line信息进行保存
	$.each(data, function(i, item) {
		//组一个对象
		var row = {
			"lineid_s" : item.s_Map.lineid_s,
			"linename_s" : item.s_Map.linename_s,
			"level_s" : item.s_Map.level_s,
            "busType_s" : item.s_Map.busType_s,
			"salesNumber_i" : item.i_Map.salesNumber_i,
			"day_i" : item.i_Map.day_i,
			"seriaNum_s" : $("#seriaNum_s").val(),

		};
		list.push(row);
	});
	//保存
	$.each(list, function(i, item) {
		var settings = {
			"async" : false,
			"crossDomain" : true,
			"url" : "http://" + changeAddr() + "/common/saveModel?className=DesignSheet_user&checkUniq=N",
			"method" : "POST",
			"data" : item
		}
		$.ajax(settings).done(function(response) {
		});
	});
}

function fetchLineToDSheet(toClassName) {
	$.ajax({
		url : '/busselect/ajax-publishLine',
		type : 'GET',
		data : {
			"seriaNum" : $("#seriaNum_s").val(),
			"filter[seriaNumList]" : $("#seriaNumList").val()
		},
		async : false,
		dataType : 'json',
		success : function(data) {
			var pageid = $("#seriaNum_s").val();
			if(isNotNull(pageid)){
					var settings = {
						"async" : false,
						"url" : "http://" + changeAddr() + "/common/getModelList?filter[className]="+toClassName+"&length=1&filter[seriaNum_s_s]="+pageid,
						"method" : "GET",
					}
					$.ajax(settings).done(function(response) {
						if(response.totalElements == 0){//或判断context是否为空
							saveLinesToDSheet(data,toClassName);
						}
					});
			}

		}
	});
}

function saveLinesToDSheet(data,toClassName){
	var list = [];//定义数组
	//遍历line信息进行保存
	$.each(data, function(i, item) {
		//组一个对象
		var row = {
			"lineid_s" : item.line.id,
			"linename_s" : item.line.name,
			"level_s" : item.line.level,
			"salesNumber_i" : item.salesNumber,
			"day_i" : item.days,
			"seriaNum_s" : $("#seriaNum_s").val(),
			
		};
		list.push(row);
	});
	//console.log(list);
	//保存
	$.each(list, function(i, item) {
		var settings = {
			"async" : false,
			"crossDomain" : true,
			"url" : "http://" + changeAddr() + "/common/saveModel?className="+toClassName+"&checkUniq=N",
			"method" : "POST",
			"data" : item
		}
		$.ajax(settings).done(function(response) {
		});
	});
}

function updateLineById(rowId, columnName, value, toClassName) {
	var params = {"selectByField":"id","id":rowId}
	params[columnName] = value;
	//console.log(params);
    var settings = {
        "async" : false,
        "crossDomain" : true,
        "url" : "http://" + changeAddr() + "/common/saveModel?className=" + toClassName + "&checkUniq=Y" ,
        "method" : "POST",
        "data" : params
    }
    $.ajax(settings).done(function(response) {
    });
}

function batchUdateLineById(params, toClassName) {
	//console.log(params);
    var settings = {
        "async" : false,
        "crossDomain" : true,
        "url" : "http://" + changeAddr() + "/common/saveModel?className=" + toClassName + "&checkUniq=Y" ,
        "method" : "POST",
        "data" : params
    }
    $.ajax(settings).done(function(response) {
    });
}

function getQueryString(name)
{
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
    var r = window.location.search.substr(1).match(reg);
    if (r != null) return unescape(r[2]); return null;
}