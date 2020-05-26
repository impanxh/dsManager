
var swift_tableObject;



function goV2Detail(r){
    window.location.href = r;
 }




function submitPlan(){
    	layer.open({
		type: 1,
		title: "电子合同",
		skin: 'layui-layer-rim', 
		area: ['650px', '630px'], 
		content:''
		   +' '
		   +'<iframe  style="width:99%;height:90%" src="/user/busContract_templete?productid=1"/><div class="ui-form-item widthdrawBtBox"><input type="hidden" id ="cc" class="layui-layer-ico layui-layer-close layui-layer-close1"/> <input type="button" id="subWithdraworder" class="block-btn" onclick="creorder();" value="确认" style="margin:10px 0px -10px 110px;"> </div>'
		});
}

function creorder(){
	$.ajax({
		url:"/product/ajax-sift_buildPlan",
		type:"POST",
		async:false,
		dataType:"json",
		data : {
			"seriaNum":  $("#sn").val()
		},
		success:function(data){
			if (data.left == true) {
				layer.msg("下单成功");
				$("#cc").trigger("click");
				
				 var uptime = window.setTimeout(function(){
                     window.location.href=pathurl+"/product/busOrderV2_list/my";
                     clearTimeout(uptime);
                 },1500);
				 
				 
			} else {
				layer.msg(data.right.msg,{icon: 5});
			}
		}
  }); 
	$('#sendToServer').removeAttr('onclick');
	$("#sendToServer").html('<font color="red">订单已提交!</font>');
	$(".del").css("display","none");
}

function addPlan(pathurl){
	var select=$("#sh").val();
	var lc=$("#lc").val();
	if(lc=="0"){
		islogin(pathurl);
		return;
	}
	if(select =='' ){
		layer.msg("请选择车辆类型!",{icon: 5});
		return ;
	}
	var lc = $("#lc").val()
	if(lc ==0 ){
		layer.msg("为了便于记录,请先登录!",{icon: 5});
		return ;
	}
	$.ajax({
		url:"/product/sift_addPlan/",
		type:"POST",
		async:false,
		dataType:"json",
		data : {
			"select" : $("#sh").val(),
			"number" : $("#busNumber").val(),
			"startDate1" : $("#startDate1").val(),
			"seriaNum":  $("#sn").val()
		},
		success:function(data){
			
			if (data.left == true) {
				//	swift_tableObject.fnDraw();;
				layer.msg("增加计划成功!");
					swift_tableObject.dataTable()._fnAjaxUpdate();
			} else {
				bb=false;
				layer.msg(data.right.msg,{icon: 5});
			}
		}
  }); 
	
}


function delPlan(id){
	$.ajax({
		url:"/product/ajax-delPlan",
		type:"GET",
		async:false,
		dataType:"json",
		data : {
			"id" : id,
		},
		success:function(data){
			if (data.left == true) {
					layer.msg("删除成功!");
					swift_tableObject.dataTable()._fnAjaxUpdate();
			} else {
				layer.msg(data.right.msg,{icon: 5});
			}
		
		}
  }); 
}


function queryPrice(){
	var c= $('#busNumber').val();
	var ex = /^\d+$/;
	if (!ex.test(c)) {
		c=1;
	}
	$.ajax({
		url:"/product/sift_SelectBodyPrice",
		type:"GET",
		async:false,
		dataType:"json",
		data : {
			"select" : $("#sh").val(),
		},
		success:function(data){
			if(data>0){
				var t='<strong class="swift-bprice" id="jd-price">￥'+(data*c)+'</strong>';
				$("#pd").html(t);
				$("#btn").show();
			}else {
				$("#pd").html("");
				$("#btn").hide();
			}
		}
  }); 
}

function getPriceAndSort(){
	var w='';
	var p=$("#ascOrDesc").val();
	var price1=$("#price1").val();
	var price2=$("#price2").val();
	w+="&filter[p]="+p
	if(price1!=null && price2!=null && Number(price1)>0 && Number(price2)>0 ){
		if(Number(price1) >= Number(price2)){
			layer.msg("价格区间大小不符合实际!",{icon: 5});
			return 
		}
	}
	if(price1!=null){
		w+="&filter[price1]="+Number(price1);
	}
	if(price2!=null){
		w+="&filter[price2]="+Number(price2);
	}
	return w;
}

