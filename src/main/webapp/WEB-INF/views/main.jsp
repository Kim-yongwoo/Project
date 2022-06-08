<%@ page import="yw.basket.dto.MatchDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.LinkedList" %>

<%
	List<MatchDTO> matchDTOList = (List<MatchDTO>) request.getAttribute("matchDTOList");
	String image_link = (String) request.getAttribute("image_link");

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


			$("#matchStart").click(function(){

				let params = $("#matchStartForm").serialize();

				$.ajax({
					type: "POST"
					, url: "/matchStart"
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
			})

		})
	</script>



</head>
<body><!-- Responsive navbar-->
<%@include file="headerMenu.jsp"%>

<div class="container">

	<ul class="nav nav-tabs">
		<li class="active">
			<a href="/main">Home</a>
		</li>
		<li class="dropdown">
			<a class="dropdown-toggle" data-toggle="dropdown" href="#">마이페이지 <span class="caret"></span></a>
			<%--<ul class="dropdown-menu">--%>
				<a href="/my">나의활동</a>
				<a href="/reqInfo">신청내역</a>
				<a href="/mypage">내정보</a>
			<%--</ul>--%>
		<li><a href="/chat">채팅</a></li>
		<li><a href="/boardList">공지사항</a></li>
	</ul>

	<input type="button" onclick="location.href='/matchReg'" value="매칭시작">
</div>

<%--<input style="float: left; margin-right: 150px; width: 500px; height: 700px;">--%>
<form id="getMatchForm" method="post">

	<br><br>
	<div style="margin-left: 200px;"></div>


	<div class="btn-div">
		<div class="btn-group">
			<br>
			<a class="btn btn-outline-secondary">경기날짜</a>
			<a class="btn btn-outline-secondary">경기시간</a>
			<a class="btn btn-outline-secondary">지역상세</a>
			<a class="btn btn-outline-secondary">구장이름</a>
			<a class="btn btn-outline-secondary">구장주소</a>
			<a class="btn btn-outline-secondary">성별구분</a>
			<a class="btn btn-outline-secondary">등록자</a>
			<br>
		</div>
		<br>
	</div>
	<thead>

	<%
		for (MatchDTO matchDTO : matchDTOList) {
	%>
	<br>
	<tr>
		<th><%=matchDTO.getMatchDate()%></th>
		<th><%=matchDTO.getMatchTime()%></th>
		<th><%=matchDTO.getMatchLocD()%></th>
		<th><%=matchDTO.getMatchGmName()%></th>
		<th><%=matchDTO.getMatchGmAddr()%></th>
		<th><%=matchDTO.getMatchGender()%></th>
		<th><%=matchDTO.getMatchRegSeq()%></th>
	</tr>
	<input type="button" onclick="location.href='/matchStart?matchSeq=<%=matchDTO.getMatchSeq()%>' " value="참여하기<%=matchDTO.getMatchRegSeq()%>">


	<br>
	<%
		}
	%>

	</thead>
</form>

<form id="matchStartForm" method="post">



</form>

<img src="<%=image_link%>" style="float: right; margin-right: 150px; width: 500px; height: 700px;">

</header>
<!-- Content section-->
<section class="py-5">
	<div class="container my-5">
		<div class="row justify-content-center">


		</div>
	</div>
</section>
<!-- Image element - set the background image for the header in the line below-->
<!-- Put anything you want here! The spacer below with inline CSS is just for demo purposes!-->
<div style="height: 20rem"></div>
</div>
<!-- Content section-->
<section class="py-5">
	<div class="container my-5">
		<div class="row justify-content-center">

		</div>
	</div>
</section>
<br><br><br><br>
<%@include file="footer.jsp"%>

</body>
</html>