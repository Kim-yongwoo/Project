<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <%@include file="../header.jsp"%>
</head>
<body>
<%@include file="../headerMenu.jsp"%>
<div class="container">
    <h2>게시판 등록</h2>
    <form id="frm" name="frm" method="post" action="/insertBoard">
        <table class="board_detail">
            <tr>
                <td>제목</td>
                <td><input type="text" id="boardTitle" name="boardTitle"></td>
            </tr>
            <tr>
                <td colspan="2">
                    <textarea id="boardContents" name="boardContents"></textarea>
                </td>
            </tr>
        </table>
        <input type="submit" id="submit" value="저장" class="btn" href="#" onclick="alert('작성 완료')">

    </form>
</div>
</body>
</html>