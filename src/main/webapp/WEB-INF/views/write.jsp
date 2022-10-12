<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
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
    <link href="/happyfrog/resources/css/write.css" rel="stylesheet">
    <title>Document</title>
</head>
<body>
<div class="grid-container">
    <!-- header -->
    <jsp:include page="header.jsp"/>
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
                <button type="button" onclick="location.href='<c:url value='/'/>';">취소</button>
                <button type="button" onclick="file_upload()">등록</button>
            </div>
        </div>
    </div>
</div>
</body>
<script>
    function file_upload(){
        let file = document.querySelector(".file").files[0];
        let form = new FormData();
        form.append("file",file);

        fetch("http://localhost/happyfrog/write/",{
            method : "POST",
            body : form
        })
            .then(() => alert("업로드가 되었습니다."))

    }

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