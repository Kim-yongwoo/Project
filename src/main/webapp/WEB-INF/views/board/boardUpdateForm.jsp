<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="yw.basket.dto.UserDTO" %>
<%@ page import="yw.basket.dto.BoardDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
    UserDTO userinfo = (UserDTO) request.getAttribute("userinfo");
    BoardDTO boardDTO = (BoardDTO) request.getAttribute("boardInfo");
%>
<html>
<head>
    <%@include file="../header.jsp"%>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <link href="<%=request.getContextPath()%>/css/style.css" rel="stylesheet">
    <title>게시글 수정</title>
</head>
<body>
<%@include file="../headerMenu.jsp"%>
<h2>게시판 수정</h2>
<form action="/boardUpdate" method="post">
    <div><label>글번호</label>
        <input name="boardSeq" readonly="readonly" value="<%=boardDTO.getBoardSeq()%>">
    </div>
    <div><label>제목</label>
        <input name="boardTitle" readonly="readonly" value="<%=boardDTO.getBoardTitle()%>">
    </div>
    <div><label>작성자</label>
        <input name="boardRegSeq" readonly="readonly" value="<%=boardDTO.getBoardRegSeq()%>">
    </div>
    <div><label>내용</label>
        <input name="boardContents" readonly="readonly" value="<%=boardDTO.getBoardContents()%>">
    </div>

    <button type="submit">수정완료</button>
    <button type="button" onclick="location.href='/boardList'">돌아가기</button>
</form>
<input type="hidden" name="boardSeq" value="<%=boardDTO.getBoardSeq()%>">


</body>

</html>