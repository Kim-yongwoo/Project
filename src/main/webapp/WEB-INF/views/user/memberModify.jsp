<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>회원정보 수정</title>

</head>
<body>
<h2>[회원정보 수정]</h2>
<form id="memberModify">
    <div>이름<input type="text" name="userName" id="userName" value="${modifyName}" ></div>
    <div>이메일<input type="text" name="userEmail" id="userEmail" value="${modifyEmail}"></div>
    <div>닉네임<input type="text" name="userNickname" id="userNickname" value="${modifyNickname}"></div>
    <div>성별<input type="text" name="userGender" id="userGender" value="${modifyGender}"></div>

    <button type="submit" id="updateUserInfo" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">수정완료</button>

</form>

<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<input type="button" onclick="location.href='/mypage'" value="뒤로가기">
</body>
</html>