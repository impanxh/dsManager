function loadsch(){
	 					var postData={"length":5000,"order[0][unitName_s_s]":'asc'};
			 		var schList = queryByExample(postData,"Unit");
			 		console.log(schList);
			 		if(isNotNull(schList) && isNotNull(schList.content) ){
			 		var t='';
			 		t+='<select class="ui-input ui-input-mini" name="sch" id="sch_id" style="width:235px">';
			 		t+='<option value="">请选择学校</option>';
			 		   $.each( schList.content, function(index, data){
						t+='<option value="'+data.id+'">'+data.s_Map.unitName_s+'</option>'
						});
			 		}
			 		t+='</select>';
			 		 $("#c3").html(t);
}