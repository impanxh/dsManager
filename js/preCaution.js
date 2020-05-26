function trimToDefault(v,d) {
    return typeof(v)!="undefined"? v:d;
}

function getQueryString(name)
{
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
    var r = window.location.search.substr(1).match(reg);
    if (r != null) {
        return decodeURI(r[2]);
    } else {
        return null;
    }
}

function getPrecautionById(pClass, pId) {
    var precaution = null;
    $.ajax({
        "url" : "http://" + changeAddr() + "/common/queryById?className="+ pClass + "&id=" + pId,
        type : 'GET',
        async : false,
        data : { },
        dataType : 'json',
        success : function(data) {
            if (data.id != null) {
                precaution = data;
            }
        }
    });

    return precaution;
}

function getUnitById(unitId) {
    var unit = null;
    $.ajax({
        "url" : "http://" + changeAddr() + "/common/queryById?className=Unit&id=" + unitId,
        type : 'GET',
        async : false,
        data : { },
        dataType : 'json',
        success : function(data) {
            if (data.id != null) {
                unit = data;
            }
        }
    });

    return unit;
}

function getPrecautionItems(unitId, precautionClass) {
    var myUnit = getUnitById(unitId);
    if(myUnit == null) {
        return null;
    }

    var itemList = null;
    $.ajax({
        url : "http://" + changeAddr() + "/common/getModelList",
        type : 'GET',
        async : false,
        data : {
            "filter[className]": precautionClass,
            "length": 1024,
            "filter[unitId_s_s_EQ]" : unitId,
        },
        dataType : 'json',
        success : function(data) {
            if(data.totalElements > 0) {
                itemList = data.content;
                }
            }
    });

    return itemList;
}

function initPrecautionItems(unitId, precautionEnum) {
    var myUnit = getUnitById(unitId);
    if(myUnit == null) {
        return;
    }

    var className = "EquipPrecaution";
    var precautionType = "物防措施";
    switch(precautionEnum) {
        case "Person":
            className = "PersonPrecaution";
            precautionType = "人防措施";
            break;
         case "Tech":
            className = "TechPrecaution";
            precautionType = "技防措施";
             break;
        case "Mind":
            className = "MindPrecaution";
            precautionType = "心防措施";
            break;
        case "Equip":
            className = "EquipPrecaution";
            precautionType = "物防措施";
            break;
        default:
            className = "EquipPrecaution";
            precautionType = "物防措施";
            break;
    }

    var precautionArray = new Array();
	// TODO  temp fix
	var tempHytype = myUnit.s_Map.hyType_s;
    $.ajax({
        url : "http://" + changeAddr() + "/common/getModelList",
        type : 'GET',
        async : false,
        data : {
            "filter[className]": "InspectionBank",
            "length": 1024,
            "filter[template_s_s]" : tempHytype.substring(tempHytype.length-2),
            "filter[type_s_s_EQ]" : precautionType,
            "filter[dept_s_s_EQ]": "police",
        },
        dataType : 'json',
        success : function(data) {
            if(data.totalElements > 0) {
                $.each(data.content, function (i, item) {
                    var params = {
                        "className":className,
                        "checkUniq":"N",
                        "unitId_s":unitId,
                        "itemName_s":item.s_Map.content_s
                    };
                   precautionArray.push(params);
                })
            }
        }
    });
    var data = JSON.stringify(precautionArray);
    $.ajax({
        url : 'http://'+ changeAddr() +'/common/saveModelBatch',
        type : 'POST',
        dataType : 'json',
        contentType: "application/json; charset=utf-8",
        "data" : data,
        success : function(data) {
        }
    });
}

function EPItemExists(unitId, itemName) {
    var result = false;
    $.ajax({
        url : "http://" + changeAddr() + "/common/getModelList",
        type : 'GET',
        async : false,
        data : {
            "filter[className]": "EquipPrecaution",
            "length": 1024,
            "filter[unitId_s_s]" : unitId,
            "filter[itemName_s_s]": itemName
        },
        dataType : 'json',
        success : function(data) {
            if(data.totalElements > 0) {
                result = true;
            }
        }
    });

    return result;
}
function TPItemExists(unitId, itemName) {
    var result = false;
    $.ajax({
        url : "http://" + changeAddr() + "/common/getModelList",
        type : 'GET',
        async : false,
        data : {
            "filter[className]": "TechPrecaution",
            "length": 1024,
            "filter[unitId_s_s]" : unitId,
            "filter[itemName_s_s]": itemName
        },
        dataType : 'json',
        success : function(data) {
            if(data.totalElements > 0) {
                result = true;
            }
        }
    });

    return result;
}
