<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>로그인</title>
    <script type="text/javascript"> //자바스크립트를 쓴다는 것
        $(document).ready(function(){
            $("userLoginSave").click(function(){

                let params = $("#signUpForm").serialize();

                $.ajax({
                    type: "POST"
                    , url: "/loginCheck"
                    , data: params
                    , success: function(res) {
                        if (res == 1) {
                            alert("환영합니다!");
                            location.href = "/main";
                        } else {
                            alert("로그인에 실패하였습니다. 다시 시도해주세요.")
                        }
                    }
                })
            })
        })

    </script>
</head>
<body>
    <form id="loginForm">
        아이디:<input type="text" id="userId" name="userId"><br/>
        비밀번호:<input type="password" id="userPw" name="userPw"><br/>
        <%--<input type="submit" value="로그인">--%>
        <input type="button" value="로그인" id="userLoginSave">
        <input type="button" onclick="location.href='/userReg'" value="회원가입">

    </form>
</body>
</html>