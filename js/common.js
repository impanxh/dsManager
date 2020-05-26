/**
 * 验证相关
 *
 * @param
 */
function percentage(number1, number2) {
	if(number2==0){
		return "";
	}
    return (Math.round(number1 / number2 * 10000) / 100.00 + "%");// 小数点后两位百分比
}
function getParamFromUrl (name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
    var r = window.location.search.substr(1).match(reg);
        if (r != null) return unescape(r[2]); return null;
}
function isNotNull(v) {
	  return typeof(v)!="undefined";
}
function trimToDefault(v,d) {
	  return typeof(v)!="undefined"?v:d;
}

function isNull(v) {
	return !isNotNull(v);
}
/**
 * 获取行内 节点的值 如果不存在返回 d
 *
 * @param row
 *            行对象
 * @param mapGroup
 *            group节点 比如i_Map dt_Map
 * @param field
 *            字段名字
 * @param d
 *            默认值
 * @returns
 */
function getRowFiled(row, mapGroup, field, d) {
	return isNotNull(row[mapGroup]) ? row[mapGroup][field] : d;
}

//查单个数据
function queryForObject(params, toClassName){
	if(isNotNull(params)){
		params.length = 1;
	}
	var t;
	var result = queryByExample(params,toClassName);
	if( isNotNull(result)  && result.totalElements > 0 ){
		if(result.totalElements >1 ){console.warn(" query result totalElements > 1 ");}
		t = result.content[0];
    }
    return t;
}
//查model
function queryByExample(params, toClassName) {
    var settings = {
        "async" : false,
        "crossDomain" : true,
        "url" : "http://" + changeAddr() + "/common/getModelList?filter[className]=" + toClassName ,
        "method" : "POST",
        "data" : params
    }
    var r ;
    $.ajax(settings).done(function(response) {
    	 r = response;
    });
    return r;
}

//查单个数据
function queryForObjectV2(params, toClassName){
	if(isNotNull(params)){
		params.length = 1;
	}
	var t;
	var result = queryByExampleV2(params,toClassName);
	if( isNotNull(result)  && result.totalElements > 0 ){
		if(result.totalElements >1 ){console.warn(" query result totalElements > 1 ");}
		t = result.content[0];
    }
    return t;
}
//查model
function queryByExampleV2(params, toClassName) {
    var settings = {
        "async" : false,
        "crossDomain" : true,
        "url" : "http://" + changeAddr() + "/common/getModelListV2?filter[className]=" + toClassName ,
        "method" : "POST",
        "data" : params
    }
    var r ;
    $.ajax(settings).done(function(response) {
    	 r = response;
    });
    return r;
}


function getUnid() {
	var id;
	$.ajax({
		type : 'GET',
		"async" : false,
		url : 'http://' + changeAddr() + '/getUniqId',
		success : function(data) {
			id = data;
		}
	});
	return id;
}

function saveDataModel(params, toClassName) {
    var settings = {
        "async" : false,
        "crossDomain" : true,
        "url" : "http://" + changeAddr() + "/common/saveModel?className=" + toClassName ,
        "method" : "POST",
        "data" : params
    }
    $.ajax(settings).done(function(response) {
    	console.log(response);

    });
}


function delDataModelV2(params, toClassName) {
    var settings = {
        "async" : false,
        "crossDomain" : true,
        "url" : "http://" + changeAddr() + "/common/delByField?className=" + toClassName ,
        "method" : "get",
        "data" : params
    }
    $.ajax(settings).done(function(response) {
    	console.log(response);

    });
}


//----------------

/**
 * 按序号查费用
 */
function queryFy(list) {
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
    			 r[item.s_Map.seriaNum_s].kcf_d = item.d_Map.zhkcf_d;
        		 r[item.s_Map.seriaNum_s].zzf_d = item.d_Map.zzf_d;
        		 r[item.s_Map.seriaNum_s].hj_d = item.d_Map.hj_d;
    		 }
    		 if(isNotNull( item.s_Map)){
    			 r[item.s_Map.seriaNum_s].hy_s = item.s_Map.hy_s;
    		 }
    		 if(isNotNull( item.dt_Map)){
    			 r[item.s_Map.seriaNum_s].qdrq_dt = item.dt_Map.qdrq_dt;
    			 r[item.s_Map.seriaNum_s].yjsksj_dt = item.dt_Map.yjsksj_dt;
    		 }


    	  });
    }
  });
     return r;
}



