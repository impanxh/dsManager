/**
 * 按英文车型查下面有多少线数
 * @param modelName
 */
function reFreshTotalInfo(modelName){
    			 $.ajax({
					    			url:"/bus/getLineCountByModelName",
					    			type:"POST",
					    			data:{"modelName":modelName},
					    			async:false,
					    			dataType:"json",
					    			success:function(data){
					    			var w='';
					    			$("#modelGroupView").html(w);
						    			if(typeof(data)!="undefined"){
						    			   w+="车型:"+modelName+" 线路数："+data;
						    			   $("#modelGroupView").html(w);
						    			}
					    			}
					       }); 
	  } 