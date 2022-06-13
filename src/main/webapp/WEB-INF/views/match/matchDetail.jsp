<%@ page import="yw.basket.dto.MatchDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    MatchDTO matchDTO = (MatchDTO) request.getAttribute("matchDTO");

    if (matchDTO == null){
        matchDTO = new MatchDTO();
    }
%>

<html>
<head>
    <%@include file="../header.jsp"%>
    <script type="text/javascript">
        $(document).ready(function(){
            $("#matchLocM").change(function(){

                // 지역상세 콤보값 배열 선언
                let seoul = ["마포", "강서", "용산"];
                let gyeonggi = ["파주", "고양", "김포"];

                // 지역 콤보값
                let matchLocM = $("#matchLocM").val();

                // 지역상세 콤보에 설정할 배열 변수
                let changeItem;

                // 지역 값이 '서울'인 경우
                if (matchLocM == "서울") {
                    changeItem = seoul;
                }
                // 지역 값이 '경기'인 경우
                else if (matchLocM == "경기") {
                    changeItem = gyeonggi;
                }
                // 지역 값이 '지역선택'인 경우
                else {
                    changeItem = ["지역상세선택"];
                }

                // 지역상세 콤보값 초기화
                $("#matchLocD").empty();

                // changeItem.length 배열의 갯수만큼 지역상세 콤보에 추가 (한번에 한개씩 추가)
                for(let i=0; i<changeItem.length; i++) {
                    // 옵션값 수동 생성
                    let option = "<option value='" + changeItem[i] + "'>" + changeItem[i] + "</option>";

                    // 지역상세 콤보값 추가
                    $("#matchLocD").append(option);
                }
            })

            $("#matchReq").click(function(){

                let params = $("#matchReqForm").serialize();

                $.ajax({
                    type: "POST"
                    , url: "/matchReq"
                    , data: params
                    , success: function(res) {
                        if (res == 1) {
                            alert("매치에 참여하셨습니다!");
                            location.href = "/main";
                        } else {
                            alert("다시 시도해주세요")
                        }
                    }
                })
            })
        })


    </script>
</head>
<body>
<%@include file="../headerMenu.jsp"%>
<h1>매치상세</h1>
<form id="matchReqForm">
    <input type="hidden" id="matchSeq" name="matchSeq" value="<%=matchDTO.getMatchSeq()%>">
    <!-- 경기지역 -->
    <div class="form-group">
        <label for="matchLocM">경기지역</label>
        <input type="text" class="form-control" id="matchLocM" name="matchLocM" value="<%=matchDTO.getMatchLocM()%>" readonly>
    </div>
    <!-- 상세지역 -->
    <div class="form-group">
        <label for="matchLocD">상세지역</label>
        <input type="text" class="form-control" id="matchLocD" name="matchLocD" value="<%=matchDTO.getMatchLocD()%>" readonly>
    </div>
    <!-- 구장이름-->
    <div class="form-group">
        <label for="matchGmName">구장 이름</label>
        <input type="text" class="form-control" id="matchGmName" name="matchGmName" value="<%=matchDTO.getMatchGmName()%>" readonly>
    </div>
    <!-- 구장장소 -->
    <div class="form-group">
        <label for="matchGmAddr">구장 장소</label>
        <input type="text" class="form-control" id="matchGmAddr" name="matchGmAddr" value="<%=matchDTO.getMatchGmAddr()%>" readonly>
    </div>
    <!-- 경기일자 -->
    <div class="form-group">
        <label for="matchDate">경기일자</label>
        <input type="text" class="form-control" id="matchDate" name="matchDate" value="<%=matchDTO.getMatchDate()%>" readonly>
    </div>
    <!-- 경기시간 -->
    <div class="form-group">
        <label for="matchTime">경기 시간</label>
        <input type="text" class="form-control" id="matchTime" name="matchTime" value="<%=matchDTO.getMatchTime()%>" readonly>
    </div>
    <!-- 성별 -->
    <div class="form-group">
        <label for="matchGender">성별 구분</label>
        <input type="text" class="form-control" id="matchGender" name="matchGender" value="<%=matchDTO.getMatchGender()%>" readonly>
    </div>
    <div class="form-group">
        <label for="matchLevel">레벨</label>
        <input type="text" class="form-control" id="matchLevel" name="matchLevel" value="<%=matchDTO.getMatchLevel()%>" readonly>
    </div>
    <div class="form-group">
        <label for="matchLevel">모집인원</label>
        <input type="text" class="form-control" id="matchMem" name="matchMem" value="<%=matchDTO.getMatchMem()%>" readonly>
    </div>
    <div class="form-group">
        <label for="matchMap">지도</label>
        <input type="text" class="form-control" id="matchMap" name="matchMap" <%--value="<%=matchDTO.getMatchMem()%>"--%> readonly>
    </div>
    <div class="form-group">
        <input type="button" onclick="location.href='/main'" value="뒤로가기">
        <input type="button" id="matchReq" value="매칭참여">
    </div>
</form>

<%@include file="../footer.jsp"%>
</body>
</html>