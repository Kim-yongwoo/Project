<%@ page import="yw.basket.dto.MatchDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.LinkedList" %>
<%@ page import="yw.basket.dto.UserDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    List<MatchDTO> reqList = (List<MatchDTO>) request.getAttribute("reqList");

    UserDTO user = (UserDTO) session.getAttribute("user");

    if (reqList == null){
        reqList = new LinkedList<MatchDTO>();
    }
%>

<html>
<head>
    <%@include file="../header.jsp"%>

</head>
<body>
<%@include file="../headerMenu.jsp"%>

<div style="margin-left: 200px;">
<h3>나의활동</h3>
<div class="btn-div">

    <div class="btn-group">
        <br>
        <a class="btn btn-outline-secondary">경기날짜</a>
        <a class="btn btn-outline-secondary">경기시간</a>
        <a class="btn btn-outline-secondary">위치</a>
        <a class="btn btn-outline-secondary">구장이름</a>
        <a class="btn btn-outline-secondary">구장주소</a>
        <a class="btn btn-outline-secondary">성별구분</a>
        <a class="btn btn-outline-secondary">레벨</a>
        <a class="btn btn-outline-secondary">참여인원</a>
        <br>
    </div>
    <br>
    <%--<img src="<%=image_link%>" style="float: right; margin-right: 150px; width: 500px; height: 700px;">--%>
</div>

<thead>

    <%
		for (MatchDTO matchDTO : reqList) {
	%>
<br>
<tr>

    <th><%=matchDTO.getMatchSeq()%></th>
    <th><%=matchDTO.getMatchDate()%></th>
    <th><%=matchDTO.getMatchTime()%></th>
    <th><%=matchDTO.getMatchLocM()%></th>
    <th><%=matchDTO.getMatchLocD()%></th>
    <th><a href="/matchDetail/<%=matchDTO.getMatchSeq()%>"><%=matchDTO.getMatchGmName()%></a></th>
    <th><%=matchDTO.getMatchGmAddr()%></th>
    <th><%=matchDTO.getMatchGender()%></th>
    <th><%=matchDTO.getMatchLevel()%></th>
    <th><%=matchDTO.getReqCnt()%> / <%=matchDTO.getMatchMem()%></th>
</tr>
<% } %>
</thead>
    <%--<div>
        <% if (!matchDTO.getMatchDateStatus().equals("Y") || matchDTO.getReqCnt() == matchDTO.getMatchMem()) { %>
        <th>마감</th>
        <% } else if (!matchDTO.getReqStatus().equals("Y")) { %>
        <th><input type="button" value="참여" onclick="matchReq1(<%=matchDTO.getMatchSeq()%>)" /></th>
        <% } else { %>
        <th><input type="button" value="취소" onclick="matchReqCnc(<%=matchDTO.getReqSeq()%>)" /></th>
        <% } %>
        <th><input type="button" value="취소" onclick="matchReqCnc(<%=matchDTO.getReqSeq()%>)" /></th>
    </div>--%>
</div>
</form>

<%@include file="../footer.jsp"%>
</body>
</html>