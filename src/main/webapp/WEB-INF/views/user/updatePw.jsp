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
            $("#updatePw").click(function(){

                let params = $("#updatePwForm").serialize();

                $.ajax({
                    type: "POST"
                    , url: "/updatePwSave"
                    , data: params
                    , success: function(res) {
                        if (res == 1) {
                            alert("비밀번호가 수정되었습니다.");
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
<form id="updatePwForm" method="post">
    <p>
        <label>현재 비밀번호</label>
        <input class="w3-input" type="password" id="userPw" name="userPw" placeholder="">
    </p>
    <p>
        <label>신규 비밀번호 변경</label>
        <input class="w3-input" type="password" id="userPwNew" name="userPwNew" placeholder="">
    </p>
    <p>
        <label>신규 비밀번호 확인</label>
        <input class="w3-input" type="password" id="userPwNewChk" name="userPwNewChk"placeholder="">
    </p>
    <p class="w3-center">
        <input type="button" value="수정완료" id="updatePw">
    </p>
</form>



<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<input type="button" onclick="location.href='/mypage'" value="뒤로가기">
    </div>
<%@include file="../footer.jsp"%>
</body>
</html>