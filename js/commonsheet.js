//this is common js for all kind of sheet

var Problem_sheet_media_taskJson = {
		"1" : "自营_提交",
		"2" : "自营_经理确认",
		"3" : "合同_核实信息",
		"4" : "合同_经理签字",
		"5" : "媒介_核实上刊日期",
		"6" : "媒介_车辆管理核实",
		"7" : "媒介_经理确认",
		"8" : "自营_签收",
		
		"50" : "流程结束"
};

var Problem_sheet_check_taskJson = {
		"1" : "自营_提交",
		"2" : "自营_解决意见",
		"3" : "检查_签字",		
		"4" : "公司领导_批示",
		"5" : "自营_签收",
		
		"50" : "流程结束"
};



function fetchLineToProduction(toClassName) {

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
			if (isNotNull(pageid)) {
				var settings = {
					"async" : false,
					"url" : "http://" + changeAddr() + "/common/getModelList?filter[className]=" + toClassName + "&length=1&filter[seriaNum_s_s]=" + pageid,
					"method" : "GET",
				}
				$.ajax(settings).done(function(response) {
					if (response.totalElements == 0) {// 或判断context是否为空
						saveLines(data, toClassName);
					}

				});
			}
		}
	});

}

function saveLines(data, toClassName) {
	var list = [];// 定义数组
	// 遍历line信息进行保存
	$.each(data, function(i, item) {
		// 组一个对象
		var row = {
			"lineid_s" : item.line.id,
			"linename_s" : item.line.name,
			"level_s" : lineLevelMap[item.line.level],
			"salesNumber_i" : item.salesNumber,
			"day_i" : item.days,
			"seriaNum_s" : $("#seriaNum_s").val(),

		};
		list.push(row);
	});
	console.log(list);
	// 保存
	$.each(list, function(i, item) {
		var settings = {
			"async" : false,
			"crossDomain" : true,
			"url" : "http://" + changeAddr() + "/common/saveModel?className=" + toClassName + "&checkUniq=N",
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

function deleteSheet(id) {
      layer.confirm('确定删除该条制作单吗？', {
        icon : 3
      }, function(index) {
        layer.close(index);
        if (true) {
          $.ajax({
            url : "http://" + changeAddr() + "/common/delById?id=" + id
            + "&className=ProductionSheet_base",
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