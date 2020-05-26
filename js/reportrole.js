
function queryReportRole4Kzx(list) {
      var r={};
    $.ajax({
    url : 'http://' + changeAddr() + '/common/getModelList?filter[className]=ReportRole&length=10000',
    type : 'POST',
    async : false,
    dataType : 'json',
    data: {'filter[seriaNum_s_s_L]':list},
    success : function(data) {
    	  $.each(data.content, function(i, item){
    		 r[item.s_Map.seriaNum_s]  = {};
    		 if(isNotNull( item.d_Map)){
    			 r[item.s_Map.seriaNum_s].d_Map = item.d_Map;
    			 r[item.s_Map.seriaNum_s].zyzx_d_d = item.d_Map.zyzx_d_d;
        		 r[item.s_Map.seriaNum_s].cbs_d_d = item.d_Map.cbs_d_d;
        		 r[item.s_Map.seriaNum_s].qc_d_d = item.d_Map.qc_d_d;
        		 r[item.s_Map.seriaNum_s].bm_d_d = item.d_Map.bm_d_d;
        		 
    		 }
    		
    		  
    	  });
    }
  });
     return r;
}