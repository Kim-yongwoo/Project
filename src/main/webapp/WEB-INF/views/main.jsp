<%@ page import="yw.basket.dto.MatchDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.LinkedList" %>

<%
	List<MatchDTO> matchDTOList = (List<MatchDTO>) request.getAttribute("matchDTOList");

	if (matchDTOList == null){
		matchDTOList = new LinkedList<MatchDTO>();
	}
%>

<!DOCTYPE html>
<html lang="en">
<head>
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

		})
	</script>



</head>
<body><!-- Responsive navbar-->
<%@include file="headerMenu.jsp"%>

<div class="container">

	<ul class="nav nav-tabs">
		<li class="active">
			<a href="#">Home</a>
		</li>
		<li class="dropdown">
			<a class="dropdown-toggle" data-toggle="dropdown" href="#">마이페이지 <span class="caret"></span></a>
			<ul class="dropdown-menu">
				<li><a href="/my">나의활동</a></li>
				<li><a href="/reqInfo">신청내역</a></li>
				<li><a href="/mypage">내정보</a></li>
			</ul>
		</li>
		<li><a href="/chat">채팅</a></li>
		<li><a href="/boardList">공지사항</a></li>
	</ul>

	<input type="button" onclick="location.href='/matchReg'" value="매칭시작">
</div>

<form id="getMatchForm" method="post">

	<thead>
	<tr>
		<th scope="col">경기날짜</th>
		<th scope="col">경기시간</th>
		<th scope="col">지역상세</th>
		<th scope="col">구장이름</th>
		<th scope="col">구장주소</th>
		<th scope="col">성별구분</th>
		<th scope="col">등록자</th>
	</tr>
	<%
		for (MatchDTO matchDTO : matchDTOList) {
	%>
	<tr>
		<th><%=matchDTO.getMatchDate()%></th>
		<th><%=matchDTO.getMatchTime()%></th>
		<th><%=matchDTO.getMatchLocD()%></th>
		<th><%=matchDTO.getMatchGmName()%></th>
		<th><%=matchDTO.getMatchGmAddr()%></th>
		<th><%=matchDTO.getMatchGender()%></th>
		<th><%=matchDTO.getMatchRegSeq()%></th>
	</tr>
	<%
		}
	%>
	</thead>

</form>


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