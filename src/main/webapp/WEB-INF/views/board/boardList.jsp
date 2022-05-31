<%@ page import="java.util.List" %>
<%@ page import="yw.basket.dto.BoardDTO" %>
<%@ page import="java.util.LinkedList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    List<BoardDTO> boardDTOList = (List<BoardDTO>) request.getAttribute("boardList");

    if (boardDTOList == null){
        boardDTOList = new LinkedList<BoardDTO>();
    }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <link href="<%=request.getContextPath()%>/css/style.css" rel="stylesheet">
    <title>게시글 조회</title>
</head>
<body>
<div class="container">
    <h2>게시글 목록</h2>
    <table class="board_list">

        <thead>
        <tr>
            <th scope="col">글번호</th>
            <th scope="col">제목</th>
            <th scope="col">등록일자</th>
            <th scope="col">작성자</th>
        </tr>
        <%
            for (BoardDTO boardDTO : boardDTOList) {
        %>
        <tr>
            <th><%=boardDTO.getBoardSeq()%></th>
            <th><%=boardDTO.getBoardTitle()%></th>
            <th><%=boardDTO.getBoardRegDate()%></th>
            <th><%=boardDTO.getUserName()%></th>
        </tr>
        <%
            }
        %>

        </thead>

    </table>
    <input type="button" onclick="location.href='/boardWrite'" value="글쓰기">

</div>
</body>
</html>