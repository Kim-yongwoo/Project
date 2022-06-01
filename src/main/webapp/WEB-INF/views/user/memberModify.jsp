<%@ page import="yw.basket.dto.UserDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%
    UserDTO userinfo = (UserDTO) request.getAttribute("userinfo");
%>

<html>
<head>
    <%@include file="../header.jsp"%>
    <script type="text/javascript">
        $(document).ready(function(){
            $("#updateUserInfo").click(function(){

                let params = $("#updateUserInfoForm").serialize();

                $.ajax({
                    type: "POST"
                    , url: "/memberModifySave"
                    , data: params
                    , success: function(res) {
                        if (res == 1) {
                            alert("회원정보가 수정되었습니다.");
                            location.href = "/mypage";
                        } else {
                            alert("다시 시도해주세요")
                        }
                    }
                })
            })
        })
    </script>

</head>
<body>
<h2>[회원정보 수정]</h2>
<form id="updateUserInfoForm" method="post">
    <p>
        <label>이름 : </label>
        <input class="w3-input" type="text" id="userName" name="userName" value="<%=userinfo.getUserName()%>">
    </p>
    <p>
        <label>이메일</label>
        <input class="w3-input" type="text" id="userEmail" name="userEmail" value="<%=userinfo.getUserEmail()%>">
    </p>
    <p>
        <label>닉네임</label>
        <input class="w3-input" type="text" id="userNickname" name="userNickname" value="<%=userinfo.getUserNickname()%>">
    </p>
    <p>
        <label>성별</label>
        <input class="w3-input" type="text" id="userGender" name="userGender" value="<%=userinfo.getUserGender()%>">
    </p>

    <p>
        <label>레벨</label>
        <input class="w3-input" type="text" id="userLevel" name="userLevel" value="<%=userinfo.getUserLevel()%>">
    </p>

    <p class="w3-center">

        <input type="button" value="수정완료" id="updateUserInfo">
    </p>

</form>

<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<input type="button" onclick="location.href='/mypage'" value="뒤로가기">
</body>
</html>