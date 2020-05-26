var table2;

function initTable2() {
	
	 table2 = $('#table1').DataTable( {
         "dom": '<"#toolbar">Bfrt',
          buttons: [
				 {
               extend: 'excelHtml5',
                text: '导出excel',
               className: 'green'
           },
			],
           "searching": false,
           "ordering": false,
           "serverSide": true,
             "scrollX": true,
           "columnDefs": [
               { "orderable": false, "targets": [0] },
           ],
           "iDisplayLength" : 400,
           "aLengthMenu": [[400, 2000,50000], [400, 2000, '全部']],
           "ajax": {
               type: "GET",
               url:  "http://"+changeAddr()+"/bi/ajax_yeahMonth",
               data : function(d) {
				var dateParam = $('#startDate1').val();
				if (typeof (dateParam) == "undefined") {
					dateParam = $.format.date(new Date(), 'yyyy-MM-dd')
				}
				return $.extend({}, d, {
					"month" : dateParam

				});
			},
			 "dataSrc": function (json) { 
                 return json;
             }
		},
		"columns" : [  {"data" : "modelType",	"defaultContent" : ""},
		               {"data" : "level",	"defaultContent" : ""},
		               {"data" : "l2016",	"defaultContent" : ""},
		               {"data" : "l2017",	"defaultContent" : ""},
		               {"data" : "ltb",	"defaultContent" : ""},
		               
		               {"data" : "ldjl",	"defaultContent" : ""},
		               {"data" : "llastMonth",	"defaultContent" : ""},
		               {"data" : "lhb",	"defaultContent" : ""},
		               {"data" : "llastMonthDjl",	"defaultContent" : ""},
		               {"data" : "b2016",	"defaultContent" : ""},
		               
		               {"data" : "b2017",	"defaultContent" : ""},
		               {"data" : "btb",	"defaultContent" : ""},
		               {"data" : "bdjl",	"defaultContent" : ""},
		               {"data" : "blastMonth",	"defaultContent" : ""},
		               {"data" : "bnb",	"defaultContent" : ""},
		               
		               {"data" : "blastMonthDjl",	"defaultContent" : ""},
		               {"data" : "z2016",	"defaultContent" : ""},
		               {"data" : "z2017",	"defaultContent" : ""},
		               {"data" : "ztb",	"defaultContent" : ""},
		               {"data" : "zlastMonth",	"defaultContent" : ""},
		               
		               {"data" : "zhb",	"defaultContent" : ""}
		               

		],
		"language" : {
			"url" : "/js/jquery.dataTables.lang.cn.json"
		},
		 "preDrawCallback": preDrawCallback ,
		   "drawCallback": drawCallback,
		"createdRow": function ( row, data, index ) {
          
			/*if (data.rowType != 'Normal') {
             	$('td', row).css('background-color', '#3bafda');
              	$('td', row).css('white-space', 'nowrap');
            	$('td', row).css('color', 'white');
            }*/
		}
	});
	  $('#table1').dataTable().fnNameOrdering("orderBy").fnNoColumnsParams();
      $('#table1').dataTable().fnFakeRowspan(0, [0]);
     //  $('#table1').dataTable().fnFakeRowspan(1, [1]);
}

function preDrawCallback(){
    layer.load();
    
}
function drawCallback() {
    layer.closeAll('loading');
 }
