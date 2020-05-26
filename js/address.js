function changeAddr() {
	var addrs = '123.124.138.130:9078';
	return addrs;
}

function getSeriaNumList(seriaNum) {
	$.ajax({
		url : 'http://' + changeAddr() + '/report/getChildSeriaNums/'
				+ seriaNum,
		type : 'GET',
		async : false,
		dataType : 'json',
		success : function(data) {
			var d = seriaNum+",";
			$.each(data, function(i, item) {
				d += item + ',';
			});
			$("#seriaNumList").val(d);
		}
	});

}

function Percentage(number1, number2) {
	if (number2 == 0 ||  (typeof(number2) == "undefined")  ) {
		return '';
	}
	return (Math.round(number1 / number2 * 10000) / 100.00 + "%");// 小数点后两位百分比

}

function setQdrq_dt(qdrq_dt,seriaNum){
	 $.ajax({
   			url:'http://'+changeAddr()+'/report/setQdrq_dt/'+seriaNum,
   			type:"GET",
   			data : {"qdrq_dt":qdrq_dt},
   			dataType:"json",
   			success:function(data){
   			}
		       });
}
function delContractLineGroup(table,seriaNum,qdrq,u){
	 $.ajax({
   			url:'http://'+changeAddr()+'/common/delByField?className=ContractLineGroup&dByField=contractSer_s_s&value='+seriaNum+'&u='+u,
   			type:"GET",
   			async:false,
   			dataType:"json",
   			success:function(data){
	    			saveContractLineGroup(table,seriaNum,qdrq,u);
   			}
		       });
}
function saveContractLineGroup(table,seriaNum,qdrq,u){
	    var c={'自营中心':'ZY','七彩中心':'QC','七彩':'QC','CBS':'CBS','白马':'白马'}
		var obj={};
	    var obj2={};
		table.rows().eq(0).each( function ( index ) {
		var data = table.row( index ).data();



		var cpn=data.line.company.name;
		var t = $("#contractCompany"+data.id).val();
		if(isNotNull(t) && t!=''){
			cpn = t;
		}
		if(isNotNull(data.contract_company) && data.contract_company!='' && (!isNotNull(t)  || t == '') ){
			cpn = data.contract_company;
		}
		console.log(t);
		var days=data.days;
		var mediaType=data.mediaType;
		var key=cpn+'_'+days;
		var key2=cpn+'_'+mediaType;
		    if (typeof(obj[key]) == "undefined"){
							obj[key]={};
							obj[key].days=data.days;
							obj[key].comp=c[cpn];
							obj[key].hjPrice=data.hjPrice;
						} else{
							obj[key].hjPrice=obj[key].hjPrice+data.hjPrice;
						}
		    if (typeof(obj2[key2]) == "undefined"){
		    	obj2[key2]={};
		    	obj2[key2].mediaType=data.mediaType;
		    	obj2[key2].comp=c[cpn];
		    	obj2[key2].hjPrice=data.hjPrice;
		    } else{
		    	obj2[key2].hjPrice=obj2[key2].hjPrice+data.hjPrice;
		    }


		});
		var postUrl='http://' + changeAddr() + '/common/saveModel?className=ContractLineGroup&u='+u;
		var postUrl2='http://' + changeAddr() + '/common/saveModel?className=ContractDoubleCheck&u='+u;

		$.each(obj, function(i, item){
			 var company =item.comp;

		var param= {
		"contractSer_s":seriaNum,
		"company_s":item.comp,
		"qdrq_dt":qdrq,
		"checkUniq":'N',
		"days_i":item.days,
		"sumprice_d":item.hjPrice

		};
		 $.post(postUrl,param, function() {

		});
		});
		//---
		$.ajax({
   			url:'http://'+changeAddr()+'/common/delByField?className=ContractDoubleCheck&dByField=contractSer_s_s&value='+seriaNum+'&u='+u,
   			type:"GET",
   			async:false,
   			dataType:"json",
   			success:function(data){
   			}
		 });


		$.each(obj2, function(i, item){
			var company =item.comp;
			var param= {
					"contractSer_s":seriaNum,
					"company_s":item.comp,
					"qdrq_dt":qdrq,
					"checkUniq":'N',
					"sumprice_d":item.hjPrice,
					"mediaType_s":item.mediaType
			};
			$.post(postUrl2,param, function() {
				});

		});
}



function removeClassN($this){
	var className = "list-img-img";
	if($($this).hasClass("list-img-img")){
		$($this).removeClass("list-img-img");
	}else{
	   $($this).addClass("list-img-img");
	}
}

function getImgTimestamp(image) {
	if(!$(image).hasClass("list-img-img")){
		YDUI.dialog.loading.open('开始获取图片信息');
		EXIF.getData(image, function() {
			var data = EXIF.getTag(this, "DateTime");
			if(data===undefined){
				data = "无法获取拍摄时间。";
			}
			//console.log(data);
			YDUI.dialog.loading.close();
			YDUI.dialog.toast('图片拍摄时间:'+data, 'success', 2000, function () {
				/* 关闭后调用 */
			});
		});
	}
}


function isMobile() {
	var userAgentInfo = navigator.userAgent.toLowerCase();
	var Agents = [ "android", "iphone", "symbianos", "windows phone", "ipad",
			"ipod" ];
	var r = false;
	for (var v = 0; v < Agents.length; v++) {
		if (userAgentInfo.indexOf(Agents[v]) >= 0) {
			r = true;
		}
	}
	return r;
}


