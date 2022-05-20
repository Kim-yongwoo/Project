<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>비밀번호 변경</title>

</head>
<body>
<form id="pwForm">
    <input type="hidden" name="id" value="${ member.id }">
    <p>
        <label>현재 비밀번호</label>
        <input class="w3-input" id="old_pw" name="old_pw" type="password" required>
    </p>
    <p>
        <label>비밀번호 변경</label>
        <input class="w3-input" id="pw" name="pw" type="password" required>
    </p>
    <p class="w3-center">
        <button type="submit" id="updatePw" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">비밀번호 변경</button>
    </p>
</form>
</div>
</div>
</div>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<input type="button" onclick="location.href='/mypage'" value="뒤로가기">
</body>
</html>