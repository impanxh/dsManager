var bConnect = 0;
function loadUKeyInfoFromUKey() {
    //如果是IE10及以下浏览器，则跳过不处理
    if(isMSIE()) {
		fillUKeyInfo4MSIE();
        return true;
    }

    try {
        var s_pnp = new SoftKey6W();
        s_pnp.Socket_UK.onopen = function() {
            bConnect = 1; //代表已经连接，用于判断是否安装了客户端服务
			fillUKeyInfoFromUKey();
        }
        //在使用事件插拨时，注意，一定不要关掉Socket，否则无法监测事件插拨
        s_pnp.Socket_UK.onmessage = function got_packet(Msg) {
            var PnpData = JSON.parse(Msg.data);
            if(PnpData.type == "PnpEvent") { //如果是插拨事件处理消息
                if(PnpData.IsIn){
                    //alert("UKEY已被插入，被插入的锁的路径是：" + PnpData.DevicePath);
                    if(!fillUKeyInfoFromUKey()) {
						window.location.reload();
					}
                } else {
                    //alert("UKEY已被拨出，被拨出的锁的路径是：" + PnpData.DevicePath);
                    window.location.reload();
					//$("#ukey").val("");
                }
            }
        }

        s_pnp.Socket_UK.onclose = function() {
        }
    } catch(e) {
        alert( e.name + ": " + e.message);
        return false;
    }
}

function fillUKeyInfo4MSIE() {
    var DevicePath, ret, n, mylen;
    try {
        //建立操作我们的锁的控件对象，用于操作我们的锁
        var s_simnew1;
        //创建控件
        s_simnew1 = new ActiveXObject("Syunew6A.s_simnew6");
        //查找是否存在锁,这里使用了FindPort函数
        DevicePath = s_simnew1.FindPort(0);
        if( s_simnew1.LastError != 0 ) {
            //alert("未发现加密锁或者加密锁已拔出，请插入加密锁再刷新此页面");
            return false;
        }

        //读取锁的ID
        var keyId = toHex(s_simnew1.GetID_1(DevicePath)) + toHex(s_simnew1.GetID_2(DevicePath));
        if( s_simnew1.LastError != 0 ) {
            //alert("返回ID号错误，错误码为：" + s_simnew1.LastError.toString());
            return false;
        }

        //获取设置在锁中的用户名
        //先从地址0读取字符串的长度,使用默认的读密码"FFFFFFFF","FFFFFFFF"
        ret = s_simnew1.YRead(0, 1, "ffffffff", "ffffffff", DevicePath);
        mylen = s_simnew1.GetBuf(0);
        //再从地址1读取相应的长度的字符串，,使用默认的读密码"FFFFFFFF","FFFFFFFF"
        var username = s_simnew1.YReadString(1, mylen, "ffffffff", "ffffffff", DevicePath);
        if( s_simnew1.LastError != 0 ) {
            alert("读取用户名时错误，错误码为：" + s_simnew1.LastError.toString());
            return false;
        }

		$("#ukey").val(keyId);
		if(username == "inTheFirstPlace") {
			$("#username").val("");
		} else {
			$("#username").val(username);
		}

		/*

        //获到设置在锁中的用户密码,
        //先从地址20读取字符串的长度,使用默认的读密码"FFFFFFFF","FFFFFFFF"
        ret = s_simnew1.YRead(20, 1, "ffffffff", "ffffffff", DevicePath);
        mylen = s_simnew1.GetBuf(0);
        //再从地址21读取相应的长度的字符串，,使用默认的读密码"FFFFFFFF","FFFFFFFF"
        var password = s_simnew1.YReadString(21, mylen, "ffffffff", "ffffffff", DevicePath);
        if( s_simnew1.LastError != 0 ) {
            alert("读取用户密码时错误，错误码为：" + s_simnew1.LastError.toString());
            return false;
        }
		//$("#Password").val(password);
        */
        return true;
    }
    catch (e)
    {
        alert(e.name + ": " + e.message + "。可能是没有安装相应的控件或插件");
		return false;

    }
}

