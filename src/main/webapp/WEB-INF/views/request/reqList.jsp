<%@ page import="yw.basket.dto.MatchDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.LinkedList" %>
<%@ page import="yw.basket.dto.UserDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    List<MatchDTO> reqList = (List<MatchDTO>) request.getAttribute("reqList");

    //API 사진
    String image_link4 = (String) request.getAttribute("image_link4");
    String image_link5 = (String) request.getAttribute("image_link5");
    String image_link6 = (String) request.getAttribute("image_link6");

    UserDTO user = (UserDTO) session.getAttribute("user");

    if (reqList == null){
        reqList = new LinkedList<MatchDTO>();
    }
%>

<html>
<head>
    <%@include file="../header.jsp"%>
    <script type="text/javascript">


        let playerNamesIdx = 0;
        let playerNames = ["마이클 조던", "클레이 탐슨", "르브론 제임스", "스테판 커리", "야니스 아데토쿤보", "제임스 하든"];

        // 사진 클릭
        $(".imgBasket").click(function(){

            let imgId = $(this).attr("id");

            // 선수이름 배열 인덱스 초기화
            if (playerNamesIdx >= playerNames.length) {
                playerNamesIdx = 0;
            }

            $.ajax({
                type: "POST"
                , url: "/searchImageApi"
                , data: {"playerName" : playerNames[playerNamesIdx]}
                , success: function(image_link) {
                    $("#" + imgId).attr("src", image_link);
                    playerNamesIdx++;
                }
            })
        })
    </script>


</head>
<body>
<%@include file="../headerMenu.jsp"%>


<div style="margin: 50px 0 0 200px;">
    <div><%--<%= user.getUserSeq() %> --%><%= user.getUserName() %> 님</div>
    <input type="button" onclick="location.href='/matchReg'" value="매칭시작"></div>
<%--<input style="float: left; margin-right: 150px; width: 500px; height: 700px;">--%>
<form id="getMatchForm" method="post">

    <div class="container">
        <div class="row vertical-center" style="font-weight: bold; font-size: 12pt; line-height: 5; border-bottom: 1px solid #cccccc">
            <div class="col-lg-2 text-center">경기날짜</div>
            <div class="col-lg-2 text-center">경기시간</div>
            <div class="col-lg-3 text-center">구장이름</div>
            <div class="col-lg-1 text-center">성별구분</div>
            <div class="col-lg-2 text-center">레벨</div>
            <div class="col-lg-1 text-center">참여인원</div>
            <div class="col-lg-1 text-center">신청</div>
        </div>

        <%
            for (MatchDTO matchDTO : reqList) {
        %>

        <div class="row" style="font-size: 12pt; text-align: center; border-bottom: 1px solid #cccccc">
            <div class="col-lg-2"><%=matchDTO.getMatchDate()%></div>
            <div class="col-lg-2"><%=matchDTO.getMatchTime()%></div>
            <div class="col-lg-3" style="text-align: left">
                <a href="/matchDetail/<%=matchDTO.getMatchSeq()%>"><%=matchDTO.getMatchLocD()%> <%=matchDTO.getMatchGmName()%></a></div>

            <div class="col-lg-1"><%=matchDTO.getMatchGender()%></div>
            <div class="col-lg-2"><%=matchDTO.getMatchLevel()%></div>
            <div class="col-lg-1"><%=matchDTO.getReqCnt()%> / <%=matchDTO.getMatchMem()%></div>
            <% if (!matchDTO.getMatchDateStatus().equals("Y") || matchDTO.getReqCnt() == matchDTO.getMatchMem()) { %>
            <div class="col-lg-1">마감</div>
            <% } else if (!matchDTO.getReqStatus().equals("Y")) { %>
            <div class="col-lg-1">
                <input type="button" class="btn" value="참여" onclick="matchReq(<%=matchDTO.getMatchSeq()%>)" />
            </div>
            <% } else { %>
            <div class="col-lg-1">
                <input type="button" class="btn" value="취소" onclick="matchReqCnc(<%=matchDTO.getReqSeq()%>)" />
            </div>
            <% } %>
        </div>
        <%
            }
        %>
        <div class="row" style="display:flex; margin-left: 100px; margin-top: 50px; border-bottom: 1px solid #cccccc" >
            <div class="col-lg-4" style="text-align: right;">
                <img id="imgBasket1" class="imgBasket" src="<%=image_link4%>" style="float: left; margin-right: 150px; width: 200px; height: 300px;">
            </div>
            <div class="col-lg-4" style="text-align: right;">
                <img id="imgBasket2" class="imgBasket" src="<%=image_link5%>" style="float: left; margin-right: 150px; width: 200px; height: 300px;">
            </div>
            <div class="col-lg-4" style="text-align: right;">
                <img id="imgBasket3" class="imgBasket" src="<%=image_link6%>" style="float: left; margin-right: 150px; width: 200px; height: 300px;">
            </div>
        </div>
    </div>
</form>
<br>
<%@include file="../footer.jsp"%>
</body>
</html>