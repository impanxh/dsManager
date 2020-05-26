'use strict';

function signIn(cId, uniqId_s, from, url) {
    //60.205.183.191:9098
    window.open('/-/' + url + '?_=&id=' + cId + '&seriaNum_s=' + uniqId_s + '&_from=' + from);
}
function addnewline(h) {
    window.location.href = h;
}
function delRow(id, table, className) {
    layer.confirm('确定要删除吗？', {
        icon: 3
    }, function (index) {
        layer.close(index);
        deleteDataV3(id, className);
        $('#' + table).DataTable().draw();
    });
}
$(function () {
    $('#subutton').on("click", function (ev) {
        if ($('#checkUniq').val() == 'N') {
            $('#uniqId_s').val(getUniqId());
        }
        $('#reportMsg').attr("action", "http://" + changeAddr() + "/api/saveModel");
        var c;
        ajaxForm("reportMsg", c, 'confirm');
    });
});