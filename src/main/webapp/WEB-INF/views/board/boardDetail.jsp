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
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <link href="<%=request.getContextPath()%>/css/style.css" rel="stylesheet">

</head>
<body>
<div class="container">
    <h2>게시글 상세 화면</h2>
    <form id="frm" method="post">
    <table class="board_detail">
        <colgroup>
            <col width="15%"/>
            <col width="35%"/>
            <col width="15%"/>
            <col width="35%"/>
        </colgroup>
        <caption>게시글 상세내용</caption>
        <tbody>
        <tr>
            <th scope="row">글 번호</th>
            <td><%=boardDTO.getBoardSeq()%></td>
            <th scope="row">제목</th>
            <td><%=boardDTO.getBoardTitle()%></td>
        </tr>
        <tr>
            <th scope="row">작성자</th>
            <td><%=boardDTO.getBoardRegSeq()%></td>
            <th scope="row">작성일</th>
            <td><%=boardDTO.getBoardRegDate()%></td>
        </tr>
        <tr>
            <th scope="row">제목</th>
            <td colspan="3">
                <input type="text" id="title" name="boardTitle" value="<%=boardDTO.getBoardTitle()%>"/>
            </td>
        </tr>
        <tr>
            <td colspan="4" class="view_text">
							<input type="text" name="boardContents" value="<%=boardDTO.getBoardContents()%>">
            </td>
        </tr>
        </tbody>
    </table>

    <input type="hidden" name="boardSeq" value="<%=boardDTO.getBoardSeq()%>" />
    </form>

    <input type="button" id="list" value="목록으로">
    <input type="button" id="edit" value="수정하기">
    <input type="button" id="delete" value="삭제하기">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function(){
            $("#list").on("click", function(){
                location.href = "/boardList";
            });

            $("#edit").on("click", function(){
                var frm = $("#frm")[0];
                frm.action = "/boardUpdate";
                frm.submit();
            });

            $("#delete").on("click", function(){
                var frm = $("#frm")[0];
                frm.action = "/boardDelete";
                frm.submit();
            });
        })
    </script>

</div>
</body>
</html>