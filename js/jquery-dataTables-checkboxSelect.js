/**
 * datatable checkbox select
 * impanxh@gmail.com
 */
function updateDataTableSelectAllCtrl(table) {
	var $table = table.table().node();
	var $chkbox_all = $('tbody input[type="checkbox"]', $table);
	var $chkbox_checked = $('tbody input[type="checkbox"]:checked', $table);
	var chkbox_select_all = $('thead input[name="select_all"]', $table).get(0);
	var select_all = document.getElementById('select_all');
	var chkbox_id_exist = typeof (select_all) != "undefined"

	if ($chkbox_checked.length === 0) {
		chkbox_select_all.checked = false;
		if ('indeterminate' in chkbox_select_all) {
			chkbox_select_all.indeterminate = false;
		}

	} else if ($chkbox_checked.length === $chkbox_all.length) {
		chkbox_select_all.checked = true;
		if ('indeterminate' in chkbox_select_all) {
			chkbox_select_all.indeterminate = false;
		}

	} else {
		chkbox_select_all.checked = true;
		if ('indeterminate' in chkbox_select_all) {
			chkbox_select_all.indeterminate = true;
		}
	}
	// check id 这里可能出问题 有时会出现checkbox 出现 2次效果 1次indeterminate 1次checked
	//最好 方法加一个参数 决定是按name还是id进行状态变更
	if (chkbox_id_exist) {
		if ($chkbox_checked.length === 0) {
			select_all.indeterminate = select_all.checked = false;
		} else if ($chkbox_checked.length === $chkbox_all.length) {
			select_all.checked = true;
			select_all.indeterminate = false;
		} else {
			select_all.indeterminate = select_all.checked = true;
		}
	}
}


    
function initCheckBoxTools(tableName,_table){
	
	var jqueryTableId= "#" + tableName;
	$(jqueryTableId + " tbody").on('click', 'input[type="checkbox"]', function(e){
	      var $row = $(this).closest('tr');

	      var data = _table.row($row).data();
	      if(this.checked){
	         $row.addClass('selected');
	      } else {
	         $row.removeClass('selected');
	      }

	      updateDataTableSelectAllCtrl(_table);
	    
	      e.stopPropagation();
	   });

	   $(jqueryTableId).on('click', 'tbody td, thead th:first-child', function(e){
	      $(this).parent().find('input[type="checkbox"]').trigger('click');
	   });

	   $('thead input[name="select_all"]', _table.table().container()).on('click', function(e){
	      if(this.checked){
	         $(jqueryTableId+' tbody input[type="checkbox"]:not(:checked)').trigger('click');
	      } else {
	         $(jqueryTableId+' tbody input[type="checkbox"]:checked').trigger('click');
	      }

	      e.stopPropagation();
	   });

	   _table.on('draw', function(){
	      updateDataTableSelectAllCtrl(_table);
	   });
}
/**
 * impanxh
 */
function _debugPrintCheckBox(){
	var chk_value =[]; 
	$('tbody input[type="checkbox"]:checked').each(function(){ 
	chk_value.push($(this).val()); 
	}); 
	var idStr = chk_value.join();
	alert(idStr);
	
}



