<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <%@include file="../header.jsp"%>

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
<section class="ftco-section">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-12 col-lg-10">
                <div class="wrap d-md-flex">
                    <div class="img" style="background-image: url(images/basketball-1.jpg);"></div>
                    <div class="login-wrap p-4 p-md-5">
                        <div class="d-flex">
                            <div class="w-100">
                                <h3 class="mb-4">Sign Up</h3>
                            </div>
                        </div>
                        <form id="signUpForm">
                            <div class="form-group mb-3 id_wrap id_input_box">
                                <label class="label" for="userId">UserID</label>
                                <input type="text" id="userId" name="userId" class="form-control id_input" placeholder="UserID" required>
                                <!-- id ajax 중복체크 -->
                                <span class="id_input_re_1">사용 가능한 아이디입니다.</span>
                                <span class="id_input_re_2">아이디가 이미 존재합니다.</span>
                                <span class="final_id_ck">아이디를 입력해주세요.</span>
                            </div>
                            <div class="form-group mb-3 pw_wrap">
                                <label class="label" for="userPw">Password</label>
                                <input type="password" id="userPw" name="userPw" class="form-control pw_input" placeholder="Password" required>
                                <span class="final_pw_ck">비밀번호를 입력해주세요.</span>
                            </div>
                            <div class="form-group mb-3 pw_wrap">
                                <label class="label" for="pwck_input">Password Check</label>
                                <input type="password" id="pwck_input" name="pwck_input" class="form-control pwck_input" placeholder="Password Check" required>
                                <span class="final_pwck_ck">비밀번호 확인을 입력해주세요.</span>
                                <span class="pwck_input_re_1">비밀번호가 일치합니다.</span>
                                <span class="pwck_input_re_2">비밀번호가 일치하지 않습니다.</span>
                            </div>
                            <div class="form-group mb-3 userName">
                                <label class="label" for="userName">userName</label>
                                <input type="text" id="userName" name="userName" class="form-control userName" placeholder="userName" required>
                                <span class="final_name_ck">이름을 입력해주세요.</span>
                            </div>
                            <div class="form-group mb-3 userEmail">
                                <label class="label" for="userEmail">userEmail</label>
                                <input type="text" id="userEmail" name="userEmail" class="form-control userEmail" placeholder="userEmail" required>
                                <span class="final_mail_ck">이메일을 입력해주세요.</span>
                                <span class="mail_input_box_warn"></span>
                            </div>


                            <div class="form-group">
                                <input class="form-control" style="width: 40%; display: inline;" placeholder="우편번호" name="addr1" id="addr1" type="text" readonly="readonly" >
                                <button type="button" class="btn btn-default" onclick="execPostCode();"><i class="fa fa-search"></i> 우편번호 찾기</button>
                            </div>
                            <div class="form-group">
                                <input class="form-control" style="top: 5px;" placeholder="도로명 주소" name="addr2" id="addr2" type="text" readonly="readonly" />
                            </div>
                            <div class="form-group">
                                <input class="form-control" placeholder="상세주소" name="addr3" id="addr3" type="text"  />
                            </div>

                        <%-- <label>* 주소 : <input type="text" name="userAddr" style="width:400px" readonly/></label>
                            <input type="button" value="우편번호" onclick="kakaoPost(this.form)"/>
                            <br/>
                            <label>* 상세 주소 : <input type="text" name="userAddrDt" style="width:400px"/></label><br/>--%>

                            <div class="form-group mb-3 userAge">
                                <label class="label" for="userAge">userAge</label>
                                <input type="number" id="userAge" name="userAge" class="form-control userAge" placeholder="userAge" required>
                            </div>
                            <div class="form-group mb-3">
                                <label class="label" for="userGender">userGender</label>
                                <select id="userGender" class="form-control" name="userGender">
                                    <option value="남자">남자</option>
                                    <option value="여자">여자</option>
                                </select>
                            </div>
                            <div class="form-group mb-3 userNickname">
                                <label class="label" for="userNickname">userNickname</label>
                                <input type="text" id="userNickname" name="userNickname" class="form-control userNickname" placeholder="userNickname" required>
                                <span class="final_name_ck">이름을 입력해주세요.</span>
                            </div>
                            <div class="form-group mb-3">
                                <label class="label" for="userLevel">userLevel</label>
                                <select id="userLevel" class="form-control" name="userLevel">
                                    <option value="비기너">비기너</option>
                                    <option value="아마추어">아마추어</option>
                                    <option value="일반">일반</option>
                                </select>
                            </div>
                            <div class="form-group mb-3">
                                <label class="label" for="userPlayer">userPlayer</label>
                                <select id="userPlayer" class="form-control" name="userPlayer">
                                    <option value="마이클 조던">마이클 조던</option>
                                    <option value="클레이 탐슨">클레이 탐슨</option>
                                    <option value="르브론 제임스">르브론 제임스</option>
                                    <option value="스테판 커리">스테판 커리</option>
                                    <option value="야니스 아데토쿤보">야니스 아데토쿤보</option>
                                    <option value="제임스 하든">제임스 하든</option>

                                </select>
                            </div>
                            <div class="form-group">
                                <button type="button" id="userInfoSave" class="form-control btn btn-primary rounded submit px-3">Sign In</button>
                            </div>
                            <div class="form-group d-md-flex">
                                <div class="w-100 text-right">
                                    <a data-toggle="tab" href="#" onclick="location.href='/login'">Back</a>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<script>

    let code = "";

    /* 유효성 검사 통과유무 변수 */
    let idCheck = false;			// 아이디
    let idckCheck = false;			// 아이디 중복 검사
    let pwCheck = false;			// 비번
    let pwckCheck = false;			// 비번 확인
    let pwckcorCheck = false;		// 비번 확인 일치 확인
    let nameCheck = false;			// 이름
    let mailCheck = false;			// 이메일
    let mailnumCheck = false;		// 이메일 인증번호 확인



    $(document).ready(function() {
        //회원가입 버튼(회원가입 기능 작동)
        $(".join_button").click(function () {

            /* 입력값 변수 */
            let userId = $('.id_input').val(); 				// id 입력란
            let userPw = $('.pw_input').val();				// 비밀번호 입력란
            let userPwChk = $('.pwck_input').val();			// 비밀번호 확인 입력란
            let userName = $('.user_input').val();			// 이름 입력란
            let userEmail = $('.mail_input').val();			// 이메일 입력란

            /* 아이디 유효성검사 */
            if (userId == "") {
                $('.final_id_ck').css('display', 'block');
                idCheck = false;
            } else {
                $('.final_id_ck').css('display', 'none');
                idCheck = true;
            }

            /* 비밀번호 유효성 검사 */
            if (userPw == "") {
                $('.final_pw_ck').css('display', 'block');
                pwCheck = false;
            } else {
                $('.final_pw_ck').css('display', 'none');
                pwCheck = true;
            }

            /* 비밀번호 확인 유효성 검사 */
            if (userPwChk == "") {
                $('.final_pwck_ck').css('display', 'block');
                pwckCheck = false;
            } else {
                $('.final_pwck_ck').css('display', 'none');
                pwckCheck = true;
            }



            /* 이름 유효성 검사 */
            if (userName == "") {
                $('.final_name_ck').css('display', 'block');
                nameCheck = false;
            } else {
                $('.final_name_ck').css('display', 'none');
                nameCheck = true;
            }

            /* 이메일 유효성 검사 */
            if (userEmail == "") {
                $('.final_mail_ck').css('display', 'block');
                mailCheck = false;
            } else {
                $('.final_mail_ck').css('display', 'none');
                mailCheck = true;
            }


            /* 최종 유효성 검사 */
            if (idCheck && idckCheck && pwCheck && pwckCheck && pwckcorCheck && nameCheck && mailCheck && mailnumCheck) {
                $("#signUpForm").attr("action", "/user/reg");
                $("#signUpForm").submit();

            }

            return false;
        });
    });

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
                    idckCheck = true;
                } else {
                    $('.id_input_re_2').css("display","inline-block");
                    $('.id_input_re_1').css("display", "none");
                    idckCheck = false;
                }
            }//success종료
        }); // ajax 종료

    });// function 종료


    /* 인증번호 이메일 전송 */
    $(".mail_check_button").click(function(){

        let userEmail = $(".mail_input").val();			// 입력한 이메일
        let checkBox = $(".mail_check_input");		// 인증번호 입력란
        let boxWrap = $(".mail_check_input_box");	// 인증번호 입력란 박스
        let warnMsg = $(".mail_input_box_warn");	// 이메일 입력 경고글

        /* 이메일 형식 유효성 검사 */
        if(mailFormCheck(userEmail)){
            warnMsg.html("이메일이 전송 되었습니다. 이메일을 확인해주세요.");
            warnMsg.css("display", "inline-block");
        } else {
            warnMsg.html("올바르지 못한 이메일 형식입니다.");
            warnMsg.css("display", "inline-block");
            return false;
        }

        $.ajax({

            type:"GET",
            url:"mailCheck?email=" + email,
            success:function(data){

                checkBox.attr("disabled",false);
                boxWrap.attr("id", "mail_check_input_box_true");
                code = data;

            }

        });

    });

    /* 비밀번호 확인 일치 유효성 검사 */
    $('.pwck_input').on("propertychange change keyup paste input", function(){

        let userPw = $('.pw_input').val();
        let userPwChk = $('.pwck_input').val();
        $('.final_pwck_ck').css('display', 'none');

        if(userPw == userPwChk){
            $('.pwck_input_re_1').css('display','block');
            $('.pwck_input_re_2').css('display','none');
            pwckcorCheck = true;
        }else {
            $('.pwck_input_re_1').css('display', 'none');
            $('.pwck_input_re_2').css('display', 'block');
            pwckcorCheck = false;
        }

    });


    /* 입력 이메일 형식 유효성 검사 */
    function mailFormCheck(userEmail){
        let form = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
        return form.test(userEmail);
    }
</script>

</body>
</html>