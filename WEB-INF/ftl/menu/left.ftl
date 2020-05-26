<#assign security=JspTaglibs["/WEB-INF/tlds/security.tld"] />

<style type="text/css">
.side-exp-select {
	cursor: pointer;
	color: #fff;
	background: #7fd4f3;
}

.side-exp-p-select .pg-side-item-t {
	color: #fff !important;
	background: #2da7e0;
}

.newflag{
              background-color: #ff9966;
              color: #fff;
              font-size: 14px;
              border-radius: 4px;
              padding:3px 6px;
              margin-left: 5px;
            }
</style>
<script type="text/javascript"
		src="/js/task.js?v=20170725"></script>
<script type="text/javascript">
$(document).ready(function() {
    //	getCount('','n');
    } );
</script>



<div id="treeTips" style="overflow: hidden; display: none;"><span id="slideIn" title="展开"></span>打开导航菜单</div>
<div class="ls-2">
<div id="treeTips_out" style="overflow: hidden; display: block;"><span id="slideOut" title="收起"></span>收起导航菜单</div>
	<div class="pg-side">

					
				<@security.authorize  access="hasAuthority('source')">
					<li class="pg-side-item"><a class="pg-side-item-t aa-icon">
					 <i
							class="s-left pg-icon-a c-icon"></i>资源管理
					</a>
							<li class="pg-side-exp-item"><a class="side-exp-item-t"
								href="${rc.contextPath}/-/cityMediaBase_Table"> 基础信息 </a></li>

							<li class="pg-side-exp-item"><a class="side-exp-item-t"
								href="${rc.contextPath}/-/cityMediaPrice_Table"> 公交车报价表 </a></li>
						
					</li>
			</@security.authorize>
				

			<@security.authorize  access="hasAuthority('contract')">
					<li class="pg-side-item"><a class="pg-side-item-t aa-icon"> <i
							class="s-left pg-icon-a o-icon"></i>合同管理
					</a>
							<li class="pg-side-exp-item"><a class="side-exp-item-t"
								href="${rc.contextPath}/-/cityMediaContract_Table"> 合同进度表 </a></li>

								<li class="pg-side-exp-item"><a class="side-exp-item-t"
								href="${rc.contextPath}/-/cityMediaPlan_Table"> 付款进度表 </a></li>
			
							
					</li>
			</@security.authorize>

			<li class="pg-side-item"><a class="pg-side-item-t ee-icon"> <i
					class="s-left pg-icon-a e-icon"></i>用户管理
			</a>
				<@security.authorize  access="hasAuthority('sys_userList')">
				<li class="pg-side-exp-item"><a class="side-exp-item-t"
						href="${rc.contextPath}/user/bodyuserlist?subUType=0"> 用户列表 </a></li>
				</@security.authorize>


					<li class="pg-side-exp-item"><a class="side-exp-item-t"
						href="${rc.contextPath}/user/qualification"> 用户信息 </a></li>
					<li class="pg-side-exp-item"><a class="side-exp-item-t"
						href="${rc.contextPath}/user/edit_pwd"> 修改密码 </a></li>
			</li>



	</div>
</div>
<script type="text/javascript">
	$('#treeTips').click(function(){
		$(this).hide();
		$('.ls-2').show();
		$('.ls-10').css("width","85%");
		$('.ls-10').css("margin-left","30px");
  	});

	$('#treeTips_out').click(function(){
		$('.ls-2').hide();
		$('#treeTips').show();
		$('.ls-10').css("width","97%");
		$('.ls-10').css("margin-left","30px");
  	});

	function active(menu) {
		$(".pg-side-item").each(function() {
			if (menu) {
				var curr = $(this);
				var st = 0;

				var list = $(this).find(".side-exp-item-t");
				list.each(function() {
					if ($(this).text().trim() == menu) {
						curr.find(".pg-side-exp-list").show();
						$(this).addClass("side-exp-select");
						curr.addClass("side-exp-p-select");
						st = 1;
					}
				});

				//try to find from top level
				if (st == 0 && list.length == 0) {
					var top = $(this).find(".pg-side-item-t");
					if (top.text().trim() == menu) {
						curr.addClass("side-exp-p-select");
						st = 1;
					}
				}
				if (st == 0) {
					curr.find(".pg-side-exp-list").hide();
				}

			}

			var active = $(this).find(".side-exp-item-t.active");
			if (!active[0]) {
				// $(this).find(".pg-side-exp-list").hide();
			} else {
				//  $(this).find(".pg-side-exp-list").show();
			}

		});
	}

	$(document)
			.ready(
					function() {
						//move single sub-menu to top
						$(".pg-side-item")
								.each(
										function() {
											var list = $(this)
													.find(
															".pg-side-exp-list .side-exp-item-t");
											if (list.length == 1) {
												var top = $(this).find(
														".pg-side-item-t");
												if (top) {
													top.attr("href", $(list[0])
															.attr("href"));
													top.find(".pg-icon-a")[0].nextSibling.data = $(
															list[0]).text();
													$(this)
															.find(
																	".pg-side-exp-list")
															.remove();
												}
											}
										});

						//open selected menu
						var menu = '<#if menu??>${menu}<#else></#if>';
						$(".pg-side-item-t").click(
								function() {
									$(this).parent(".pg-side-item").find(
											".pg-side-exp-list").toggle();
								});

						active(menu);
						var wlt=window.location.host;
						if(wlt.indexOf(":")!=-1){
							wlt = window.location.host.split(":")[0];
						}
						var logHref= wlt + ":9109/sq";
						if(logHref.indexOf("http")==-1){

							logHref = ("http://" + logHref);
						}
						$('#_log').attr('href',logHref);
					});
</script>


	<#--
	<script type="text/javascript"> $(document).ready(function() { initExportExcelPushLet("/sysmsg"); } );</script>
	-->




<!--

source,contract,sys_userList--

<@security.authorize  access="hasAuthority('sys_userList')">sys_userList </@security.authorize>	
<@security.authorize  access="hasAuthority('contract1')">contract </@security.authorize>	
<@security.authorize  access="hasAuthority('source1')">source </@security.authorize>	


-->
