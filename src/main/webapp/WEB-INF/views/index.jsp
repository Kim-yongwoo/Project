<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<meta name="description" content="" />
	<meta name="author" content="" />
	<title>Basket Life</title>
	<!-- Favicon-->
	<link rel="icon" type="image/x-icon" href="../../bootstrap/startbootstrap-full-width-pics-gh-pages/assets/favicon.ico" />
	<!-- Core theme CSS (includes Bootstrap)-->
	<link href="../../bootstrap/startbootstrap-full-width-pics-gh-pages/css/styles.css" rel="stylesheet" />


	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>메인</title>
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
		})
	</script>



</head>
<body>
<!-- Responsive navbar-->
<nav class="navbar navbar-expand-lg navbar-dark bg-warning">
	<div class="container">
		<a class="navbar-brand" href="#!">Basket Life</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link active" aria-current="page" href="#!">Home</a></li>
				<li class="nav-item"><a class="nav-link" href="#!">About</a></li>
				<li class="nav-item"><a class="nav-link" href="#!">Contact</a></li>
			</ul>
		</div>
	</div>
</nav>
<!-- Header - set the background image for the header in the line below-->

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

		<h4>Match</h4>
		<form id="matchForm" >
			<select id="matchLocM" name="matchLocM">
				<option value="">지역선택</option>
				<option value="서울">서울</option>
				<option value="경기">경기</option>
			</select>
			<select id="matchLocD" name="matchLocD">
				<option value="">지역상세선택</option>
			</select>

			<select name="userLevel">
				<option value="">레벨선택</option>
				<option value="비기너">비기너</option>
				<option value="아마추어">아마추어</option>
				<option value="일반">일반</option>
			</select>


			<input type="date" id="matchDate" name="matchDate">
			<input type="button" onclick="location.href='/matchSave'" value="매칭시작">
		</form>
	</div>
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
<!-- Footer-->
<footer class="py-5 bg-warning">
	<div class="container"><p class="m-0 text-center text-white">Basket Life</p></div>
</footer>
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="../../bootstrap/startbootstrap-full-width-pics-gh-pages/js/scripts.js"></script>
</body>
</html>