function fillUKeyInfoFromUKey() {
    //判断是否安装了服务程序，如果没有安装提示用户安装
    if(bConnect == 0) {
        //alert( "未能连接服务程序，请确定服务程序是否安装");
        return false;
    }
	var keyId = "";
	var username = "";
    var DevicePath, ret, n, mylen, ID_1, ID_2, addr;
    try {
        	//由于是使用事件消息的方式与服务程序进行通讯，
        	//好处是不用安装插件，不分系统及版本，控件也不会被拦截，同时安装服务程序后，可以立即使用，不用重启浏览器
        	//不好的地方，就是但写代码会复杂一些
        	var s_simnew1 = new SoftKey6W(); //创建UK类

        	s_simnew1.Socket_UK.onopen = function() {
            	s_simnew1.ResetOrder();//这里调用ResetOrder将计数清零，这样，消息处理处就会收到0序号的消息，通过计数及序号的方式，从而生产流程
        	}

        	//写代码时一定要注意，每调用我们的一个UKEY函数，就会生产一个计数，即增加一个序号，较好的逻辑是一个序号的消息处理中，只调用我们一个UKEY的函数
        	s_simnew1.Socket_UK.onmessage = function got_packet(Msg) {
            var UK_Data = JSON.parse(Msg.data);
            if(UK_Data.type != "Process") { return true; }//如果不是流程处理消息，则跳过
            switch(UK_Data.order) {
                case 0:
                    {
                        s_simnew1.FindPort(0);//发送命令取UK的路径
                    }
                    break;//!!!!!重要提示，如果在调试中，发现代码不对，一定要注意，是不是少了break,这个少了是很常见的错误
                case 1:
                    {
                        if(UK_Data.LastError != 0){
                            //alert( "未发现加密锁，请插入加密锁");
                            s_simnew1.Socket_UK.close();
                            return false;
                        }
                        DevicePath = UK_Data.return_value;//获得返回的UK的路径
                        s_simnew1.GetID_1(DevicePath); //发送命令取ID_1
                    }
                    break;
                case 2:
                    {
                        if(UK_Data.LastError != 0){
                            //alert("返回ID号错误，错误码为：" + UK_Data.LastError.toString());
                            s_simnew1.Socket_UK.close();
                            return false;
                        }
                        ID_1 = UK_Data.return_value;//获得返回的UK的ID_1
                        s_simnew1.GetID_2(DevicePath); //发送命令取ID_2
                    }
                    break;
                case 3:
                    {
                        if(UK_Data.LastError != 0){
                            //alert("取得ID号错误，错误码为：" + UK_Data.LastError.toString());
                            s_simnew1.Socket_UK.close();
                            return false;
                        }
                        ID_2 = UK_Data.return_value;//获得返回的UK的ID_2
                        keyId = toHex(ID_1)+toHex(ID_2);
						$("#ukey").val(keyId);
                        s_simnew1.ContinueOrder();//为了方便阅读，这里调用了一句继续下一行的计算的命令，因为在这个消息中没有调用我们的函数，所以要调用这个
                    }
                    break;
                case 4:
                    {
                        //获取设置在锁中的用户名
                        //先从地址0读取字符串的长度,使用默认的读密码"FFFFFFFF","FFFFFFFF"
                        addr=0;
                        s_simnew1.YRead(addr,1,"ffffffff","ffffffff",DevicePath);//发送命令取UK地址0的数据
                    }
                    break;
                case 5:
                    {
                        if( UK_Data.LastError != 0){
                            //alert("读数据时错误，错误码为：" + UK_Data.LastError.toString());
                            s_simnew1.Socket_UK.close();
                            return false;
                        }
                        s_simnew1.GetBuf(0);//发送命令从数据缓冲区中数据
                    }
                    break;
                case 6:
                    {
                        if( UK_Data.LastError != 0){
                            //alert("调用GetBuf时错误，错误码为：" + UK_Data.LastError.toString());
                            s_simnew1.Socket_UK.close();
                            return false;
                        }
                        mylen = UK_Data.return_value;//获得返回的数据缓冲区中数据

                        //再从地址1读取相应的长度的字符串，,使用默认的读密码"FFFFFFFF","FFFFFFFF"
                        addr = 1;
                        s_simnew1.YReadString(addr,mylen, "ffffffff", "ffffffff", DevicePath);//发送命令从UK地址1中取字符串
                    }
                    break;
                case 7:
                    {
                        if( UK_Data.LastError != 0){
                            //alert("读取字符串时错误，错误码为：" + UK_Data.LastError.toString());
                            s_simnew1.Socket_UK.close();
                            return false;
                        }
                        username = UK_Data.return_value;//获得返回的UK地址1的字符串

						//$("#ukey").val(keyId);
						if(username == "inTheFirstPlace") {
							$("#username").val("");
						} else {
							$("#username").val(username);
						}

                        //获到设置在锁中的用户密码,
                        //先从地址20读取字符串的长度,使用默认的读密码"FFFFFFFF","FFFFFFFF"
                        addr = 20;
                        s_simnew1.YRead(addr,1,"ffffffff","ffffffff",DevicePath);//发送命令取UK地址20的数据
                    }
                    break;
                case 8:
                    {
                        if(UK_Data.LastError != 0){
                            //alert("读数据时错误，错误码为：" + UK_Data.LastError.toString());
                            s_simnew1.Socket_UK.close();
                            return false;}
                        s_simnew1.GetBuf(0);//发送命令从数据缓冲区中数据
                    }
                    break;
                case 9:
                    {
                        if(UK_Data.LastError != 0) {
                            //alert("调用GetBuf时错误，错误码为：" + UK_Data.LastError.toString());
                            s_simnew1.Socket_UK.close();
                            return false;
                        }
                        mylen=UK_Data.return_value;//获得返回的数据缓冲区中数据

                        //再从地址21读取相应的长度的字符串，,使用默认的读密码"FFFFFFFF","FFFFFFFF"
                        addr=21;
                        s_simnew1.YReadString(addr,mylen,"ffffffff", "ffffffff", DevicePath);//发送命令从UK地址21中取字符串
                    }
                    break;
                case 10:
                    {
                        if(UK_Data.LastError != 0){
                            //alert("读取字符串时错误，错误码为：" + UK_Data.LastError.toString());
                            s_simnew1.Socket_UK.close();
                            return false;
                        }
                        var password = UK_Data.return_value;//获得返回的UK中地址21的字符串
						//$("#Password").val(password);

                        //所有工作处理完成后，关掉Socket
                        s_simnew1.Socket_UK.close();
                    }
                    break;
            }
        }
        s_simnew1.Socket_UK.onclose = function(){

        }
        return true;
    } catch (e) {
        alert(e.name + ": " + e.message);
		return false;
    }
}

