<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <link href="<%=request.getContextPath()%>/css/style.css" rel="stylesheet">
    <title>게시판 등록</title>
</head>
<body>
<div class="container">
    <h2>게시판 등록</h2>
    <form id="frm" name="frm" method="post" action="/insertBoard">
        <table class="board_detail">
            <tr>
                <td>제목</td>
                <td><input type="text" id="title" name="boardTitle"></td>
                // 입력된 내용들은 name을 키로 이용해 서버에 전송됨
            </tr>
            <tr>
                <td colspan="2">
                    <textarea id="contents" name="boardContents"></textarea>
                </td>
            </tr>
        </table>
        <input type="submit" id="submit" value="저장" class="btn" href="#" onclick="alert('작성 완료')">

    </form>
</div>
</body>
</html>