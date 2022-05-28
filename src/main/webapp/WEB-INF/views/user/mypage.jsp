<%@ page import="yw.basket.dto.UserDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    String user_name = (String) session.getAttribute("userInfo");
    UserDTO Name = (UserDTO) request.getAttribute("userName");

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>마이페이지</title>

    <script type="text/javascript"> //자바스크립트를 쓴다는 것
    /*$(document).ready(function(){
        $("#userInfo").click(function(){ //버튼 이름이 userLoginSave

            let params = $("#userInfo").serialize();

            $.ajax({
                type: "POST"
                , url: "/mypage"
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
    })*/
    </script>

</head>
<body>
<div class="w3-content w3-container w3-margin-top"></div>
    <div class="w3-container w3-card-4"></div>
        <div class="w3-center w3-large w3-margin-top">
            <h3>마이페이지</h3>
        </div>
        <div>
            <form id="userInfo">
                <p>
                    <label>이름</label>
                    <input class="w3-input" type="text" id="name" name="name" value="<%=user_name%>">
                </p>
                <p>
                    <label>이메일</label>
                    <input class="w3-input" type="text" id="email" name="email" value="<%=Name.getUserEmail()%>">
                </p>
                <p>
                    <label>닉네임</label>
                    <input class="w3-input" type="text" id="nickname" name="nickname" value="<%=user.getUserNickname()%>">
                </p>
                <p>
                    <label>성별</label>
                    <input class="w3-input" type="text" id="gender" name="gender" value="<%=user.getUserGender()%>">
                </p>
                <p class="w3-center">
                    <input type="button" onclick="location.href='/memberModify'" value="회원정보 수정">
                    <input type="button" onclick="location.href='/updatePw'" value="비밀번호 변경">
                </p>
            </form>
        </div>

            <br />

<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<input type="button" onclick="location.href='/main'" value="뒤로가기">
</div>

</body>
</html>