<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <%@include file="../header.jsp"%>

    <script type="text/javascript"> //자바스크립트를 쓴다는 것
        $(document).ready(function(){
            $("#userLoginSave").click(function(){ //버튼 이름이 userLoginSave

                let params = $("#loginForm").serialize();

                $.ajax({
                    type: "POST"
                    , url: "/loginCheck"
                    , data: params
                    , success: function(res) {


                        if (res > 0) {
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
<%@include file="../headerMenu.jsp"%>

<div class="container">
    <form id="loginForm" action="/loginProc", method="post">
        아이디:<input type="text" id="userId" name="userId"/><br/>
        비밀번호:<input type="password" id="userPw" name="userPw"/><br/>
        <%--<input type="submit" value="로그인">--%>
        <input type="submit" value="로그인">
        <input type="button" onclick="location.href='/userReg'" value="회원가입">

    </form>
</div>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<!-- Content section-->
<section class="py-5">
    <div class="container my-5">
        <div class="row justify-content-center">

        </div>
    </div>
</section>

<%@include file="../footer.jsp"%>
</body>
</html>