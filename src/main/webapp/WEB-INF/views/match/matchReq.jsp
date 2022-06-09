
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<html>
<head>
    <%@include file="../header.jsp"%>
    <script type="text/javascript">
        $(document).ready(function(){
            $("#matchReq").click(function(){

                let params = $("#matchReqForm").serialize();

                $.ajax({
                    type: "POST"
                    , url: "/matchReq"
                    , data: params
                    , success: function(res) {
                        if (res > 0) {
                            alert("매치에 참여하셨습니다");
                            location.href = "/main";
                        } else {
                            alert("다시 시도해주세요")
                        }
                    }
                })
            })

            /*$("#matchRegSave").click(function(){

                let params = $("#matchRegSaveForm").serialize();

                $.ajax({
                    type: "POST"
                    , url: "/matchRegSave"
                    , data: params
                    , success: function(res) {
                        if (res == 1) {
                            alert("매치가 생성되었습니다");
                            location.href = "/main";
                        } else {
                            alert("다시 시도해주세요")
                        }
                    }
                })
            })*/
        })


    </script>
</head>
<body>
<%@include file="../headerMenu.jsp"%>
    <h1>매치정보</h1>
    <form id="matchReqForm" method="post">
        <!-- 경기지역 -->
        <div class="form-group">
            <label for="matchLocM">경기지역</label>
            <select id="matchLocM" class="form-control" name="matchLocM">
                <option value="">지역선택</option>
                <option value="서울">서울</option>
                <option value="경기">경기</option>
            </select>
        </div>
        <!-- 상세지역 -->
        <div class="form-group">
            <label for="matchLocD">상세지역</label>
            <select id="matchLocD" class="form-control" name="matchLocD">
                <option value="">지역상세선택</option>
            </select>
        </div>
        <!-- 구장이름-->
        <div class="form-group">
            <label for="matchGmName">구장 이름</label>
            <input type="text" class="form-control" id="matchGmName" name="matchGmName" value="테스트구장이름">
        </div>
        <!-- 구장장소 -->
        <div class="form-group">
            <label for="matchGmAddr">구장 장소</label>
            <input type="text" class="form-control" id="matchGmAddr" name="matchGmAddr" value="테스트구장장소">
        </div>
        <!-- 경기일자 -->
        <div class="form-group">
            <label for="matchDate">경기일자</label>
            <input type="date" class="form-control" id="matchDate" name="matchDate">
        </div>
        <!-- 경기시간 -->
        <div class="form-group">
            <label for="matchTime">경기 시간</label>
            <select id="matchTime" class="form-control" name="matchTime">
                <option value="15:00~17:00">15:00~17:00</option>
                <option value="17:00~19:00">17:00~19:00</option>
                <option value="19:00~21:00">19:00~21:00</option>
            </select>
        </div>
        <!-- 성별 -->
        <div class="form-group">
            <label for="matchGender">성별 구분</label>
            <select id="matchGender" class="form-control" name="matchGender">
                <option value="남자">남자</option>
                <option value="여자">여자</option>
            </select>



        </div>

    </form>

<%@include file="../footer.jsp"%>
</body>
</html>