//-------

function queryUserGroup(uid){
	var s;
	  $.ajax({
          type: 'GET',
          async: false,
          url: 'http://'+changeAddr()+'/userCode?userid='+uid,
          success:function(data) {
          	s = data;
          $('#code_s').val(data[3]);
          }
      });
      //console.log(s);
      return s;
}


function isNotEmptyString(str) {
	if (str != null && str != undefined && str != "") {
		return true;
	}
	return false;
}
function isPasswd(s) {
	var patrn=/^(.){6,20}$/;
	if (!patrn.test(s)) return false
		return true
}
function checkUserName(str){
	var re=/^[A-Za-z0-9\._'\u4e00-\u9fa5]+$/ig;
	if (!re.test(str)) return false
   		return true
}

function checkID(value, element) {
	var tmpValue = $.trim(value);
	var pattern =/^[a-zA-Z][a-zA-Z0-9_]{4,11}$/;
	if (tmpValue != ''){
		if(pattern.test(tmpValue)){
			return true;
		}
	}
    return false;
}

function checkPassword(value, element) {
	var tmpValue = $.trim(value);
	var pattern =/^[a-zA-Z0-9_]{8,16}$/;
    if (tmpValue != ''){
		if(pattern.test(tmpValue)){
			return true;
		}
	}
    return false;
}

function checkChinese(value, element) {
	var tmpValue = $.trim(value);
	var pattern = /^[u4E00-u9FA5]+$/;
	if (tmpValue != ''){
		if(!pattern.test(tmpValue)){
			return true;
		}
	}
	return false;
}

var tableId="tbl";
var oddRowColor="#f1f1f1";
var evenRowColor="#fff";
var hoverRowColor="#C6D7F8";
var highlightRowColor="#FFD460";
function senfe(o,a,b,c,d) {
	var t=document.getElementById(o).getElementsByTagName("tr");
	for(var i=0;i<t.length;i++) {
		t[i].style.backgroundColor=(t[i].sectionRowIndex%2==0)?a:b;
		t[i].onclick=function() {
			var td = this.getElementsByTagName("td")[0];
			var ck = null;
			if (td != null) {
				ck = td.firstChild;
			}
			if(this.x!="1"){
				this.x="1";
				this.style.backgroundColor=d;
				if (ck != null) {
					ck.checked = true;
				}
			} else {
				this.x="0";
				this.style.backgroundColor=(this.sectionRowIndex%2==0)?a:b;
				if (ck != null) {
					ck.checked = false;
				}
			}
		}
		t[i].onmouseover=function() {
			if(this.x!="1")this.style.backgroundColor=c;
		}
		t[i].onmouseout=function() {
			if(this.x!="1")this.style.backgroundColor=(this.sectionRowIndex%2==0)?a:b;
		}
	}
}

function checkAll(tblId, selector) {
	var len = $(selector).length;
	if (len > 0) {
		var t=document.getElementById(tblId).getElementsByTagName("tr");
		if ($('#checkAll').attr("checked") == "checked") {
			$(selector).attr("checked", "checked");

			for(var i=1;i<t.length;i++) {
				t[i].x="1";
				t[i].style.backgroundColor=highlightRowColor;
			}
		}
		else {
			$(selector).attr("checked", false);
			for(var i=1;i<t.length;i++) {
				t[i].x="0";
				t[i].style.backgroundColor=(t[i].sectionRowIndex%2==0)?evenRowColor:oddRowColor;
			}
		}
	}
}

//检查标题，只允许中文、英文、数字、下划线
function chkTitle(str, minlen, maxlen){
	var re = /^[A-Za-z0-9_\u4e00-\u9fa5]+$/ig;
	if(re.test(str)){
		var ret = true;
		if(typeof minlen == 'number'){
			if(str.length < minlen) ret = false;
		}
		if(typeof maxlen == 'number'){
			if(str.length > maxlen) ret = false;
		}
		return ret;
	}else{
		return false;
	}
}

//检查面板标题，只允许中文、英文、数字、下划线[]
function chkPanelTitle(str, minlen, maxlen){
	var re = /^[A-Za-z0-9_\[\]\u4e00-\u9fa5]+$/ig;
	if(re.test(str)){
		var ret = true;
		if(typeof minlen == 'number'){
			if(str.length < minlen) ret = false;
		}
		if(typeof maxlen == 'number'){
			if(str.length > maxlen) ret = false;
		}
		return ret;
	}else{
		return false;
	}
}

//检查是否英文字母、数字和下划线
function checkTXT(str){
	var re = /^[a-zA-Z0-9_-]{4,16}$/;
	return re.test(str);
}

//检查是否为正确姓名格式
function checkRName(str){
	var re  = /^[\u4E00-\u9FA5A-Za-z]+$/;
	return re.test(str);
}


//验证密码
function checkPassword2(value) {
	var pattern =/^[A-Za-z0-9\W]+$/ig;
	var ret = true;
	if(pattern.test(value)){
		if(value.length < 4) ret = false;
		if(value.length > 12) ret = false;
	}else{
		ret = false;
	}
	return ret;
}

//检查是否7位以内0以上整数
function chkInt(str){
	var re = /^[0-9]{1,7}$/ig;
	return re.test(str);
}

//检查是否为数字（包括整数1-7位以内、小数）
function chkNumber(str){
	var re = /^[0-9]{1,7}((\.[0-9]{1,2}){0,1})?$/ig;
	return re.test(str);
}

//检查是否是7位以内正整数
function chkPositiveInt(str){
	var re = /^[1-9]{1}[0-9]{0,6}$/ig;
	return re.test(str);
}

//检查是否是电话号码
function chkPhone(str){
	var re = /^(1[0-9]{10})$/;
	return re.test(str);
}

//检查是否为正确身份证格式
function chkIdNum(str){
	var re = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
	return re.test(str);
}
//检查是否是邮件地址
function isEmail(str) {
	 var re = /^[0-9a-z][_.0-9a-z-]{0,31}@([0-9a-z][0-9a-z-]{0,30}[0-9a-z]\.){1,4}[a-z]{2,4}$/;
	 return re.test(str);
}
/**
 * type 转显示内容
 * @param typeEn
 * @returns {String}
 */
function getTypeString(typeEn){
	var t= "视频";
	if(typeEn=='video')
		t=("视频");
	if(typeEn=='image')
		t=("图片");
	if(typeEn=='info')
		t=("文本");
	if(typeEn=='body')
		t=("车身");
	if(typeEn=='other')
		t=("其他");
	return t;
}
/**
 * 金额格式化
 * @param num
 * @returns {String}
 */
function formatCurrency(num) {
    num = num.toString().replace(/\$|\,/g,'');
    if(isNaN(num))
    num = "0";
    sign = (num == (num = Math.abs(num)));
    num = Math.floor(num*100+0.50000000001);
    cents = num%100;
    num = Math.floor(num/100).toString();
    if(cents<10)
    cents = "0" + cents;
    for (var i = 0; i < Math.floor((num.length-(1+i))/3); i++)
    num = num.substring(0,num.length-(4*i+3))+','+
    num.substring(num.length-(4*i+3));
    return (((sign)?'':'-') + num + '.' + cents);
}

function saveMsg(){
	var uniqId_s =  getUnid();
	 $('#uniqId_s').val(uniqId_s);
	var dialog = YDUI.dialog;
	var _action = $('#msgForm').attr("action");
	var checkText=$("#hyType_s").find("option:selected").text();
	var sort_s=$("#hySort_s").find("option:selected").text();
	var template1 = "&hyid_s={0}&regionid_s={1}";
	var p = template1.format(checkText,sort_s);

	$('#msgForm').attr("action", _action + p);
	console.log($('#msgForm').attr("action"));


	$('#msgForm').ajaxForm(function(data) {
	if (data.status == 200) {

	  var obj = queryForObject({"filter[uniqId_s_s]":uniqId_s},'Unit');
		  if(isNotNull(obj) && isNotNull(obj.s_Map) ){
		   //console.log("########->:"+obj.id)
			  initPrecautionItems(obj.id, "Equip");
			  initPrecautionItems(obj.id, "Tech");
			  initPrecautionItems(obj.id, "Person");
			  initPrecautionItems(obj.id, "Mind");
		  }
		$('#savebt').attr("disabled","true");
		$("#savebt").css("background-color", "#85A2AD");
		var uptime = window.setTimeout(function() {
		dialog.toast("保存成功", 'none', 1000);
		window.location.href="${rc.contextPath}/placeManage?unit="+getQueryString("industry");
			clearTimeout(uptime);
		}, 2000)
	} else {
		dialog.toast("保存失败", 'none', 1000);
	}
}).submit();
}
