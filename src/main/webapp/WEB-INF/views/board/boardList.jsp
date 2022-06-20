<%@ page import="java.util.List" %>
<%@ page import="yw.basket.dto.BoardDTO" %>
<%@ page import="java.util.LinkedList" %>
<%@ page import="yw.basket.dto.UserDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    List<BoardDTO> boardDTOList = (List<BoardDTO>) request.getAttribute("boardList");
    UserDTO userinfo = (UserDTO) request.getAttribute("userinfo");

    if (boardDTOList == null){
        boardDTOList = new LinkedList<BoardDTO>();
    }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <%@include file="../header.jsp"%>
</head>
<body>

<%@include file="../headerMenu.jsp"%>
<div style="margin: 50px 0 0 50px;"> </div>
    <div class="container">
        <h2>게시글 목록</h2>
        <div class="board_list">
            <div class="row">
                <div class="col">글번호</div>
                <div class="col">제목</div>
                <div class="col">등록일자</div>
                <div class="col">작성자</div>
            </div>
            <%
                for (BoardDTO boardDTO : boardDTOList) {
            %>
            <div class="row">
                <div class="col"><%=boardDTO.getBoardSeq()%></div>
                <div class="col"><a href="/boardDetail/<%=boardDTO.getBoardSeq()%>"><%=boardDTO.getBoardTitle()%></a></div>
                <div class="col"><%=boardDTO.getBoardRegDate().toString().substring(0, 11)%></div>
                <div class="col"><%=boardDTO.getBoardUserName()%></div>
            </div>
            <%
                }
            %>
        </div>
        <input type="button" onclick="location.href='/boardWrite'" value="글쓰기">

    </div>
</body>
</html>