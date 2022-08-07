<%@ page import="yw.basket.dto.MatchDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.LinkedList" %>
<%@ page import="yw.basket.dto.UserDTO" %>
<%
	List<MatchDTO> matchDTOList = (List<MatchDTO>) request.getAttribute("matchDTOList");

	//Api 사진
	String image_link1 = (String) request.getAttribute("image_link1");
	String image_link2 = (String) request.getAttribute("image_link2");
	String image_link3 = (String) request.getAttribute("image_link3");

	UserDTO user = (UserDTO) session.getAttribute("user");

	if (matchDTOList == null){
		matchDTOList = new LinkedList<MatchDTO>();
	}
%>

<!DOCTYPE html>
<html lang="en">
<head>

	<!-- Bootstrap 사용을 위한 링크 -->
	<%--<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">--%>
	<%--<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>--%>

	<%@include file="header.jsp"%>
	<script type="text/javascript">
		// 매칭 참여
		function matchReq(matchSeq) {

			let params = {};
			params.matchSeq = matchSeq;

			$.ajax({
				type: "POST"
				, url: "/matchReq"
				, data: params
				, success: function(res) {
					if (res > 0) {
						alert("매치에 참여하셨습니다");
						location.href = "/main";
					} else {
						alert("다시 시도해주세요")
					}
				}
			})
		}

		// 매칭 참여 취소
		function matchReqCnc(reqSeq) {
			let params = {};
			params.reqSeq = reqSeq;

			$.ajax({
				type: "POST"
				, url: "/matchReqCnc"
				, data: params
				, success: function(res) {
					if (res > 0) {
						alert("신청취소 되었습니다.");
						location.href = "/main";
					} else {
						alert("다시 시도해주세요")
					}
				}
			})
		}

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

			$("#getMatch").click(function(){

				let params = $("#getMatchForm").serialize();

				$.ajax({
					type: "POST"
					, url: "/getMatch"
					, data: params
					, success: function(res) {
						if (res == 1) {
							alert("test");
							location.href = "/main";
						} else {
							alert("다시 시도해주세요")
						}
					}
				})
			})

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
		});
	</script>
</head>
<body><!-- Responsive navbar-->
<%@include file="headerMenu.jsp"%>

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
		for (MatchDTO matchDTO : matchDTOList) {
	%>
	<div class="row" style="font-size: 12pt; text-align: center;  border-bottom: 1px solid #cccccc" >
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

	<div class="row" style="display:flex; margin-left: 100px; margin-top: 50px">
		<div class="col-lg-4" style="text-align: right;">
			<img id="imgBasket1" class="imgBasket" src="<%=image_link1%>" style="float: left; margin-right: 150px; width: 200px; height: 300px;">
		</div>
		<div class="col-lg-4" style="text-align: right;">
			<img id="imgBasket2" class="imgBasket" src="<%=image_link2%>" style="float: left; margin-right: 150px; width: 200px; height: 300px;">
		</div>
		<div class="col-lg-4" style="text-align: right;">
			<img id="imgBasket3" class="imgBasket" src="<%=image_link3%>" style="float: left; margin-right: 150px; width: 200px; height: 300px;">
		</div>
	</div>
</div>
</form>
<br>
<%@include file="footer.jsp"%>

</body>
</html>