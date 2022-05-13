<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>로그인 성공</title>
</head>
<body>
    <form action="/userReg" method="post">
        아이디:<input type="text" id="userId" name="userId"><br/>
        비밀번호:<input type="password" id="userPw" name="userPw"><br/>
        <input type="submit" value="로그인">
        <input type="button" onclick="location.href='/userReg'" value="회원가입">
        <input type="button" onclick="alert('회원가입이 완료되었습니다.');" value="회원가입">
    </form>
</body>
</html>