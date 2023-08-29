<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.22/dist/sweetalert2.min.css" rel="stylesheet">
    <title>新增貼文</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f0f5f9;
        }
        .container {
            background-color: #b0c9db;
            width: 80%;
            height: 80vh;
            margin: 0 auto;
            padding: 20px;
            border-radius: 20px;
            position: relative;
            display: flex;
            flex-direction: column;
            align-items: stretch;
        }
        .header {
                    text-align: center;
                    padding-bottom: 20px;
                }

        .title {
                    font-weight: bold;
                }

        .content {
                    margin-top: 20px;
                }

        .text-box {
                    background-color: #f3e5f5;
                    border-radius: 15px;
                    padding: 15px;
                    margin-bottom: 15px;
                }

        label {
                    display: block;
                    font-weight: bold;
                }

        input[type="text"],
                textarea {
                    width: 100%;
                    padding: 4px;
                    border: 1px solid #ccc;
                    border-radius: 5px;
                }

        .file-upload {
                    display: none;
                }

        .btn-upload,
        .btn-submit {
                    background-color: #3498db;
                    color: white;
                    border: none;
                    padding: 10px 20px;
                    border-radius: 5px;
                    cursor: pointer;
                    align-self: flex-start; /* 調整按鈕位置 */
                    margin-top: auto;
                }

        .btn-upload {
                    margin-left: 10px; /* 調整按鈕之間的間距 */
                }

        .btn-submit {
                    align-self: flex-end;
                    margin-top: auto;
                }

        .btn-upload:hover,
        .btn-submit:hover {
                    background-color: #2980b9;
                }
                    </style>
                    <style>body {
                  font-family: "Open Sans", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen-Sans, Ubuntu, Cantarell, "Helvetica Neue", Helvetica, Arial, sans-serif;
                }
    </style>
</head>
<body>
 <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.22/dist/sweetalert2.all.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="sweetalert2.all.min.js"></script>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>

<div class="container">
    <div class="header">
        <h1 class="title">新增貼文</h1>
    </div>

    <form action="<%=request.getContextPath()%>/Art/Art.do" method="post" enc-type="multipart/form-data">

    <div class="content">
        <div class="text-box">
        <label>遊戲類別:</label>
           <select id="ARTICAL_GAME" name="ARTICLE_NAME">
            <option value="三國殺">三國殺</option>
            <option value="阿瓦隆">阿瓦隆</option>
            <option value="狼人殺">狼人殺</option>
            <option value="驚爆倫敦">驚爆倫敦</option>
            <option value="璀璨寶石">璀璨寶石</option>
           </select>
        </div>

        <div class="text-box">
            <label for="post-title">貼文主題:</label>
            <input type="text" id="post-title" name="artTitle" placeholder="請輸入貼文主題" value="${param.artTitle}">
            <span id="artTitle.errors" class="error">${errorMsgs.artTitle}<br/></span>
        </div>
        <div class="text-box">
            <label for="post-content">貼文內容:</label>
            <textarea id="post-content"  name="artCon" rows="10" placeholder="請輸入貼文內容" value="${param.artCon}"></textarea>
            <span id="artTitle.artCon" class="error">${errorMsgs.artCon}<br/></span>
        </div>
    </div>
    <button class="btn-upload" onclick="openFileUploader()">上傳檔案</button>
    <input  type="hidden" name="action" value="insert">
    <button class="btn-submit" onclick="submitPost()">送出</button>
    <input type="file" id="file-upload" class="file-upload" accept="image/*">
    </form>
</div>
<script>
    const submitButton = document.querySelector(".btn-submit");
    submitButton.addEventListener("click", function() {


        Swal.fire({
            title: '確定送出??',
            text: "確認內容編輯後即可送出!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'OK'
        }).then((result) => {
            if (result.isConfirmed) {
                Swal.fire(
                    '張貼成功!',
                    '您的貼文已經送出',
                    '成功'
                );
            }
        });
    });
</script>
</body>
</html>