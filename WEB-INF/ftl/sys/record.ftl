<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <div>
        <audio controls autoplay></audio>
        <input onclick="startRecording()" type="button" value="录音" />
        <input onclick="stopRecording()" type="button" value="停止" />
        <input onclick="playRecording()" type="button" value="播放" />
        <input onclick="uploadAudio()" type="button" value="提交" />
    </div>

    <script type="text/javascript" src="js/HZRecorder.js"></script>


    <script>

        var recorder;

        var audio = document.querySelector('audio');

        function startRecording() {
            HZRecorder.get(function (rec) {
                recorder = rec;
                recorder.start();
            });
        }

        function stopRecording() {
            recorder.stop();
        }

        function playRecording() {
            recorder.play(audio);
        }

        function uploadAudio() {
            recorder.upload("Handler1.ashx", function (state, e) {
                switch (state) {
                    case 'uploading':
                        //var percentComplete = Math.round(e.loaded * 100 / e.total) + '%';
                        break;
                    case 'ok':
                        //alert(e.target.responseText);
                        alert("上传成功");
                        break;
                    case 'error':
                        alert("上传失败");
                        break;
                    case 'cancel':
                        alert("上传被取消");
                        break;
                }
            });
        }

    </script>

</body>
</html>