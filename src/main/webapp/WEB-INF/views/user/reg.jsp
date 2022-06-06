<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
    /* 중복아이디 존재하지 않는경우 */
    .id_input_re_1{
    color : green;
    display : none;
    }
    /* 중복아이디 존재하는 경우 */
    .id_input_re_2{
    color : red;
    display : none;
    }

    </style>

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



            //아이디 중복검사
            $('.id_input').on("propertychange change keyup paste input", function(){

                let userId = $('.id_input').val();			// .id_input에 입력되는 값
                let data = {userId : userId}				// '컨트롤에 넘길 데이터 이름' : '데이터(.id_input에 입력되는 값)'

                $.ajax({
                    type : "post",
                    url : "/idCheck",
                    data : data,
                    success : function(res){

                        if(res != 'fail'){
                            $('.id_input_re_1').css("display","inline-block");
                            $('.id_input_re_2').css("display", "none");
                        } else {
                            $('.id_input_re_2').css("display","inline-block");
                            $('.id_input_re_1').css("display", "none");
                        }

                    }//success종료
                }); // ajax 종료

            });// function 종료


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
        <%--<div class="form-group"> &lt;%&ndash;label 과 input태그를 정렬해주기 위해 form-group 사용&ndash;%&gt;
            <label for="userId">아이디</label>
            <input type="text" class="form-control" id="userId" name="userId">--%>

    <div class="id_wrap">
        <div class="id_name">아이디</div>
        <div class="id_input_box">
            <input type="text" class="id_input" name="userId">
        </div>
    <!-- id ajax 중복체크 -->
            <span class="id_input_re_1">사용 가능한 아이디입니다.</span>
            <span class="id_input_re_2">아이디가 이미 존재합니다.</span>
        </div><br>

    <div class="userPw">
        <div class="userPw">비밀번호</div>
        <div class="userPw">
            <input type="password" class="userPw" name="userPw">
        </div>
    </div><br>

    <div class="userName">
        <div class="userName">이름</div>
        <div class="userName">
            <input type="text" class="userName" name="userName">
        </div>
    </div><br>

    <div class="userEmail">
        <div class="userEmail">이메일</div>
        <div class="userEmail">
            <input type="text" class="userEmail" name="userEmail">
        </div>
    </div><br>

    <div class="userAge">
        <div class="userAge">나이</div>
        <div class="userAge">
            <input type="number" class="userAge" name="userAge">
        </div>
    </div><br>

    <div class="form-group">
        <label for="userGender">성별</label>
        <select id="userGender" class="form-control" name="userGender">
            <option value="남자">남자</option>
            <option value="여자">여자</option>
        </select>
    </div><br>

    <div class="userNickname">
        <div class="userNickname">닉네임</div>
        <div class="userNickname">
            <input type="text" class="userNickname" name="userNickname">
        </div>
    </div><br>

    <div class="form-group">
        <label for="userLevel">레벨</label>
        <select id="userLevel" class="form-control" name="userLevel">
            <option value="비기너">비기너</option>
            <option value="아마추어">아마추어</option>
            <option value="일반">일반</option>
        </select>
    </div>


        <input type="button" value="회원가입" id="userInfoSave">
    </div>
</form>
</body>
</html>