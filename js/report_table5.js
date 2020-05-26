var table5;

function initTable5() {
	table5 = $('#table5').DataTable({
		"dom" : '<"#toolbar2">t',
		"searching" : false,
		"ordering" : true,
		"serverSide" : true,
		"scrollX" : true,
		"aaSorting" : [ [ 2, "asc" ] ],
		"columnDefs" : [ {
			"orderable" : false,
			"targets" : [ 10,1, 9,0,3,4,5,6,7,8 ]
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
					"filter[type]" : 3,
					"filter[companyName]" : "CBS"

				});
			},
			"dataSrc" : "content",
		},
		"columns" : [
		  {
			"data" : "company.name",
			"defaultContent" : "" 
		}, {
			"data" : "typeStr",
			"defaultContent" : "" ,
			"render" : function(data, type, row, meta) {
				 if(row.rowType == 'TotalSum'){
					return '合计';
				}
				return data ;
		}
		},{
			"data" : "leverStr",
			"defaultContent" : "",
			"render" : function(data, type, row, meta) {
				if(row.rowType == 'SmallSum'){
					return '小计';
				}else if(row.rowType == 'TotalSum'){
					return '';
				}
				return data;
			}
		}, {
			"data" : "cars",
			"defaultContent" : ""
		}, {
			"data" : "buses",
			"defaultContent" : ""
		}, {
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
		},"createdRow": function ( row, data, index ) {
            if (data.rowType != 'Normal') {
             	$('td', row).css('background-color', '#3bafda');
              	$('td', row).css('white-space', 'nowrap');
            	$('td', row).css('color', 'white');
            }
		}
	});
	$('#table5').dataTable().fnFakeRowspan(0, [0]);
//.fnNameOrdering("orderBy").fnNoColumnsParams();
	$('#table5').dataTable().fnFakeRowspan(1, [1]);
	$('#table5').dataTable().fnNameOrdering();
}
