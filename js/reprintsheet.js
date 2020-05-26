
var reprint_sheet_taskJson = {
		"1" : "合同_生成",
		"2" : "领导_签字",
		"3" : "媒介_延刊期",
		"4" : "合同_签收",
		"5" : "媒介_核车型",
		"6" : "制作中心_签收",		
		
		"50" : "流程结束"
};

function fetchLineToSheet(dt1,dt2,num,toClassName) {

	$.ajax({
		url : '/bus/ajax-list?draw=4&columns=&order%5B0%5D%5BserialNumber*1%5D=asc&start=0&length=15&search%5Bvalue%5D=&search%5Bregex%5D=false&filter%5Boldserinum%5D=&filter%5Bserinum%5D=&filter%5BplateNumber%5D=&filter%5BadContent%5D=&filter%5BspeAdContent%5D=&filter%5Bsh%5D=stats_1&filter%5Btags%5D=&filter%5B_modelId%5D=0&filter%5Bend1%5D=&filter%5Bend2%5D=&filter%5Bstart1%5D=&filter%5Bstart2%5D=&filter%5Bprend1%5D='+dt1+'&filter%5Bprend2%5D='+dt2+'&filter%5Bcontractid%5D=&_=1499763055847',
		type : 'GET',
		data: function(d) {
            
        },
		async : false,
		dataType : 'json',
		success : function(data) {
			var pageid = $("#seriaNum_s").val();
			console.log("pageid="+pageid);
			if (isNotNull(pageid)) {
				saveLines(data, num, toClassName);				
			}
		}
	});
}

function saveLines(data, num,toClassName) {
	var list = [];// 定义数组
	// 遍历line信息进行保存
	console.log(data);
	$.each(data.content, function(i, item) {
		// 组一个对象
		var row = {
			"seriaNum_s" : $("#seriaNum_s").val(), //明细表序列号
			"detailNum_s" : num, //存入明细单编号
            "sheetNum_s" : "", //存入派工单编号
			"linename_s" : item.jpaBus.line.name,
			"lineid_s" : item.jpaBus.line.id,
			"level_s" : item.jpaBus.line.levelStr,	
			"serialNumber_s" : item.jpaBus.serialNumber,
			"modelname_s" : item.jpaBus.model.name,
			"adContent_s" : item.jpaBus.adContent,
			"companyname_s" : item.jpaBus.company.name,
			"plateNumber_s" : item.jpaBus.plateNumber,
			"modeldesc_s" : item.jpaBus.model.modeldesc.description,
			"office_s" : item.jpaBus.office,
			"workdays_i": 0,
			"offtime_s" : "",
			"comments_s" : "",
		};
		list.push(row);
	});
	console.log(list);
	// 保存
	var success=1;
	$.each(list, function(i, item) {
		var settings = {
			"async" : false,
			"crossDomain" : true,
			"url" : "http://" + changeAddr() + "/common/saveModel?className=" + toClassName + "&checkUniq=N",
			"method" : "POST",
			"data" : item
		}
		$.ajax(settings).done(function(response) {
			if(response.status != 200) {
				success = 0;
			}
		});
	});

	if(success){
		layer.msg("保存成功");
	}else{
		layer.msg("保存失败");
	}
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