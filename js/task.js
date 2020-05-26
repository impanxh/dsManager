

;var mapObj={};
var taskUserJson={};
function getMapRole(){
     
     $.ajax({
        url: 'http://'+changeAddr()+'/task/roles',
        type: 'GET',
        async:false,
        dataType: 'json',
        success : function(data){
           mapObj=data; 
        }
      });
}
function getSelectTaskUser(t) {
	var list = taskUserJson[t];
	var r = "";
	if (isNotNull(list)) {
		r = "<select>  ";
		$.each(list, function(index, content) {
			r += "<option value ='" + content + "'>" + content + "</option>"
		});
		r += "</select>"
	}
	return r;

}
function taskUser(){
    $.ajax({
       url: 'http://'+changeAddr()+'/taskUser',
       type: 'GET',
       async:false,
       dataType: 'json',
       success : function(data){
    	   taskUserJson = data; 
       }
     });
}


function countTask(userId,type){
     $.ajax({
        url: 'http://'+changeAddr()+'/task/count?filter[userId]='+userId,
        type: 'GET',
        async:false,
        dataType: 'json',
        success : function(data){
           $("#t0").html(data.normal+data.spc);
           $("#t1").html(data.spc);
           if(isNotNull(data.desingCount)){
        	   $("#_dsheetCount").html(data.desingCount);
           }
          
           if(isNotNull(data.shjCount)){
        	   $("#_productionCount").html(data.shjCount);  
           }
         
           if(isNotNull(data.bigImgCount)){
        	   $("#_bigimgCount").html(data.bigImgCount);  
           }
           if(isNotNull(data.problemxCount)){
        	   $("#_qstsCheckCount").html(data.problemxCount);  
           }
           if(isNotNull(data.problemmjCount)){
        	   $("#_qstsMediaCount").html(data.problemmjCount);  
           }
           
           if(isNotNull(data.skQrCount)){
        	    $("#_skQrCount").html(data.skQrCount);  
           } 
           if(isNotNull(data.skDetailCount)){
        	    $("#_skDetailCount").html(data.skDetailCount);  
           } 
           if(isNotNull(data.skOffworknoteCount)){
        	    $("#_skOffworknoteCount").html(data.skOffworknoteCount);  
           } 
           if(isNotNull(data.skCancelCount)){
        	    $("#_skCancelCount").html(data.skCancelCount);  
           } 
          
        }
      });
}


function getCount(userId,type){
     $.ajax({
        url: 'http://'+changeAddr()+'/task/count?filter[userId]='+userId,
        type: 'GET',
        async:false,
        dataType: 'json',
        success : function(data){
        	var c = 0;
        	 if(isNotNull(data.desingCount)){
        		c+= data.desingCount;
        		 $("#_dsheetCount").html(data.desingCount);
        	 }
             if(isNotNull(data.shjCount)){
                c += data.shjCount;
                $("#_productionCount").html(data.shjCount); 
             }
             if(isNotNull(data.bigImgCount)){
         		c += data.bigImgCount;
         		$("#_bigimgCount").html(data.bigImgCount); 
             }
             if(isNotNull(data.problemxCount)){
                 c += data.problemxCount;
          	     $("#_qstsCheckCount").html(data.problemxCount);  
             }
             if(isNotNull(data.problemmjCount)){
            	 c+= data.problemmjCount;
          	    $("#_qstsMediaCount").html(data.problemmjCount);  
             } 
             //---
             if(isNotNull(data.skQrCount)){
            	 c+= data.skQrCount;
          	    $("#_skQrCount").html(data.skQrCount);  
             } 
             if(isNotNull(data.skDetailCount)){
            	 c+= data.skDetailCount;
          	    $("#_skDetailCount").html(data.skDetailCount);  
             } 
             if(isNotNull(data.skOffworknoteCount)){
            	 c+= data.skOffworknoteCount;
          	    $("#_skOffworknoteCount").html(data.skOffworknoteCount);  
             } 
             if(isNotNull(data.skCancelCount)){
            	 c+= data.skCancelCount;
          	    $("#_skCancelCount").html(data.skCancelCount);  
             } 
            
                  
                 
        	
           $("#t2").html(parseInt(data.normal)+parseInt(data.spc)+c);
           
           $("#t0").html(data.normal+data.spc);
           $("#t1").html(data.spc);
        }
      });
}