function writeUKey4MSIE(username, password)
{
    try
    {
        var DevicePath,mylen,ret;
        //建立操作我们的锁的控件对象，用于操作我们的锁
        var s_simnew1;
        //创建控件
        s_simnew1 = new ActiveXObject("Syunew6A.s_simnew6");

        //查找是否存在锁,这里使用了FindPort函数
        DevicePath = s_simnew1.FindPort(0);
        if( s_simnew1.LastError!= 0 )
        {
            //alert("未发现加密锁或者锁已拔出，请插入加密锁并刷新此页面");
            return false;
        }
        else
        {
            //写入用户名到地址1，使用默认的写密码"FFFFFFFF","FFFFFFFF"
            mylen = s_simnew1.YWriteString(username, 1, "ffffffff", "ffffffff", DevicePath);
            if( s_simnew1.LastError != 0 )
            {
                //alert("写入用户名失败。错误码是：" + s_simnew1.LastError.toString());
                return false;
            }
            s_simnew1.SetBuf(mylen, 0);
            //写入用户名的字符串长度到地址0，使用默认的写密码"FFFFFFFF","FFFFFFFF"
            ret = s_simnew1.YWrite(0, 1, "ffffffff", "ffffffff", DevicePath);
            if( ret != 0 )
            {
                //alert("写入用户名长度失败。错误码是：" + s_simnew1.LastError.toString());
                return false;
            }

            //写入用户密码到地址21，使用默认的写密码"FFFFFFFF","FFFFFFFF"
            mylen = s_simnew1.YWriteString(password, 21, "ffffffff", "ffffffff", DevicePath);
            if( s_simnew1.LastError != 0 )
            {
                //alert("写入用户密码失败。错误码是：" + s_simnew1.LastError.toString());
                return false;
            }
            s_simnew1.SetBuf(mylen, 0);
            //写入用户名密码的字符串长度到地址20，使用默认的写密码"FFFFFFFF","FFFFFFFF"
            ret = s_simnew1.YWrite(20, 1, "ffffffff", "ffffffff",DevicePath);
            if( ret != 0 )
            {
                //alert("写入用户密码长度失败。错误码是：" + s_simnew1.LastError.toString());
                return false;
            }

            return true;
        }
    }
    catch(e)
    {
        alert(e.name + ": " + e.message);
        return false;
    }
}

