//author :pxh 

/**
 * 返回 重新加载数据
 * @param def
 * @param listObj
 * @param page
 * @param tagetContextDivId
 * @param templeteDivId
 * @returns
 */
function reloadPage(def, listObj, lastVisitPage, requestjson) {
	requestjson.page = lastVisitPage;
	requestjson.start = (requestjson.page - 1) * requestjson.pageSize;
	var html = '';
	listObj.forEach(function(val) {
		var list = val.list;
		list.page = val.page;
		html += template(requestjson.templeteDivId, {
			list : list,
			page : val.page
		});
	});
	$('#' + requestjson.listContent_id).append(html);
	def.resolve();
	return def.promise();
}
function _isNotNull(v) {
	  return typeof(v)!="undefined";
}

var sessionStorage ;

function loadScrollTable(requestjson,loadMore){
	//{"sectionId":'J_List',"pageSize":10,"templeteDivId":"J_templete","listContent_id":J_ListContent};
	
	  $('#'+requestjson.sectionId).infiniteScroll({
          binder: '#'+requestjson.sectionId,
          pageSize: requestjson.pageSize,
          initLoad: true,
          backposition: true,
          jumpLink: '.J_Link',
          loadingHtml: '<img src="http://static.ydcss.com/uploads/ydui/loading/loading10.svg"/>',
          loadListFn: function () {
              var def = $.Deferred();
              if( requestjson.page == 1){
            	  if(_isNotNull(sessionStorage)){
            		  sessionStorage.clear();
            	  }
            	 // this.sessionStorage.clear();
              }
              loadMore(function (listArr) {
            	  sessionStorage = this.sessionStorage;
                  listArr.page = requestjson.page;
                  var html = template(requestjson.templeteDivId, {list: listArr.content,page: requestjson.page});
                  if(listArr.content.length!=0){
                	  def.resolve(listArr.content, requestjson.page);
                  } else if( requestjson.page == 1){
                	  html = '<div class="list-donetip">没有更多数据了</div>';
                	  $('.list-loading').hide();
                  } 
                  
                  $('#'+requestjson.listContent_id).append(html);
                  if( listArr.last   ){//||  listArr.numberOfElements==0 &&  requestjson.page != 1
                	   $('.list-loading').hide();
                	  if( listArr.numberOfElements!=0){
                		  if($('.list-donetip').length>=1){
                              $('.list-donetip:first').remove();
                           }
                    	  $('#'+requestjson.listContent_id).append('<div class="list-donetip">记录总数  '+listArr.totalElements+'</div>');
                     
                		  
                	  }
                	}
                  /*
                  if(_isNotNull(listArr.page) && _isNotNull(listArr.totalPages) && listArr.page ==listArr.totalPages ){
                    if($('.list-donetip').length>1){
                       $('.list-donetip:first').remove();
                    }
                	  $('.list-donetip').html("我是有底线的.记录总数 "+listArr.totalElements); 
                  }*/
                 // $('#'+requestjson.listContent_id).append(html);
                  	var _start =   requestjson.page * requestjson.pageSize;
                  	if(_start <= listArr.totalElements){//add last
                  		 requestjson.start = _start;
                         requestjson.page =  requestjson.page +1 ;//// ++page;
                  	}
                     
              });
            return     def.promise();
          },
     	loadStorageListFn: function (listObj, lastVisitPage) {
     		requestjson.page = lastVisitPage;
       		requestjson.start = ( requestjson.page - 1) * requestjson.pageSize;
            return reloadPage($.Deferred(),listObj,lastVisitPage,requestjson);
          }
  });
	
	
	
}