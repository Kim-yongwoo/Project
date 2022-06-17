<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- Responsive navbar-->
<section class="ftco-section">
	<div class="container">
		<div class="row justify-content-between">
			<div class="col">
				<a class="navbar-brand" href="/main">Basket <span>Life</span></a>
			</div>
		</div>
	</div>
	<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
		<div class="container">

			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
				<span class="fa fa-bars"></span> Menu
			</button>
			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active"><a href="/main" class="nav-link">Home</a></li>
					<li class="nav-item dropdown">
						<%--<a class="nav-link dropdown-toggle" href="#" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">MyPage</a>
						<div class="dropdown-menu" aria-labelledby="dropdown04">-
							<a class="dropdown-item" href="/my">나의활동</a>
							<a class="dropdown-item" href="/reqInfo">신청내역</a>
							<a class="dropdown-item" href="/mypage">내정보</a>--%>

					<%--<li class="nav-item"><a href="/my" class="nav-link">나의활동</a></li>--%>
					<li class="nav-item"><a href="/reqList" class="nav-link">나의활동</a></li>
					<li class="nav-item"><a href="/mypage" class="nav-link">내정보</a></li>

					</li>
					<li class="nav-item"><a href="/chat" class="nav-link">Chat</a></li>
					<li class="nav-item"><a href="/boardList" class="nav-link">Notice</a></li>
				</ul>
			</div>
				</ul>
			</div>
		</div>
	</nav>
	<!-- END nav -->

</section>
<!-- Header - set the background image for the header in the line below-->
</html>