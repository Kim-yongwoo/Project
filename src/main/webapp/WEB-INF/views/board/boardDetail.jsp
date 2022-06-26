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

</head>
<body>
<%@include file="../headerMenu.jsp"%>
<div class="container">
    <h2>게시글 상세 화면</h2>
    <form id="frm" method="post">
        <div class="board_detail">
            <%--            <colgroup>--%>
            <%--                <col width="15%"/>--%>
            <%--                <col width="35%"/>--%>
            <%--                <col width="15%"/>--%>
            <%--                <col width="35%"/>--%>
            <%--            </colgroup>--%>
            <%--<caption>게시글 상세내용</caption>--%>
            <div class="container">
                <div class="row">
                    <div class="col-2">글 번호</div>
                    <div class="col"><%=boardDTO.getBoardSeq()%></div>
                </div>
                <div class="row">
                    <div class="col-2">제목</div>
                    <div class="col"><%=boardDTO.getBoardTitle()%></div>
                </div>
                <div class="row">
                    <div class="col-2">작성자</div>
                    <div class="col"><%=boardDTO.getBoardUserName()%></div>
                </div>
                <div class="row">
                    <div class="col-2">작성일</div>
                    <div class="col"><%=boardDTO.getBoardRegDate().toString().substring(0, 11)%></div>
                </div>
                <div class="row">
                    <div class="col-2">제목</div>
                    <div class="col">
                        <input type="text" id="title" name="boardTitle" value="<%=boardDTO.getBoardTitle()%>"/>
                    </div>
                </div>
                <div class="row">
                    <div class="view_text col">
                        <%-- <input type="text" name="boardContents" value="<%=boardDTO.getBoardContents()%>">--%>
                        <textarea type="textarea" class="form-control" id="contents" name="boardContents"><%=boardDTO.getBoardContents()%></textarea>
                    </div>
                </div>
            </div>
        </div>

        <input type="hidden" name="boardSeq" value="<%=boardDTO.getBoardSeq()%>" />
    </form>

    <input type="button" id="list" value="목록으로">
    <input type="button" id="edit" value="수정하기" href="#" onclick="alert('수정되었습니다')">
    <input type="button" id="delete" value="삭제하기" href="#" onclick="alert('삭제되었습니다')">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function(){
            $("#list").on("click", function(){
                location.href = "/boardList";
            });
            $("#edit").on("click", function(){
                var frm = $("#frm")[0];
                let junggyu = /[^a-zA-Z0-9가-힣ㄱ-ㅎ]/g;
                let textValue = $("#contents").val();
                if(junggyu.test(textValue)) {
                    frm.action = "/boardUpdate";
                    frm.submit();
                }
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