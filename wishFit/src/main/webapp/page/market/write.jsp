<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시글 작성</title>
    <link rel="stylesheet" type="text/css" href="../css/commons.css">
    <style>
        textarea {
            resize: none;
        }

        textarea.vertical {
            resize: vertical;
            min-height: 200px;
        }

        right-btn {
            width: 70%;
            float: right;
            background-color: skyblue;
            color: white;
        }

        .form-input-title {
            width: 70%;
            font-size: 20px;
            padding: 10px;

        }

        .form-select {
            width: 30%;
            font-size: 20px;
            float: left;
            
           

        }

        .form-button {
            color: white;
            background-color: #3F9DFF;
            float: right;
            border: 10px solid #3F9DFF;
        
        }
        .form-input,
        .form-btn {
             width: 100%;
             font-size: 20px;
             padding: 10px;
}
      .form-block {
    display: block;
           }

       .form-inline {
                  width: auto;
                  }
      
    </style>
</head>

<body>
    <form action="write.kh" method="post">
        <div class="container-700 container-center">
            <div class="row center">
                <h1>마켓</h1>
            </div>
            <div class="row">
                <select class="form-select" name="boardMiddleName">분류
                    <option>판매</option>
                    <option >구매</option>
                </select>
                <input type="text" name="boardTitle" required class="form-input-title" autocomplete="off"
                    placeholder="제목을 입력해주세요.">
            </div>
            <div class="row">
                <label>내용</label>
                <textarea name="boardPost" required class="form-input" rows="10"></textarea>
            </div>
            <div class="row">
                <label class="form-block">첨부파일</label>
                <input type="file" name="" class="form-input form-inline">
            </div>
            <div class="row">
                <input type="submit" value="등록" class="form-button">
            </div>
        </div>
    </form>
</body>

</html>