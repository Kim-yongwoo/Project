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
<%@include file="../headerMenu.jsp"%>
<div style="margin-left: 200px;">
<h3>회원정보 수정</h3>
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
        <%--<input class="w3-input" type="text" id="userGender" name="userGender" value="<%=userinfo.getUserGender()%>">--%>
        <select id="userGender" name="userGender">
            <option value="남자">남자</option>
            <option value="여자">여자</option>
        </select>
    </p>

    <p>
        <label>레벨</label>
        <%--<input class="w3-input" type="text" id="userLevel" name="userLevel" value="<%=userinfo.getUserLevel()%>">--%>
        <select id="userLevel" name="userLevel">
            <option value="비기너">비기너</option>
            <option value="아마추어">아마추어</option>
            <option value="일반">일반</option>
        </select>
    </p>

    <p class="w3-center">

        <input type="button" value="수정완료" id="updateUserInfo">
    </p>

</form>

<br><br><br><br><br><br><br><br><br><br><br><br><br>
<input type="button" onclick="location.href='/mypage'" value="뒤로가기">
</div>
<%@include file="../footer.jsp"%>
</body>
</html>