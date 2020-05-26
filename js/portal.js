function relogin() {
	var params = getEssentialParams();
	window.location.href = "login.html?" + params;
}

function getUrl() {
	var pos, str, para, parastr;
	var array = {}

	str = location.href;
	parastr = str.split("?")[1];
	var arr = parastr.split("&");
	for (var i = 0; i < arr.length; i++) {
		array[arr[i].split("=")[0]] = arr[i].split("=")[1];
	}

	return array;
}

function getQueryString(name) {
	var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
	var r = window.location.search.substr(1).match(reg);
	if (r != null)
		return unescape(r[2]);
	return null;
}

function getEssentialParams() {
	var userip = getQueryString("userip");
	var acname = getQueryString("acname");
	var nasid = getQueryString("nasid");
	var stationid = getQueryString("stationid");
	var ssid = getQueryString("ssid");

	var params = "userip=" + userip + "&acname=" + acname + "&nasid=" + nasid +
		"&stationid=" + stationid + "&ssid=" + ssid;
	return params;
}

function loginCost(pageid) {
	var acname = getQueryString("acname");
	var nasid = getQueryString("nasid");
	var timestart = getQueryString("timestart");
	if(acname == null || nasid == null || timestart == null) {
		return;
	}

	var params = {};
	params["acname"] = acname;
	params["nasid"] = nasid;
	params["timestart"] = timestart;
	params["pageid"] = pageid;
	try {
	    $.ajax({
	        type: "POST",
	        url: "/logincost",
	        data: params,
	        datatype: "json"
	    });
	}catch(err){}

}

function logout() {
    var acname = getQueryString("acname");
    var userip = getQueryString("userip");
    if(acname == null || userip == null) {
        alert("链接错误，无法登出");
        return;
    }

    var params = {};
    params["acname"] = acname;
    params["userip"] = userip;
    $.ajax({
        type: "POST",
        url: "/direct_logout",
        data: params,
        datatype: "json",
        success: function(data) {
            var msg = eval("(" + data + ")");
            if (msg.result == 'OK') {
				window.location.href = "login.html?" + getEssentialParams();
            } else {
                alert(msg.message);
            }
        },
        error: function() {
            alert("发送登出请求失败，请重试")
        }
    });
}

function stats(id) {
    var count = "http://112.4.28.125:8081/afstat?adid=" + id;
    try{
        jQuery.ajax({
            type: "GET",
            url: count,
            crossDomain : true
        });
    }catch(err){}

}

function createToken(mobile) {
	$.ajax({
		type: "GET",
		url: "/sms",
		data: {
			"mobile": mobile,
			"ak": "01ae192ed44911e4bb0f000c29ee072d"
		},
		datatype: "json",
		beforeSend: function() {
			$("#msg").html("获取动态验证码");
		},
		success: function(data) {
			var msg = eval("(" + data + ")");
			if (msg.result == 'OK') {
				var u = navigator.userAgent;
				var isiOS = !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/); //ios终端
				if(isiOS)
				{
					alert("中国移动提醒您：验证码已发送, 请注意查收,可向下滑动屏幕查看短信");
				}
				else
				{
					alert("中国移动提醒您：验证码已发送, 请注意查收");
				}
				
			} else {
				alert(msg.message);
			}
		},
		error: function() {
			alert("发送认证请求失败, 请重试")
		}
	});
}

function auth(params) {
	$.ajax({
		type: "POST",
		url: "/auth",
		data: params,
		datatype: "json",
		beforeSend: function() {
			$("#msg").html("开始认证");
		},
		success: function(data) {
			var msg = eval("(" + data + ")");
			if (msg.result == 'OK') {
				var u = navigator.userAgent;
				var isiOS = !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/); //ios终端
				if(isiOS) {
				window.location.href = "http://andfree.cn/successIOS.html" + window.location.search + "&username=" + params["username"];
				} else {
				window.location.href = "http://andfree.cn/successCL.html" + window.location.search + "&username=" + params["username"];
				}
				
			} else {
				if (msg.errcode == 1){
					// 认证失败或者内部错误
					window.location.href = "error.html" + window.location.search + "&errmsg=" + msg.message;
				} else {
					// 用户输入错误
					alert(msg.message);
				}
			}
		},
		error: function() {
			alert("发送认证请求失败，请重试")
		}
	});
}

function auth_with_input(username, token) {
	var params = {}

	// Check username and token
	if (username == null || username == '') {
		alert("请输入用户名");
		return;
	}
	params["username"] = username;

	if (token == null || token == '') {
		alert("请输入短信验证码");
		return;
	}
	params["token"] = token;

	// Fetch the params
	var pos, urlstr, paramstr;
	urlstr = location.href;
	pos = urlstr.indexOf("?");
	if(pos == -1)
	{
		alert("链接不完整");
		return;
	}

	paramstr = urlstr.substr(pos+1);
	pos = paramstr.indexOf("&");
	if(pos == -1)
	{
		alert("链接不完整");
		return;
	}
	var arr = paramstr.split("&");
	for (var i = 0; i < arr.length; i++) {
		params[arr[i].split("=")[0]] = arr[i].split("=")[1];
	}
	auth(params);
}
