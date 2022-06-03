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
            $("#matchRegSave").click(function(){

                let params = $("#matchRegSaveForm").serialize();

                $.ajax({
                    type: "POST"
                    , url: "/matchRegSave"
                    , data: params
                    , success: function(res) {
                        if (res == 1) {
                            alert("매치가 생성되었습니다.");
                            location.href = "/main";
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
<%@include file="../headerMenu.jsp"%>
<h2>[매칭 가자!!!!!]</h2>

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


</body>
</html>