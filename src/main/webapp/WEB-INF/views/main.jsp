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
	<%--<script src="https://cdn.jsdelivr.net/npFm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>--%>

	<%@include file="header.jsp"%>
	<script defer src="https://use.fontawesome.com/releases/v5.15.2/js/all.js" integrity="sha384-vuFJ2JiSdUpXLKGK+tDteQZBqNlMwAjhZ3TvPaDfN9QmbPb7Q8qUpbSNapQev3YF" crossorigin="anonymous"></script>
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
					} else if (res == -1) {
						alert("레벨을 선택 후 다시 신청해주세요");
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
				});
			});

			//날씨 데이터 불러오기
			$.ajax({
				url:'https://api.openweathermap.org/data/2.5/weather?q=Goyang-si&appid=인증키',

				dataType:'json',
				type:'GET',
				success:function(data){
					var $Icon = data.weather[0].icon;
					$('.weather-info').append('<img src="http://openweathermap.org/img/wn/' + $Icon + '@2x.png" />');
				}
			});

			//코로나 데이터 불러오기
			$.ajax({
				url:'https://api.corona-19.kr/korea/?serviceKey=인증키',

				dataType:'json',
				type:'GET',
				success:function(data){
					let $totalCase = data.TotalCase;//누적확진자
					let $previousDayCase = data.TotalCaseBefore;//전일 0시 기준 신규확진자 수
					let $totalDeath = data.TotalDeath;//누적 사망자
					let $updateTime = data.updateTime;//

					let split_update_time = $updateTime.split('(');
					split_update_time = split_update_time[1].split(' ');

					let updateDate = split_update_time[0];

					let newCaseCount = $previousDayCase.replace(/\B(?=(\d{3})+(?!\d))/g, ',');

					let _date = new Date(updateDate);

					let previous_date = new Date(_date.setDate(_date.getDate() - 1));
					let previous_date_month = previous_date.getMonth()+1
					let previous_date_date = previous_date.getDate()

					$('.updateDate').text(previous_date_month + '.' + previous_date_date);
					$('.newCaseCount').text(newCaseCount);
					$('.totalCaseCount').text($totalCase);
					$('.totalDeathCount').text($totalDeath);

					$('.corona19').css('visibility', 'visible');
				}
			});
		});
	</script>
</head>
<body><!-- Responsive navbar-->
<%@include file="headerMenu.jsp"%>

<div style="margin: 50px 0 0 200px; display: flex; justify-content: space-between; align-items: center;">
	<div>
		<div><%--<%= user.getUserSeq() %> --%><%= user.getUserName() %> 님</div>
		<input type="button" onclick="location.href='/matchReg'" value="매칭시작">
	</div>
	<div style="display: flex; justify-content: center; align-items: center;">
		<div class="weather-info"></div>
		<div class="corona19" style="visibility: hidden; margin-right: 25px;">
			<div class="newCase">
				<span class="updateDate" style="font-size: 20px; font-weight: bold; color: black;"></span>&nbsp;
				<span class="newCaseTitle" style="font-size: 20px; font-weight: bold; color: black;">신규 확진자</span>&nbsp;
				<span class="newCaseCount" style="font-size: 20px; font-weight: bold; color: red;"></span>
			</div>
			<div style="text-align: center;">
				<span class="totalDeathTitle">누적 확진자</span>&nbsp;
				<span class="totalCaseCount" style="color: red;"></span>
			</div>
			<div style="text-align: center;">
				<span class="totalDeathTitle">누적 사망자</span>&nbsp;
				<span class="totalDeathCount" style="color: red;"></span>
			</div>
		</div>
	</div>
</div>
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