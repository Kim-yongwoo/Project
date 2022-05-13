<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>회원가입</title>
    <script type="text/javascript">
        $(document).ready(function(){
            $("#userInfoSave").click(function(){

                let params = $("#signUpForm").serialize();

                $.ajax({
                    type: "POST"
                    , url: "/signUp"
                    , data: params
                    , success: function(res) {
                        if (res == 1) {
                            alert("회원가입이 완료되었습니다");
                            location.href = "/login";
                        } else {
                            alert("회원가입에 실패하였습니다. 다시 시도해주세요.")
                        }
                    }
                })
            })
        })
    </script>
</head>
<body>
<%--form action="/loginCheck" method="post">
    아이디:<input type="text" id="userId" name="userId"><br/>
    비밀번호:<input type="password" id="userPw" name="userPw"><br/>
    <input type="submit" value="로그인">//
</form>--%>

<form id="signUpForm">
        <h1>회원가입</h1>
        <div class="form-group"> <%--label 과 input태그를 정렬해주기 위해 form-group 사용--%>
            <label for="userId">아이디</label>  <%--label --%>
            <input type="text" class="form-control" id="userId" name="userId">
        </div><br>
        <div class="form-group">
            <label for="userPw">비밀번호</label>
            <input type="password" class="form-control" id="userPw" name="userPw">
        </div><br>
        <div class="form-group">
            <label for="userName">이름</label>
            <input type="text" class="form-control" id="userName" name="userName">
        </div><br>
         <div class="form-group">
            <label for="userEmail">이메일</label>
            <input type="text" class="form-control" id="userEmail" name="userEmail">
        </div><br>
        <div class="form-group">
            <label for="userAge">나이</label>
            <input type="number" class="form-control" id="userAge" name="userAge">
        </div><br>
        <div class="form-group">
            <label for="userGender">성별</label>
            <input type="text" class="form-control" id="userGender" name="userGender">
        </div><br>
        <div class="form-group">
            <label for="userNickname">닉네임</label>
            <input type="text" class="form-control" id="userNickname" name="userNickname">
        </div>
        <br><br>
        <input type="button" value="회원가입" id="userInfoSave">
    </div>
</form>
</body>
</html>