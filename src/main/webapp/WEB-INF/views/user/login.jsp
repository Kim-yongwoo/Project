<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <%@include file="../header.jsp"%>

    <script type="text/javascript"> //자바스크립트를 쓴다는 것
        $(document).ready(function(){
            $("#signIn").click(function(){ //버튼 이름이 userLoginSave

                let params = $("#loginForm").serialize();

                $.ajax({
                    type: "POST"
                    , url: "/loginProc"
                    , data: params
                    , success: function(res) {
                        console.log(res);
                        if (res != '') {
                            alert("환영합니다!");
                            location.href = "/main";
                        } else {
                            alert("로그인에 실패하였습니다. 다시 시도해주세요.")
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
                    <div class="img" style="background-image: url(../../../images/basketball-1.jpg);"></div>
                    <div class="login-wrap p-4 p-md-5">
                        <div class="d-flex">
                            <div class="w-100">
                                <h3 class="mb-4">Sign In</h3>
                            </div>
                        </div>
                        <form id="loginForm">
                            <div class="form-group mb-3">
                                <label class="label" for="userId">UserID</label>
                                <input type="text" id="userId" name="userId" class="form-control" placeholder="UserID" required>
                            </div>
                            <div class="form-group mb-3">
                                <label class="label" for="userPw">Password</label>
                                <input type="password" id="userPw" name="userPw" class="form-control" placeholder="Password" required>
                            </div>
                            <div class="form-group">
                                <button type="button" id="signIn" class="form-control btn btn-primary rounded submit px-3">Sign In</button>
                            </div>
                            <div class="form-group d-md-flex">
                                <div class="w-100 text-md-right">
                                    <a href="#">Forgot Password</a>
                                </div>
                            </div>
                        </form>
                        <p class="text-center">Not a member? <a data-toggle="tab" href="#" onclick="location.href='/userReg'">Sign Up</a></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
</html>