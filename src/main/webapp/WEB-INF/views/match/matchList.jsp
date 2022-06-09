<%@ page import="yw.basket.dto.UserDTO" %>
<%@ page import="yw.basket.dto.MatchDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.LinkedList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    List<MatchDTO> matchDTOList = (List<MatchDTO>) request.getAttribute("matchDTOList");
    String image_link = (String) request.getAttribute("image_link");

    if (matchDTOList == null){
        matchDTOList = new LinkedList<MatchDTO>();
    }

    UserDTO userinfo = (UserDTO) request.getAttribute("userinfo");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <%@include file="../header.jsp"%>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>경기 리스트</title>

   <%-- <script type="text/javascript"> //자바스크립트를 쓴다는 것
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
    })
    </script>--%>

</head>
<body>
<%@include file="../headerMenu.jsp"%>
<div class="w3-content w3-container w3-margin-top"></div>
    <div class="w3-container w3-card-4"></div>
        <div class="w3-center w3-large w3-margin-top">

            <form id="getMatchForm" method="post">

                <br><br>

                <div class="btn-div">
                    <div class="btn-group">
                        <br>
                        <a class="btn btn-outline-secondary">경기날짜</a>
                        <a class="btn btn-outline-secondary">경기시간</a>
                        <a class="btn btn-outline-secondary">지역상세</a>
                        <a class="btn btn-outline-secondary">구장이름</a>
                        <a class="btn btn-outline-secondary">구장주소</a>
                        <a class="btn btn-outline-secondary">성별구분</a>
                        <a class="btn btn-outline-secondary">등록자</a>
                        <br>
                    </div>
                    <br>
                </div>
                <thead>

                <%
                    for (MatchDTO matchDTO : matchDTOList) {
                %>
                <br>
                <tr>
                    <th><%=matchDTO.getMatchDate()%></th>
                    <th><%=matchDTO.getMatchTime()%></th>
                    <th><%=matchDTO.getMatchLocD()%></th>
                    <th><%=matchDTO.getMatchGmName()%></th>
                    <th><%=matchDTO.getMatchGmAddr()%></th>
                    <th><%=matchDTO.getMatchGender()%></th>
                    <th><%=matchDTO.getMatchRegSeq()%></th>
                </tr>
                <input type="button" onclick="location.href='/matchReq'" value="참여하기">
                <br>
                <%
                    }
                %>

                </thead>
            </form>
        </div>
          <br/>

<br><br><br><br><br><br><br><br><br><br><br><br><br>
<input type="button" onclick="location.href='/main'" value="뒤로가기">
</div>

<%@include file="../footer.jsp"%>
</body>
</html>