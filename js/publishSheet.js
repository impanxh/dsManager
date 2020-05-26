var psheet_taskJson = {
    "1" : "营销中心_生成",
    "2" : "营销中心_确认",
    "3" : "媒介部_审核",
    "4" : "广告管理中心_审核",
    "5" : "印制上刊公司_签收",
    "6" : "印制上刊公司_提交",
    "7" : "印制公司签收",
    "8" : "印制公司提交",
    "9" : "上刊公司签收",
    "10" : "上刊公司提交",
    "11" : "广告管理中心_签收",
    "12" : "媒介部_签收",
    "13" : "营销中心_签收",
	"50" : "流程结束"
};

function genPSheetCode(keyword, tag){
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

function getAllLinesPerContract() {
	var list = [];
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
            $.each(data, function(i, item) {
            	var row = {
            		"lineid":item.line.id,
					"linename":item.line.name
				}
				list.push(row);
            });
        }
    });
    return list;
}

function getAllVehicleIdPerLine(linename, modelId) {
	var list = [];
    $.ajax({
        url : '/bus/ajax-list?draw=4&start=0&length=15000',
        type : 'GET',
        data : {
            "filter[tags]" : linename,
            "filter[modelId]" : modelId
        },
        async : false,
        dataType : 'json',
        success : function(data) {
            $.each(data.content, function(i, item) {
            	var contractNode = item.busInfo.offlinecontract;
            	var adContent = "";
            	if(isNotNull(contractNode)) {
            		adContent = contractNode.adcontent;
				}
                var row = {
                    "vehicleId":item.jpaBus.serialNumber,
                    "licensePlate":item.jpaBus.plateNumber,
					"branch": item.jpaBus.branch,
					"descr": item.jpaBus.model.modeldesc.description,
					"adContent": adContent

                }
                list.push(row);
            });
        }
    });
    return list;
}

function batchInsertBlankObjectsToPSheetCar(num) {
	var row = {
        "seriaNum_s" : $("#seriaNum_s").val(),
	};
	var list = [];
	for(var i=0; i < num; i++) {
		list.push(row);
	}

	$.each(list, function(i, item) {
		var settings = {
			"async" : false,
			"crossDomain" : true,
			"url" : "http://" + changeAddr() + "/common/saveModel?className=PublishSheet_car&checkUniq=N",
			"method" : "POST",
			"data" : item
		}
		$.ajax(settings).done(function(response) {
		});
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



function batchUpdateClassById(params, toClassName) {
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