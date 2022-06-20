<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <%@include file="../header.jsp"%>

</head>
<body>
<section class="ftco-section">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-12 col-lg-10">
                <div class="wrap d-md-flex">
                    <div class="img" style="background-image: url(/images/basketball-1.jpg);"></div>
                    <div class="login-wrap p-4 p-md-5">
                        <div class="d-flex">
                            <div class="w-100">
                                <h3 class="mb-4">Sign Up</h3>
                            </div>
                        </div>
                        <form id="signUpForm" onsubmit="doFindPw(event)">
                            <div class="form-group mb-3 id_wrap id_input_box">
                                <label class="label" for="userId">UserID</label>
                                <input type="text" id="userId" name="userId" class="form-control id_input" placeholder="UserID" required>
                            </div>


                            <div class="form-group mb-3 userEmail">
                                <label class="label" for="userEmail">userEmail</label>
                                <input type="email" id="userEmail" name="userEmail" class="form-control userEmail mail_input" placeholder="userEmail" required>
                                <span class="final_mail_ck">이메일을 입력해주세요.</span>
                                <span class="mail_input_box_warn"></span>
                            </div>
                            <div class="form-group">
                                <button type="submit" id="userInfoSave" class="form-control btn btn-primary rounded submit px-3">이메일 발송 </button>
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
    function doFindPw(event) {
        event.preventDefault();
        let userId = $("#userId").val();
        let userEmail = $("#userEmail").val();
        $.ajax({
            type: "get"
            , url: "/emailCheck"
            ,contentType: 'application/json; charset=utf-8'
            , data: {
                userId : userId,
                userEmail : userEmail
            }
            , success: function(res) {
                if (res > 0) {
                    alert("해당 이메일로 임시비밀번호를 발송하였습니다.");
                    location.href = "/login";
                } else {
                    alert("다시 시도해주세요.")
                }
            }
        })
    }

</script>
</body>
</html>