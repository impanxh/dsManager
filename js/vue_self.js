var vm
function vAdd(){
	var vmtype_s = $('#type_s').val();
            vm = new Vue({
                el : '#pMsg',
                data :{
					policeSMsg:{},
					policeList:{},
					pId:'',
                },
                methods: {
                    submit:function(){
						var url;
						if(this.policeSMsg.id){
							url= 'http://' + changeAddr() + '/common/saveModelV2?className=industry&selectByField=id&id='+this.policeSMsg.id+'&checkUniq=Y';
						}else{
							url = 'http://' + changeAddr() + '/common/saveModelV2?className=industry&checkUniq=N';
							this.policeSMsg.ID_INCREMENT="Y";
						}
						this.policeSMsg.type_s=vmtype_s;
						if(vmtype_s=="rsub"){
							if(isNotNull(this.pId)){
								this.policeSMsg.pId_s = this.pId;
							}else{
								layer.msg('请选择所属派出所.');
								return;
							}
						}else if(vmtype_s=="region"){
							if(!isNotNull(this.policeSMsg.name_s)){
								layer.msg('请输入派出所名称.');
								return;
							}
						}
						this.$http.post(url,this.policeSMsg,{
                            emulateJSON:true
                        }).then(function(res){
							$('#subutton').attr("disabled","true");
							$("#subutton").css("background-color", "#85A2AD");
							layer.msg("添加成功.");
							table.fnDraw(true);
							var uptime = window.setTimeout(function(){
								window.location.reload();
								clearTimeout(uptime);
							},1000);
                        },function(res){
                            layer.msg("内容保存失败.");
                        });
					},

					queryData:function(id){
						if(id){
							var obj = queryForObjectV2({"filter[id]":id},'industry');
							if(isNotNull(obj) ){
								this.policeSMsg = obj;
								this.pId = obj.pId_s;
								this.queryPolice();
							}
						}
					},

					delDate :function(id){
						if(id){
							if(vmtype_s =='region'){
								var rusbExit = queryForObjectV2({"filter[pId_s_s]":id},'industry');
								if(isNotNull(rusbExit)){
									layer.msg("删除失败,该数据下面有关联的辖区.");
									return
								}
								var urole = queryForObjectV2({"filter[placeIds_s_s]":id},'urole');
								if(isNotNull(urole)){
									layer.msg("删除失败,该数据下面有关联的用户.");
									return
								}
								var unitExist = queryForObjectV2({"filter[hySort_s_s]":id},'Unit');
								if(isNotNull(unitExist)){
									layer.msg("删除失败,该数据下面有关联单位.");
									return
								}
							}
							if(vmtype_s =='industry'){
								var urole = queryForObjectV2({"filter[industry_s_s]":id},'urole');
								if(isNotNull(urole)){
									layer.msg("删除失败,该数据下面有关联的用户.");
									return
								}
								var unitExist = queryForObjectV2({"filter[hyType_s_s]":id},'Unit');
								if(isNotNull(unitExist)){
									layer.msg("删除失败,该数据下面有关联单位.");
									return
								}
							}
							if(vmtype_s =='rsub'){


								var urole = queryForObjectV2({"filter[region_s_s]":id},'urole');
								if(isNotNull(urole)){
									layer.msg("删除失败,该数据下面有关联的用户.");
									return
								}
								var unitExist = queryForObjectV2({"filter[code_s_s]":id},'Unit');
								if(isNotNull(unitExist)){
									layer.msg("删除失败,该数据下面有关联单位.");
									return
								}
							}


							var obj = delDataModelV2({"value":id,"dByField":"id"},'industry');
							layer.msg("删除成功.");
                            table.fnDraw(true);
						}
					},


					queryPolice: function(){
						var postData = {"filter[type_s_s]":"region"};
						this.policeList = queryByExampleV2(postData,"industry").content;
					}

                }
			});
}