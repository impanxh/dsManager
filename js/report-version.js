	
function saveHistroy(uid,editType){

	var settings = {
        "async" : false,
        "url" :'http://'+changeAddr()+'/report/getReportRole/'+$("#seriaNum").val() ,
        "method" : "GET"
    }
    $.ajax(settings).done(function(response) {
    roleJson = response;
    });
      settings = {
        "async" : false,
        "url" :'http://'+changeAddr()+'/report/findReportById/'+getUrlParam('id'),
        "method" : "GET"
    }
    $.ajax(settings).done(function(response) {
    baseJson = response;
    });
       settings = {
        "async" : false,
        "url" :'/busselect/ajax-publishLine',
        "method" : "GET",
        "data" : {"seriaNum" : $("#seriaNum").val(),
						"filter[seriaNumList]" : $("#seriaNumList").val()}
    }
    $.ajax(settings).done(function(response) {
    lineJson = response;
    });
    
	var postData={"baseJson_s":JSON.stringify(baseJson),"lineJson_txt":JSON.stringify(lineJson),"roleJson_s":JSON.stringify(roleJson),"uid_s":uid,"checkUniq":'N'};
	postData.seriaNum_s = $("#seriaNum").val();
	postData.editType_s = editType;
	saveDataModel(postData,"ReportVersion");

}	