function writeUKey(username, password)
{
    if(username == "") {
        alert("用户名不能为空。");
        return false;
    }

    if(password == "") {
        password = "12345678";
    }

    //如果是IE10及以下浏览器，则使用AVCTIVEX控件的方式
    if(isMSIE()) {
        return writeUKey4MSIE(username, password);
    }

    //判断是否安装了服务程序，如果没有安装提示用户安装
    if(bConnect == 0)
    {
        //alert( "未能连接服务程序，请确定服务程序是否安装。");
        return false;
    }

    var DevicePath,ret,n,mylen,addr;
    try
    {
        //由于是使用事件消息的方式与服务程序进行通讯，
        //好处是不用安装插件，不分系统及版本，控件也不会被拦截，同时安装服务程序后，可以立即使用，不用重启浏览器
        //不好的地方，就是但写代码会复杂一些
        var s_simnew1 = new SoftKey6W(); //创建UK类

        s_simnew1.Socket_UK.onopen = function() {
            s_simnew1.ResetOrder();//这里调用ResetOrder将计数清零，这样，消息处理处就会收到0序号的消息，通过计数及序号的方式，从而生产流程
        }

        //写代码时一定要注意，每调用我们的一个UKEY函数，就会生产一个计数，即增加一个序号，较好的逻辑是一个序号的消息处理中，只调用我们一个UKEY的函数
        s_simnew1.Socket_UK.onmessage = function got_packet(Msg) {
            var UK_Data = JSON.parse(Msg.data);
            if(UK_Data.type != "Process") return;//如果不是流程处理消息，则跳过
            switch(UK_Data.order)
            {
                case 0:
                {
                    s_simnew1.FindPort(0); //发送命令取UK的路径
                }
                    break;//!!!!!重要提示，如果在调试中，发现代码不对，一定要注意，是不是少了break,这个少了是很常见的错误
                case 1:
                {
                    if(UK_Data.LastError != 0 ){
                        //alert( "未发现加密锁，请插入加密锁");
                        s_simnew1.Socket_UK.close();
                        return false;
                    }
                    DevicePath = UK_Data.return_value;//获得返回的UK的路径

                    //写用户名
                    //写入用户名到地址1，使用默认的写密码"FFFFFFFF","FFFFFFFF"
                    addr = 1;
                    s_simnew1.YWriteString(username, addr, "ffffffff", "ffffffff", DevicePath);
                }
                    break;
                case 2:
                {
                    if(UK_Data.LastError != 0){
                        //alert("写入用户名失败。错误码为：" + UK_Data.LastError.toString());
                        s_simnew1.Socket_UK.close();
                        return false;
                    }
                    mylen = UK_Data.return_value;
                    s_simnew1.SetBuf(mylen, 0);//设置要字符串的长度到缓冲区中，
                }
                    break;
                case 3:
                {
                    if(UK_Data.LastError != 0){
                        //alert("调用SetBuf时错误，错误码为：" + UK_Data.LastError.toString());
                        s_simnew1.Socket_UK.close();
                        return false;
                    }

                    //写入缓冲区的数据即用户名的字符串长度到地址0，使用默认的写密码"FFFFFFFF","FFFFFFFF"
                    addr = 0;
                    s_simnew1.YWrite(addr, 1, "ffffffff", "ffffffff", DevicePath);
                }
                    break;
                case 4:
                {
                    if(UK_Data.LastError != 0){
                        alert("写入用户名长度失败。错误码为：" + UK_Data.LastError.toString());
                        s_simnew1.Socket_UK.close();
                        return false;
                    }
                    //写用户密码
                    //写入用户密码到地址21，使用默认的写密码"FFFFFFFF","FFFFFFFF"
                    addr = 21;
                    s_simnew1.YWriteString(password, addr, "ffffffff", "ffffffff", DevicePath);
                }
                    break;
                case 5:
                {
                    if(UK_Data.LastError != 0){
                        //alert("写入用户密码失败。错误码为：" + UK_Data.LastError.toString());
                        s_simnew1.Socket_UK.close();
                        return false;
                    }
                    mylen = UK_Data.return_value;
                    s_simnew1.SetBuf(mylen, 0);//设置要字符串的长度到缓冲区中，
                }
                    break;
                case 6:
                {
                    if(UK_Data.LastError != 0){
                        //alert("调用SetBuf时错误，错误码为：" + UK_Data.LastError.toString());
                        s_simnew1.Socket_UK.close();
                        return false;
                    }
                    //写入用户名密码的字符串长度到地址20，使用默认的写密码"FFFFFFFF","FFFFFFFF"
                    addr = 20;
                    s_simnew1.YWrite(addr, 1, "ffffffff", "ffffffff",DevicePath);
                }
                    break;
                case 7:
                {
                    if(UK_Data.LastError != 0){
                        //alert("写入用户密码长度失败，错误码为：" + UK_Data.LastError.toString());
                        s_simnew1.Socket_UK.close();
                        return false;
                    }

                    //所有工作处理完成后，关掉Socket
                    s_simnew1.Socket_UK.close();
                }
                    break;
            }
        }

        s_simnew1.Socket_UK.onclose = function(){

        }
        return true;
    }

    catch(e)
    {
        alert(e.name + ": " + e.message);
        return false;
    }

}
