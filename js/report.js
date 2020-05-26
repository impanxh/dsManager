var table;

function trim(a,d){
		return typeof(a)=="undefined"?d:a	;
	}



function rebuidJson(context){
   var rows=[];
   console.log(context)
   $.each(context, function(key, item){
   	 if(item.company.name.indexOf('自营')!=-1){
   	    rows.push(item);
   	 }   
   });
   $.each(context, function(i, item){   
   	if(item.company.name.indexOf('CBS')!=-1){
   	    rows.push(item);
   	 } 
   });
   $.each(context, function(i, item){   
   	if(item.company.name.indexOf('白马')!=-1){
   	    rows.push(item);
   	 } 
   });
   $.each(context, function(i, item){   
   	if(item.company.name.indexOf('七彩')!=-1){
   	    rows.push(item);
   	 } 
   });
   $.each(context, function(i, item){   
	   	if(item.company.name.indexOf('媒体池')!=-1){
	   	    rows.push(item);
	   	 } 
	   });
   
   $.each(context, function(i, item){   
	   	if(item.company.name.indexOf('智马')!=-1){
	   	    rows.push(item);
	   	 } 
	   });
   $.each(context, function(i, item){   
	   	if(item.company.name.indexOf('合计')!=-1){
	   	    rows.push(item);
	   	 } 
	   });
   return rows;

}



function initTable() {
	table = $('#table1').DataTable({
		"dom" : '<"#toolbar2">t',
		"searching" : false,
		"ordering" : false,
		"serverSide" : true,
		"scrollX" : true,
		"aaSorting" : [ [ 0, "asc" ] ],
		"columnDefs" : [ {
			"orderable" : false,
			"targets" : [ 8, 9 ]
		}, ],

		"iDisplayLength" : 50,
		"aLengthMenu" : [ [ 50, 100 ], [ 50, 100 ] ],
		"ajax" : {
			type : "GET",
			url : "/report/ajax-getReport_daily",
			data : function(d) {
				var dateParam = $('#startDate1').val();
				if (typeof (dateParam) == "undefined") {
					dateParam = $.format.date(new Date(), 'yyyy-MM-dd')
				}
				return $.extend({}, d, {
					"filter[day]" : dateParam,
					"filter[type]" : 1,
					"filter[filterCompanys]" : "未定,其他,待定"

				});
			},
			"dataSrc": function (json) { 
				return  rebuidJson(json.content);
            }
		},
		"columns" : [

		{
			"data" : "company.name",
			"defaultContent" : ""
		}, {
			"data" : "cars",
			"defaultContent" : ""
		}, {
			"data" : "buses",
			"defaultContent" : ""
		},

		{
			"data" : "online",
			"defaultContent" : ""
		}, {
			"data" : "orders",
			"defaultContent" : ""
		}, {
			"data" : "nowCanUseCar",
			"defaultContent" : ""
		}, {
			"data" : "nextMonthDown",
			"defaultContent" : ""
		}, {
			"data" : "nextMonthCanUseCar",
			"defaultContent" : ""
		}, {
			"data" : "_onlineBl",
			"defaultContent" : "",
			"render" : function(data, type, row, meta) {
				return data + "%";
			}
		}, {
			"data" : "_useBl",
			"defaultContent" : "",
			"render" : function(data, type, row, meta) {
				return data + "%";
			}
		},

		],
		"language" : {
			"url" : "/js/jquery.dataTables.lang.cn.json"
		},
		"initComplete" : initComplete,
		"drawCallback" : drawCallback,
		"fnDrawCallback" : fnDrawCallback,
		"createdRow": function ( row, data, index ) {
            if (data.company.name =='合计') {
              	$('td', row).css('background-color', '#3bafda');
              	$('td', row).css('white-space', 'nowrap');
            	$('td', row).css('color', 'white');
            }
		}
		
	});
	$('#table1').dataTable().fnNameOrdering();
}

function initComplete(oSettings, json) {
}

function fnDrawCallback() {
}
function drawCallback() {
}