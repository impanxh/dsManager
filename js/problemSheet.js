var pbsheet_taskJson = {
    "1" : "自营提交",
    "2" : "合同_核实信息",
    "3" : "媒介_核实上刊日期",
    "4" : "媒介_核实车辆信息",
    "5" : "媒介_经理确认",
    "6" : "自营_解决意见",
    "40" : "公司领导_确认",
    "41" : "合同_经理确认",
    "42" : "检查部_签收",
    "50" : "流程结束"
};

function listContain(list, searchVal) {
    for(i=0; i< list.length; i++) {
        if(list[i] == searchVal) {
            return true;
        }
    }
    return false;
}

function genPbSheetCode(keyword, tag){
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

function updateClassById(rowId, columnName, value, toClassName) {
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

function batchUpdateClassById(params, toClassName) {
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

function updateMainStats(upatestatus){
    var settings = {
        "url" : "http://" + changeAddr() + "/common/saveModel?className=ProblemSheet_base",
        "method" : "POST",
        "data" : {"selectByField":"id","id":getParamFromUrl('id'),"task_ss":upatestatus} ,
    }
    $.ajax(settings).done(function(response) {
    });
}

function batchUpdateClass(dataLi) {
    var data = JSON.stringify(dataLi);
    $.ajax({
        url : "http://" + changeAddr() + "/common/saveModelBatch",
        method : "POST",
        dataType : 'json',
        contentType: "application/json; charset=utf-8",
        data : data,
        success: function(data) {
            console.log(data);
        }
    });
}

function insertSubTask(subTaskList, subTask) {
    if (!listContain(subTaskList, subTask)) {
        subTaskList.push(subTask);
    }
}

function updateSubTasks(currTask, taskList) {
    var mySeria = getParamFromUrl('seriaNum_s');
    var list = [];
    $.ajax({
        url :  'http://'+changeAddr()+'/common/getModelList?filter[className]=ProblemSheet_detail&filter[currStage_s_s_NEQ]=结束&filter[seriaNum_s_s]='+mySeria,
        type : 'GET',
        async : false,
        dataType : 'json',
        success : function(data) {
            if(data.totalElements > 0) {
                $.each(data.content, function(i, item){
                    var row = {
                        "id" : item.id,
                        "mediaConfirm" : trimToDefault(item.s_Map.mediaConfirm_s, "待确认"),
                        "method" : trimToDefault(item.s_Map.method_s, ""),
                    };
                    list.push(row);
                });
            }
        }
    });

    if(list.length == 0) {
        taskList = ["50"];
        updateMainStats(taskList.join(","));
        console.log(taskList);
        return taskList;
    }

    var currStageLi = [];
    if(currTask == 40) {
        for(var i=0; i < list.length; i++) {
            if(list[i].method == "领导确认|合同部签收") {
                list[i].method = "合同部签收";
                currStageLi.push({"selectByField":"id","id":list[i].id, "method_s":"合同部签收" , "currStage_s": "合同部签收", "className":"ProblemSheet_detail", "checkUniq":"Y"});

            } else if (list[i].method == "领导确认|检查部签收") {
                currStageLi.push({"selectByField":"id","id":list[i].id, "method_s":"检查部签收", "currStage_s": "检查部签收", "className":"ProblemSheet_detail", "checkUniq":"Y"});
                list[i].method  = "检查部签收";
            }
       }
    }
    console.log(currStageLi);

    var mediaConfirmCount = 0;
    var methodCount = 0;
    var subTaskList = [];
    $.each(list, function(i, item){
        if(item.mediaConfirm == "已确认") {
            mediaConfirmCount++;
        }
        switch (item.method) {
            case "合同部签收":
                methodCount++;
                insertSubTask(subTaskList, "41");
                break;
            case "检查部签收":
                methodCount++;
                insertSubTask(subTaskList, "42");
                break;
            case "领导确认|合同部签收":
                methodCount++;
                insertSubTask(subTaskList, "40");
                //insertSubTask(subTaskList, "41");
                break;
            case "领导确认|检查部签收":
                methodCount++;
                insertSubTask(subTaskList, "40");
                //insertSubTask(subTaskList, "42");
                break;
            default :
                break;
        }
    });

    switch(currTask) {
        case 1:
            taskList = ["2"].concat(subTaskList);
            break;
        case 2:
            taskList = ["3"].concat(subTaskList);
            break;
        case 3:
            taskList = ["4"].concat(subTaskList);
            break;
        case 4:
            if(mediaConfirmCount == list.length) {
                if(listContain(taskList, "6")){
                    taskList = ["5", "6"].concat(subTaskList);
                } else {
                    taskList = ["5"].concat(subTaskList);
                }
            } else if(mediaConfirmCount > 0) {
                if(listContain(taskList, "6")){
                    taskList = ["4", "5", "6"].concat(subTaskList);
                } else {
                    taskList = ["4", "5"].concat(subTaskList);
                }
            }
            break;
        case 5:
            var tmpTaskList = [];
            if(listContain(taskList, "4")) {
                insertSubTask(tmpTaskList, "4");
            }
            insertSubTask(tmpTaskList, "6");
            taskList = tmpTaskList.concat(subTaskList);
//            for(var i=0;i<taskList.length;i++) {
//                if(taskList[i] == "5") {
//                    taskList.splice(i,1);
//                }
//            }
            break;
        case 6:
            var tmpTaskList = [];
            if(listContain(taskList, "4")) {
                insertSubTask(tmpTaskList, "4");
            }
            if(listContain(taskList, "5")) {
                insertSubTask(tmpTaskList, "5");
            }
            if(methodCount == mediaConfirmCount) {
                taskList = tmpTaskList.concat(subTaskList);
            } else {
               insertSubTask(tmpTaskList, "6");
               taskList = tmpTaskList.concat(subTaskList);
            }
            break;

        case 40:
            var tmpTaskList = [];
            var mainTaskList = ["1", "2", "3", "4", "5", "6"];
            for(var i=0;i < 6; i++) {
                if(listContain(taskList, mainTaskList[i])) {
                    insertSubTask(tmpTaskList, mainTaskList[i]);
                }
            }
            taskList = tmpTaskList.concat(subTaskList);
            batchUpdateClass(currStageLi);
            break;
        case 41:
            var endLi = [];
            for(var i=0; i< list.length; i++) {
                if(list[i].method == "合同部签收") {
                    endLi.push({"selectByField":"id","id":list[i].id, "currStage_s": "结束", "className":"ProblemSheet_detail", "checkUniq":"Y"});
                }
            }
            if(endLi.length == list.length) {
                taskList = ["50"];
            } else {
                for(var i=0; i< taskList.length; i++) {
                    if(taskList[i] == "41") {
                        taskList.splice(i, 1);
                    }
                }
            }
            batchUpdateClass(endLi);
            break;
        case 42:
            var endLi = [];
            for(var i=0; i< list.length; i++) {
                if(list[i].method == "检查部签收") {
                    endLi.push({"selectByField":"id","id":list[i].id, "currStage_s": "结束", "className":"ProblemSheet_detail", "checkUniq":"Y"});
                }
            }
            if(endLi.length == list.length) {
                taskList = ["50"];
            } else {
                for(var i=0; i< taskList.length; i++) {
                    if(taskList[i] == "42") {
                        taskList.splice(i, 1);
                    }
                }
            }
            batchUpdateClass(endLi);
            break;
    };

    console.log(taskList)
    updateMainStats(taskList.join(","));

    return taskList;
}
