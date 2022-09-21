<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- w3스쿨 이미지 링크 -->
    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>Document</title>
    <style>
        body {
            margin: 0;
            background-image: url(/happyfrog/resources/images/leaves.webp);
        }

        /*그리드 설정*/
        .grid-container {
            padding: 0.63em;
            display: grid;
            gap: 0.31em;
            grid-template-rows: 4.38em 50.63em;
        }

        .grid-item {
            padding: 0.31em;
            /* border: 0.19em solid black; */
            color: green;
        }

        /*헤더 설정*/
        .header {
            color: green;
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: whitesmoke;

        }
        .logo span,
        a {
            color: green;
            float: left;
            text-align: center;
            padding: 0.75em;
            text-decoration: none;
            font-size: 1.13em;
            line-height: 1.56em;
            border-radius: 0.25em;
        }

        .header a.active {
            background-color: #7DCE13;
            color: white;
        }

        .header a:hover {
            background-color: #ddd;
            color: black;
        }

        .header a.active {
            background-color: #7DCE13;
            color: white;
        }

        img{
            width: 3.44em;
            height: 3.44em;
        }

        /* 글쓰기 설정 */

        .write{
            padding: 0.94em 1.25em;
            display: flex;
            height: 100%;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            /* background-color: aqua; */
        }

        .title{
            display: flex;
            justify-content: center;
            width: 100%;
            margin: 0.63em;
        }

        .upload{
            width: 100%;
            margin: 0.63em;
        }

        .writebuttons{
            display: flex;
            justify-content:flex-end;
            width: 40%;
            margin: 0.63em;
        }

        .writebuttons button{
            padding: 0.31em;
            margin: 0.31em;
        }

        /* 업로드 */
        #root {
            width: 100%;
            margin: 0 auto;
            max-width: 50em;
        }

        .contents {
            display: flex;
            flex-direction: row;
            margin-top: 1.88em;
        }
        .contents .upload-box {
            width: 100%;
            margin-right: 1.88em;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        .contents .upload-box .drag-file {
            position: relative;
            width: 100%;
            height: 28.75em;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            border: 0.19em dashed #dbdbdb;
        }
        .contents .upload-box .drag-file.highlight {
            border: 0.19em dashed red;
        }
        .contents .upload-box .drag-file .image {
            width: 2.50em;
        }
        .contents .upload-box .drag-file .message {
            margin-bottom: 0;
        }
        .contents .upload-box .drag-file .preview {
            display: none; /* 파일을 읽어오면 이벤트를 통해 block이 된다 */
            position: absolute;
            left: 0;
            height: 0;
            width: 100%;
            height: 100%;
        }
        .contents .upload-box .file-label {
            margin-top: 1.88em;
            background-color: #7DCE13;
            color: #fff;
            text-align: center;
            padding: 0.63em 0;
            width: 65%;
            border-radius: 0.38em;
            cursor: pointer;
        }
        .contents .upload-box .file {
            display: none;
        }

        .writebuttons button {
            box-shadow: inset 0 1px 0 0 #caefab;
            background: linear-gradient(to bottom, #7DCE13 5%, #7DCE13 100%);
            background-color: #7DCE13;
            border-radius: 6px;
            border: 1px solid #7DCE13;
            display: inline-block;
            cursor: pointer;
            color: #306108;
            font-family: Arial;
            font-size: 13px;
            font-weight: bold;
            padding: 6px 24px;
            text-decoration: none;
            text-shadow: 0 1px 0 #aade7c;
        }

        .writebuttons button:hover {
            background: linear-gradient(to bottom, #a5cc52 5%, #b8e356 100%);
            background-color: #a5cc52;
        }
        .writebuttons button:active {
            position: relative;
            top: 1px;
        }

        @media (max-width: 32em) {
            .contents {
                display: flex;
                flex-direction: column;
                margin-top: 1.88em;
            }
            .contents .upload-box {
                width: 100%;
                box-sizing: border-box;
                margin-right: 0;
            }
            .contents .upload-box .drag-file {
                height: 28.13em;
            }
            .contents .files {
                width: 100%;
                box-sizing: border-box;
                margin-right: 0;
                overflow: initial;
            }
        }

    </style>
</head>
<body>
<div class="grid-container">
    <!-- 로고, 인포, 회원가입, 로그인/로그아웃 -->
    <div class="grid-item">
        <div class="header">
            <div class="logo">
                <img src="/happyfrog/resources/images/frog.png">
                <span>HappyFrog 0.0</span>
            </div>
            <div class="header-right">
                <a class="active" href="#home">Home</a>
                <a href="#signin">SignUp</a>
                <a href="#Login">Login</a>
            </div>
        </div>
    </div>
    <!--글쓰기-->
    <div class="grid-item">
        <div class="write">
            <div class="title">
                <label>제목</label>
                <input type="text" placeholder="제목을 입력해주세요">
            </div>
            <div class="upload">
                <div id="root">
                    <div class="contents">
                        <div class="upload-box">
                            <div id="drop-file" class="drag-file">
                                <img src="/happyfrog/resources/images/image-file.png" alt="파일 아이콘" class="image">
                                <p class="message">드래그하여 파일을 업로드해주세요</p>
                                <img src="" alt="미리보기 이미지" class="preview">
                            </div>
                            <label class="file-label" for="chooseFile">파일 선택</label>
                            <input
                                    class="file"
                                    id="chooseFile"
                                    type="file"
                                    onchange="dropFile.handleFiles(this.files)"
                                    accept="image/png, image/jpeg, image/gif">
                        </div>
                    </div>
                </div>
            </div>
            <div class="writebuttons">
                <button type="button">취소</button>
                <button type="button">등록</button>
            </div>
        </div>
    </div>
</div>
</body>
<script>
    function DropFile(dropAreaId, fileListId) {
        let dropArea = document.getElementById(dropAreaId);
        let fileList = document.getElementById(fileListId);

        function preventDefaults(e) {
            e.preventDefault();
            e.stopPropagation();
        }

        function highlight(e) {
            preventDefaults(e);
            dropArea
                .classList
                .add("highlight");
        }

        function unhighlight(e) {
            preventDefaults(e);
            dropArea
                .classList
                .remove("highlight");
        }

        function handleDrop(e) {
            unhighlight(e);
            let dt = e.dataTransfer;
            let files = dt.files;

            handleFiles(files);
        }

        function handleFiles(files) {
            files = [...files];
            files.forEach(previewFile);
        }

        function previewFile(file) {
            renderFile(file);
        }

        function renderFile(file) {
            let reader = new FileReader();
            reader.readAsDataURL(file);
            reader.onloadend = function () {
                let img = dropArea.getElementsByClassName("preview")[0];
                img.src = reader.result;
                img.style.display = "block";
            };
        }

        dropArea.addEventListener("dragenter", highlight, false);
        dropArea.addEventListener("dragover", highlight, false);
        dropArea.addEventListener("dragleave", unhighlight, false);
        dropArea.addEventListener("drop", handleDrop, false);

        return {handleFiles};
    }
    const dropFile = new DropFile("drop-file", "files");
</script>
</html>