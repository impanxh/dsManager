var WORDJSON_MAP = {};

function down(path, fileName) {
	window.location = "/public/download?path=" + path + "&fileName=" + fileName;
}

// 上传Word文件
function uploadWordFile() {
	var fileName = $("#uploadWordFile_s").val();
	if (fileName == '') {
		YDUI.dialog.alert("请选择文件");
		return false;
	}

	var imgs = fileName.split(".");
	var suffix = imgs[imgs.length - 1].toLocaleLowerCase();
	var validFileTypes = [ "doc", "docx" ];
	if ($.inArray(suffix, validFileTypes) == -1) {
		YDUI.dialog.alert("请上传['docx','doc']格式的文件!");
		return false;
	}
	var options = {
		url : "/upload/saveSimpleFile",
		type : "POST",
		dataType : "json",
		success : function(data) {
			var file_list = $("#mediaFile").val();
			file_list = file_list == '' ? data.path : file_list + ","
					+ data.path;
			$("#mediaFile").val(file_list);
			$("#imageShow").append(
					template("wordTemplate", {
						filename : data.filename,
						imageUrl : data.path,
						mid : data.path.replace(new RegExp("/", "g"), '')
								.replace('.', '')
					}));
			WORDJSON_MAP[data.path] = data.filename;
			YDUI.dialog.loading.close();

		}
	};
	YDUI.dialog.loading.open('文档上传中');
	setTimeout(function() {
		$("#wordForm").ajaxSubmit(options);
	}, 1000);
}

var typeJson = {
	"img" : '是否确定删除图片？',
	"word" : '是否确定删除文档？'
};
function del(imageurl, mid, type) {
	var dialog = YDUI.dialog;
	delete WORDJSON_MAP[imageurl];
	dialog.confirm('确认删除', typeJson[type], [ {
		txt : '取消',
		color : false,
		callback : function() {
			dialog.toast('取消删除', 'none', 500);
		}
	}, {
		txt : '确定',
		color : true,
		callback : function() {
			dialog.toast('删除成功', 'none', 1000);
			var file_list = $("#mediaFile").val();
			file_list = file_list.replace(imageurl + ",", '');
			file_list = file_list.replace(imageurl, '');
			$("#mediaFile").val(file_list);
			$("#" + mid).html('');
		}
	} ]);
}