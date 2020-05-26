<#import "../template/template.ftl" as frame> <#global menu="开发注意点">
<@frame.html title="开发注意点">
<script type="text/javascript" language="javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/vue/2.4.1/vue.js"></script>
	<script type="text/javascript" language="javascript"
	src="/js/jquery-2.0.2.min.js"></script>
<style type="text/css">

.l45{margin-left:45px}
ul,li{list-style:none}
a{text-decoration:none; color:#f40;}
a:hover { color:#f60;}
.cls{zoom:1}
.cls:after{content:".";display:block;height:0;clear:both;visibility:hidden}
.link:hover{text-decoration:underline}
hr{height:0;border-left:none;border-right:0;border-top:1px dashed #2d2f34;border-bottom:1px dashed #474954}
.wrapper{width:960px;margin:0 auto}
.rz_content{padding:50px 0;}
.rz_content .wrapper{position:relative;}
.rz_content .line-left{position:absolute;left:0;top:15px;width:70px}
.rz_content .line-right{position:absolute;right:0;top:15px;width:310px}
<#--.rz_content .main{background:url(../images/line-bg.png) repeat-y 249px 0}-->
.rz_content .main .title{position:absolute;line-height:40px;padding-left:67px;left:230px;top:0;color:#58a6fb;font-size:24px;background:url(../images/clock.png) no-repeat left top}
.rz_content .main .year{position:relative;z-index:100}
.rz_content .main .year h2{height:40px;width:170px;padding-right:30px;font-size:24px;line-height:40px;text-align:right}
.rz_content .main .year h2 a{color:#58a6fb}
.rz_content .main .year h2 i{display:block;position:relative;height:0;width:0;left:190px;top:-20px;border-width:6px;border-style:solid;border-color:#59a7fb transparent transparent transparent;-webkit-transition:.5s;-moz-transition:.5s;-ms-transition:.5s;-o-transition:.5s;transition:.5s;-webkit-transform-origin:6px 3px;-moz-transform-origin:6px 3px;-ms-transform-origin:6px 3px;-o-transform-origin:6px 3px;transform-origin:6px 3px}
.rz_content .main .year .list{margin:10px 0;position:relative;overflow:hidden;-webkit-transition:height 1s cubic-bezier(0.025,0.025,0.000,1.115),opacity 1s;-moz-transition:height 1s cubic-bezier(0.025,0.025,0.000,1.115),opacity 1s;-ms-transition:height 1s cubic-bezier(0.025,0.025,0.000,1.115),opacity 1s;-o-transition:height 1s cubic-bezier(0.025,0.025,0.000,1.115),opacity 1s;transition:height 1s cubic-bezier(0.025,0.025,0.000,1.115),opacity 1s}
.rz_content .main .year .list ul{bottom:0}
.rz_content .main .year .list ul li{padding:30px 0;color:#a1a4b8}<!-- background:url(../images/circle.png) no-repeat 235px 31px;-->
.rz_content .main .year .list ul li .date,.rz_content .main .year .list ul li .version{float:left;display:block;clear:left;width:200px;line-height:24px;text-align:right}
.rz_content .main .year .list ul li .date{font-size:18px;line-height:32px;color:#bec1d5}
.rz_content .main .year .list ul li .intro,.rz_content .main .year .list ul li .more{float:left;display:block;width:600px;margin-left:100px;line-height:24px}
.rz_content .main .year .list ul li .intro{font-size:18px;line-height:32px;color:#63d029}
<#--.rz_content .main .year .list ul li.highlight{background-image:url(../images/circle-h.png)}-->
.rz_content .main .year .list ul li.highlight .date,.rz_content .main .year .list ul li.highlight .intro{color:#ec6a13}
.rz_content .wrapper:first-child .main .year.close h2 i{transform:rotate(-90deg);-webkit-transform:rotate(-90deg);-moz-transform:rotate(-90deg);-ms-transform:rotate(-90deg);-o-transform:rotate(-90deg)}
.rz_content .wrapper:first-child .main .year.close .list{opacity:0;height:0!important}
</style>
<script type="text/javascript">







 function uploadDSheetSample(lineId) {
 
  	        var options = {
                url : "/upload/saveSimpleFile",
                type : "POST",
                dataType : "json",
                success : function(data) {
                alert(JSON.stringify(data));
                }
            };
            $("#IMGForm" + lineId).ajaxSubmit(options);
 
 }
   function update2() {
   layer.msg('正在更新请稍等...', function(){
		//关闭后的操作
	});
   $("#id1").html("正在更新请稍等...");
  		 setTimeout("console.log('begin...')", 1000 )
  	  setTimeout("t()", 1000 )
	}
	function t(){
	
	$.ajax({
			url : '/SQ/updatesys',
			type : 'GET',
			async : false,
			dataType : 'json',
			success : function(data) {
				 $("#id1").html(data.right.replace(/\n/g, "<br>"));
			}
		});
	
	}
	<!--
	 $(function(){
            var userList = new Array();  
          userList.push({"selectByField":"id","id":"3b37b372-4922-4f5f-be6a-a281e9ad759d",name_s: "李四s1111111s",pwd_s: "123","className":"Test1" , "checkUniq":"Y"});   
          userList.push({name_s: "李四",pwd_s: "1232","className":"Test1" , "checkUniq":"N"}); 
          var data = JSON.stringify(userList);
            console.log(data);
		$.ajax({
			url : 'http://60.205.183.191:9009/common/saveModelBatch',
			type : 'POST',
			dataType : 'json',
			contentType: "application/json; charset=utf-8",//contextType must add so server can know requestType
			"data" : data,
			success : function(data) {
			  console.log(data);
			}
		});

     })
     -->

</script>     

<div class="rz_content">
	<div class="wrapper">
		<hr class="line-left">
		<hr class="line-right">
		<div class="main">
				<div class="list">
					<ul>
				
 
				 <li class="cls highlight">
							<p class="date">通用接口</p><br>
							<p class="intro">更新记录</p>
							<div class="more">
                              <p>1. freemarker 取得参数 RequestParameters <a target='_blank' href='http://pridesnow.iteye.com/blog/568601'>  http://pridesnow.iteye.com/blog/568601</a>
                              <#--	<#if RequestParameters['id']??>
										 <#assign abc=RequestParameters['id'] />
										 ${abc!''}
										 <#if abc == "27cc9eab-72d8-4b2b-9b66-6b7970d7b250">
										     xxx
										 </#if>
										 </#if>
									 ${(RequestParameters['id1'])!''}  --> </p>
							</div>
				    </li>
				    
				    <br>    <br>
				     <li class="cls highlight" style ="font-size:small">
							<p class="intro" style="color:red">权限标签 判断是否有权限[需要去掉@前面空格]</p>
							<div class="more">
                              <p>  < @security.authorize  access="hasAuthority('sys_userList')"> 这里表示有用户列表权限	< /@security.authorize><br>
							</p>
							</div>
				    </li>
				       <br>
				    	<li class="cls highlight">
							<p class="intro">系统资源[权限]</p>
							<div class="more">
                              <p>1.url: sys/queryAllFunctions <font color='#ec6a13'> <a target='_blank' href='/sys/queryAllFunctions'>查看 </a></font> </p>
							</div>
				    </li>
				    
				    
				    <br>
				    	<li class="cls highlight">
							<p class="intro">用户权限数据</p>
							<div class="more">
                              <p>1.url: user/sessions <font color='#ec6a13'> <a target='_blank' href='/user/sessions'>用户登录数据查看 </a></font> </p>
                              <p>2.结果:  authorities 表示所有的权限</p>
							</div>
				    </li>
				    
				    
				    <br>
				    	<li class="cls highlight">
							<p class="intro">查权限下用户</p>
							<div class="more"> 
                              <p>1.url: sys/queryUserByFunction?keyid= <font color='#ec6a13'> 
                              <a target='_blank' href='/sys/queryUserByFunction?keyid=sys_userList'>比如 sys_userList</a></font> </p>
                              <p>2.权限用户树:  sys/groupUserByFunction   <font color='#ec6a13'> 
                              <a target='_blank' href='/sys/groupUserByFunction'>查看</a></font> </p>
							</div>
				    </li>
				    
				    
				      <br>
				    	<li class="cls highlight">
							<p class="intro">行业和辖区接口</p>
							<div class="more"> 
                              <p>1.url:  http://60.205.183.191:9109/common/getModelList?filter[className]=industry 
                               <p>2.行业:  &filter[type_s_s]=industry  
                               <p>3.辖区:  &filter[type_s_s]=region    
							</div>
				    </li>
				    
				    
				    
				    
				   
				    <form id="IMGForm5acaff8f-42d1-4407-a0ae-f0083f94f947" method="post" enctype="multipart/form-data"><a class="table-link operation" 
				    onclick="11('5acaff8f-42d1-4407-a0ae-f0083f94f947');">----------</a>&nbsp;&nbsp;<br><br>
				    <input uuid="5acaff8f-42d1-4407-a0ae-f0083f94f947"
				     id="IMG5acaff8f-42d1-4407-a0ae-f0083f94f947" name="1" 
				    onchange="uploadDSheetSample('5acaff8f-42d1-4407-a0ae-f0083f94f947')" style="width:200px;height:35px;" type="file"></form>
				     

						 
				   </ul>
                </div>
            </div>
			 
			 
			</div>
		</div>
	</div>
</div>


 <div id="app">
     <br>
    <button v-on:click="createds">测试jquery加载数据</button>
    <table border="1">
      <tr v-for="data in datas">
        <td>{{data.id}}</td>
        <td>{{data.id}}</td>
        <td>{{data.id}}</td>
      </tr>
    </table>
  </div>
<script type="text/javascript">
  $(function() {
  //----
    var modVue = new Vue({
            el: '#app',
                data: {
                    datas: {}
                },
                methods: {
                    createds: function () {
                        var _self = this;
                        $.ajax({
                            type: 'GET',
                            url: 'http://60.205.183.191:9109/common/getModelList?filter[className]=industry',
                            success:function(data) {
                            	console.log(data.content);
                                _self.datas = data.content;
                            }
                        });
                    }
                }
        })
       
		modVue.createds();

   });//--
</script>     

<!--   ${.now?string('yyyy-MM-dd hh:mm')} s2 ss-->

</@frame.html>
