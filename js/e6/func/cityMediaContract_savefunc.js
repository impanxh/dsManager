"use strict";

function signIn(cId, uniqId_s, from, url) {
    //60.205.183.191:9098
    window.open("/-/" + url + "?_=&id=" + cId + "&seriaNum_s=" + uniqId_s + "&_from=" + from);
}
function addnewline(h) {
    window.location.href = h;
}
function delRow(id, table, className) {
    layer.confirm('确定要删除吗？', {
        icon: 3
    }, function (index) {
        layer.close(index);
        saveDataModelV3({ "selectByField": "id", "id": id, "isdelete_i": "1", "checkUniq": 'Y' }, className);
        $('#' + table).DataTable().draw();
    });
}
var qid = getParamFromUrl("id");
$(function () {
    $('#subutton').on("click", function (ev) {
        if ($('#checkUniq').val() == 'N') {
            $('#uniqId_s').val(getUniqId());
        }

         
        $("#img1ListId").val(fetchUploadFile('imgsBox1'));
        $("#img2ListId").val(fetchUploadFile('imgsBox2'));

        $('#reportMsg').attr("action", "http://" + changeAddr() + "/api/saveModel");
        var c;
        ajaxForm("reportMsg", c, 'confirm');
    });


    if(qid!=null && qid!=''){

        var obj  =  queryById(qid,'R1_contract')
		if(isNotNull(obj)){
            suffix_fileEdit(obj.img1List_s,'imgsBox1',1)
            suffix_fileEdit(obj.img2List_s,'imgsBox2',2)
			//suffix_ExFileEdit(obj.fileList_s,'fileBox',1)
			   
		}
        
        
    }



});