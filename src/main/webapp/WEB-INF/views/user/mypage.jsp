<%@ page import="yw.basket.dto.UserDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%

    //API 사진
    String image_link = (String) request.getAttribute("image_link");

    UserDTO userinfo = (UserDTO) request.getAttribute("userinfo");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <%@include file="../header.jsp"%>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>마이페이지</title>

    <script type="text/javascript"> //자바스크립트를 쓴다는 것
    $(document).ready(function(){
        $("#memberOut").click(function(){ //버튼 이름이 userLoginSave

            let delConfirm = confirm('탈퇴하시겠습니까?');
            if (delConfirm) {
                $.ajax({
                    type: "POST"
                    , url: "/memberOut"
                    , data: {}
                    , success: function(res) {
                        if (res > 0) {
                            alert("회원탈퇴 되었습니다.");
                            location.href = "/login";
                        } else {
                            alert("다시 시도해주세요.")
                        }
                    }
                })
            }
        })


        /*let playerNamesIdx = 0;
        let playerNames = ["마이클 조던", "클레이 탐슨", "르브론 제임스", "스테판 커리", "야니스 아데토쿤보", "제임스 하든"];
        // 사진 클릭
        $("#imgBasket").click(function(){

            // 선수이름 배열 인덱스 초기화
            if (playerNamesIdx >= playerNames.length) {
                playerNamesIdx = 0;
            }

            $.ajax({
                type: "POST"
                , url: "/searchImageApi"
                , data: {"playerName" : playerNames[playerNamesIdx]}
                , success: function(image_link) {
                    $("#imgBasket").attr("src", image_link);
                    playerNamesIdx++;
                }
            })
        })*/
    })
    </script>

</head>
<body>
<%@include file="../headerMenu.jsp"%>
<div style="margin: 50px 0 0 200px;">

    <img id="imgBasket" src="<%=image_link%>" style="float: right; margin-right: 250px; width: 500px; height: 600px;">
  <%--  <img id="imgBasket" src="<%=image_link%>" style="float: right; margin-right: 250px; width: 500px; height: 600px; object-fit: cover">--%>
<div class="w3-content w3-container w3-margin-top"></div>
    <div class="w3-container w3-card-4"></div>
        <div class="w3-center w3-large w3-margin-top">
            <h3>마이페이지</h3>
            <br><br>
        </div>
        <div>
            <form id="userInfo">
                <p>
                    <label>이름 : </label>
                    <span><%=userinfo.getUserName()%></span>
                </p>
                <p>
                    <label>이메일 : </label>
                    <span><%=userinfo.getUserEmail()%></span>
                </p>
                <p>
                    <label>닉네임 : </label>
                    <span><%=userinfo.getUserNickname()%></span>
                </p>
                <p>
                    <label>성별 : </label>
                    <span><%=userinfo.getUserGender()%></span>
                </p>

                <p>
                    <label>레벨 : </label>
                    <span><%=userinfo.getUserLevel()%></span>
                </p>
                <p>
                    <label>나의 선수 : </label>
                    <span><%=userinfo.getUserPlayer()%></span>
                </p>
                <br><br>
                <p class="w3-center">
                    <input type="button" onclick="location.href='/memberModify'" value="회원정보 수정">
                    <input type="button" onclick="location.href='/updatePw'" value="비밀번호 변경">
                    <input type="button" id="memberOut" value="회원탈퇴">
                </p>
            </form>
        </div>

            <br/>


<%--<input type="button" onclick="location.href='/main'" value="뒤로가기">--%>
</div>
<br><br><br><br><br>
<%@include file="../footer.jsp"%>
</body>
</html>