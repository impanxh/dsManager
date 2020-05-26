function activitiAll(tag){
		if(typeof(tag) == "undefined"){
			return ;
		}
		if(tag==0){
			clearAll(tag);
			return ;
		}
	$('.sift-branch .item').each(function(){
			if(($(this).attr("bhc").indexOf(tag))!=-1){
				$(this).show();
				$(this).addClass('active');
				$(this).children().show();
    		    }else{
    			   if($(this).attr("class").indexOf("active")==-1){
    			  }
    			}
		});
}
function clearAll(tag){
	if(typeof(tag) == "undefined"){
		return ;
	}
	$('.sift-branch .item').each(function(){
			if(($(this).attr("bhc").indexOf(tag))!=-1){
			$(this).removeClass('active');
			}
		});
}


function selectModel(table,draw){
    $('.item i').hide();
      	var isClick = false;
      	$('.sift-list .item').click(function(){
      		if(isClick){
      			
      			var qc=$(this).attr("qc");
      			if($(this).attr("pid")==0){
      				$('.sift-desc  .item').each(function(){
      					if(($(this).attr("desc").indexOf(qc))!=-1){
      						$(this).removeClass('active');
      						$(this).hide();
      					}
      				});
      			}
      			$(this).removeClass('active');
      			isClick = false;
      			var isTopSelect =0;//是否有选择大类
      			var bottonSelect=0;
      			//判断激活个数】
      			$('.sift-wide .active').each(function(){
      				if($(this).attr("pid")==0 ){
      					//alert($(this).attr("qc"));
      					isTopSelect++;
      				}
      			});
      			
      			//取 大类
      			var sz=[],containSz=[];
      			$('.sift-wide .item').each(function(){
      				if($(this).attr("pid")==0   ){
      					sz.push($(this).attr("qc"));
      				}
      			});
      			
      			//取激活中的大类
      			$('.sift-desc .active').each(function(){
      				var currQc=$(this).attr("desc");
      				//判断是否有子类选中
      				 if(currQc.indexOf('all')==-1){
      					bottonSelect++;
      				 }
      				$.each( sz, function(i, n){ 
	      					if(currQc.indexOf(n)!=-1){
	      						if($.inArray(n, containSz)<0){
	      							containSz.push(n);	
	      						}   
	      					}
          			});
      				 
    			});
      			if(isTopSelect>0){
      				 //根据小类决定大类生死
          			$('.sift-wide .item').each(function(){
          				if($(this).attr("pid")==0   ){
          					if($.inArray($(this).attr("qc"), containSz)<0){
          						$(this).removeClass("active");
          						var pid=$(this).attr("qc");
          						$('.sift-desc .item').each(function(){
          							if($(this).attr("desc").indexOf(pid)!=-1){
          								$(this).hide();
          							}
          						});
          					}
          				}
          			});
      			}
      			//alert("isTopSelect="+isTopSelect+" bottonSelect="+bottonSelect);
      			//最后全部暗示 如果没有一个小类选中，如果没有显示全部
      			if(bottonSelect==0){
	      			 $('.sift-desc  .item').each(function(){
	   					if($(this).attr("sort")!=-1){
	   					$(this).show();
	   					$(this).removeClass('active');
	   					}
	   				});
	      			//$(this).parent().children().first().addClass("active");
	      			$('.sift-wide').first().addClass("active");
     			}
      			//-------branch逻辑 
      			var bh=$(this).attr("bh");
      			clearAll(bh);
      		} else {
      			//-------branch逻辑 
      			var bh=$(this).attr("bh");
      			activitiAll(bh);
      			$(this).addClass('active');
	      		$(this).children().show();
	      		$(this).parent().children().first().removeClass("active");
      			if($(this).attr("sort")==-1 ){
      				//判断是否是大类的所有
      				if($(this).parent().attr("class").indexOf("active")!=-1){
      					$('.sift-desc  .item').each(function(){
          					if($(this).attr("sort")!=-1){
          					$(this).show();
          					$(this).children().show();
          					$(this).removeClass('active');
          					}
          				});
      					
      				}
      				
      				var list=$(this).parent().children();
      				$(this).parent().children().removeClass("active");
 					$(this).parent().children().first().addClass("active");
      			 }
      			if($(this).attr("pid")>=0){
		      			var c=0;
		      			$('.sift-list .item').each(function(){
		      				if($(this).attr("pid")==0 && $(this).attr("class").indexOf("active")!=-1 ){
		      					c++;
		      				}
		      			});
		      			if(c>0){
		      				$('.sift-desc  .item').each(function(){
		    					$(this).hide();
		    					$(this).removeClass("active");
		    				});
		      			}
		      			$('.sift-list .item').each(function(){
		  					if($(this).attr("pid")==0 && $(this).attr("class").indexOf("active")!=-1 ){
		  					 var qc=$(this).attr("qc");
		  					
		  					$('.sift-desc  .item').each(function(){
		      					if(($(this).attr("desc").indexOf(qc))!=-1){
		      						$(this).show();
		      						$(this).addClass('active');
		      		      		    $(this).children().show();
		      		      		    }else{
		      		      			   if($(this).attr("class").indexOf("active")==-1){
		      		      			  }
		      		      			}
		      				});
  					
		  					
  					}
  				});}
      			
      		}
      		// add by impanxh
      		var sendContext='';
			$('.sift-list .active').each(function(){
				sendContext+=($(this).parent().attr("qt")+"_"+$(this).attr("qc"))+",";			
			});
			console.log(sendContext);
			$("#sh").val(sendContext);
			// 重新画
			if(draw=="draw"){
				table.draw();
			}else{
				table.draw();
			}
			
      	});
      	$('.sift-list i').click(function(){
      		$(this).hide();
      		isClick = true;
      	});
}