function initPro(pathUrl,sh,page){
	$("#productList").html("");
	var pw=getPriceAndSort();;
	$.ajax({
		url : pathUrl + "/carbox/sift_body?filter[sh]="+sh+"&length=10&page="+page+pw,
		data:{},
		type : "POST",
		success : function(data) {
			var initPagination = function() {
				var num_entries = data.totalElements;
				// 创建分页
				$("#Pagination").pagination(num_entries, {
					num_edge_entries: 1, //边缘页数
					num_display_entries: 4, //主体页数
					callback: pageselectCallback,
					items_per_page:data.size, //每页显示1项,
					prev_text:'<',
					next_text:'>',
					prev_show_always:false,
					next_show_always:false

				});
			 }();
			 
			function pageselectCallback(page_index, jq){
				initPro2(pathUrl,sh,page_index*data.size);
				return false;
			}
				
		}}, "text");
}
function initPro2(pathUrl,sh,page){
	$("#productList").html("");
	var pw=getPriceAndSort();;
	$.ajax({
		url : pathUrl + "/carbox/sift_body?filter[sh]="+sh+"&length=10&start="+page+pw,
		data:{},
		type : "POST",
		success : function(data) {
			var k=1;
			$.each(data.content,function(i,item){
				
				var dDecker= item.doubleDecker ?"双层":"单层";
				var leval ='';
				if(item.leval=='S'){
					leval="特级";
				}else if(item.leval=='APP'){
					leval="A++";
				}else if(item.leval=='AP'){
					leval="A+";
				}else if(item.leval=='A'){
					leval="A";
				}else if(item.leval=='LATLONG'){
					leval="经纬线";
				}
					
					
				  
				
				$("#productList").prepend(
						"<div class=\"cont\">"+
						"<div class=\"activity inline-b\"><span><a href='"+pathUrl+"/b/public_detail/"+item.id+"'>"+item.jpaProductV2.name.substring(0,7)+"</a></span>&nbsp;&nbsp;"+dDecker+("&nbsp;&nbsp;"+leval)+"</div>"+
						"<div class=\"price inline-b\" style=\"  margin-top: 10px; \">"+
						"<input type=\"hidden\" id='pid_"+k+"' value='"+item.id+"'/>"+
						"<p class=\"p-one\"> 	<em>"+item.price+"</em>元/月/辆</p>"+
						"<p class=\"p-two\">"+item.jpaProductV2.personAvg+"人次/月</p></div>"+
						"<div class=\"num f-left inline-b\">"+
						"<input type=\"button\" class=\"icon f-left dec\" sot='"+k+"' id='leftDec"+k+"' />"+
						"<input class='f-left' sot='"+k+"' id='sum_"+k+"' value=\"0\">"+
						"<input type=\"button\" class=\"icon f-left plus\" sot='"+k+"' id='leftPlus"+k+"' /></div>"+
						"<div class=\"map f-left inline-b\">"+
						"<div class=\"map-box\"></div></div></div>"
				);
				$("#sum"+k).blur(function(){
					var sot=$(this).attr("sot");
					var lc=$("#lc").val();
					if(lc=="0"){
						islogin(pathUrl);
					}
					if(lc=="1"){
						$.ajax({
							url : pathUrl + "/carbox/saveCard/body",
							data:{"proid":$("#pid_"+sot).val(),"needCount":$("#sum_"+sot).val(),"IsDesign":0},
							type : "POST",
							success : function(data) {
								/*$("#totalnum").val(data.right);
								$("#totalprice").val(data.left);*/
								setCarCount(data.cardCount);
								setCarCount(data.cardCount_top);
								//$("#cardCount").html("[<b>"+data.cardCount+"</b>]");
						}}, "text");
					}
					
				});
				
				$("#leftDec"+k).click(function(){
					var oldValue=$(this).next().val();//获取文本框对象现有值
					var lc=$("#lc").val();
					if(lc=="0"){
						islogin(pathUrl);
					}
					if(lc=="1"){
						if(oldValue>0){
							$(this).next().val(parseInt(oldValue)-1);
							var sot=$(this).attr("sot");
							$.ajax({
								url : pathUrl + "/carbox/saveCard/body",
								data:{"proid":$("#pid_"+sot).val(),"needCount":$("#sum_"+sot).val(),"IsDesign":0},
								type : "POST",
								success : function(data) {
									setCarCount(data.cardCount);
									setCarCount(data.cardCount_top);
									//$("#cardCount").html("[<b>"+data.cardCount+"</b>]");
							}}, "text");
						}
					}
					
				});
				$("#leftPlus"+k).click(function(){
					var lc=$("#lc").val();
					if(lc=="0"){
						islogin(pathUrl);
					}
					var oldValue=$(this).prev().val();//获取文本框对象现有值
					$(this).prev().val(parseInt(oldValue)+1);
					var sot=$(this).attr("sot");
					if(lc=="1"){
						$.ajax({
							url : pathUrl + "/carbox/saveCard/body",
							data:{"proid":$("#pid_"+sot).val(),"needCount":$("#sum_"+sot).val(),"IsDesign":0},
							type : "POST",
							success : function(data) {
								//$("#cardCount").html("[<b>"+data.cardCount+"</b>]");
								setCarCount(data.cardCount);
								setCarCount(data.cardCount_top);
							}}, "text");	
					}
					
				}); 
				k++;
			});
		}}, "text");
}

function initSwift2(purl){
/*	swift_tableObject =table;*/
	 
    $('.item i').hide();
      	var isClick = false;
      	$('.sift-list .item').click(function(){

      		if(isClick){
      			 
      			$(this).removeClass('active');
      			isClick = false;
      			if(($(this).parent().has('.active')).length==0){
      				$(this).parent().children().first().addClass("active");
      			}
      		}else{
      			if($(this).attr("sort")==-3){
      				layer.msg("该城市暂未开放,敬请期待",{icon: 5});
      				return ;
      			 }
      			
      			$(this).addClass('active');
	      		$(this).children().show();
	      		$(this).parent().children().first().removeClass("active");

	      		//add by impanxh
      			if($(this).attr("sort")==-1){
      				var list=$(this).parent().children();
      				$(this).parent().children().removeClass("active");
 					$(this).parent().children().first().addClass("active");
 					//$(this).addClass("active");
      			 }
      		}
      		//add by impanxh
      		var sendContext='';
			$('.sift-list .active').each(function(){
				sendContext+=($(this).parent().attr("qt")+"_"+$(this).attr("qc"))+",";			
			});
			$("#sh").val(sendContext);
			//
			
			//queryPrice();
			initPro(purl,sendContext,0)
			//重新画
			/* table.fnDraw();*/
			//alert($("#sh").val());
			

      	});
      	$('i').click(function(){
      		$(this).hide();
      		isClick = true;
      		
      	});
      	initCardView(purl);
	
}