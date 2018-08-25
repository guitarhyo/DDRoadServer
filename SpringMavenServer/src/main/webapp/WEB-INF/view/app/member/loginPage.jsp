<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<style>body{padding-top: 60px;}</style>
	
    <link href="resources/css/bootstrap.css" rel="stylesheet" />
 
	<link href="resources/css/login-register.css" rel="stylesheet" />
	<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
	
	<script src="resources/js/jquery-1.10.2.js" type="text/javascript"></script>
	<script src="resources/js/bootstrap.js" type="text/javascript"></script>
	<script src="resources/js/login-register.js" type="text/javascript"></script>
	
<title>로그인</title>
</head>
<body>
	<body>
    <div class="container">
        <div class="row">
            <div class="col-sm-4"></div>
            <div class="col-sm-4">
                 <a class="btn big-login" data-toggle="modal" href="javascript:void(0)" onclick="openLoginModal();">로그인</a>
                 <a class="btn big-register" data-toggle="modal" href="javascript:void(0)" onclick="openRegisterModal();">회원가입</a></div>
            <div class="col-sm-4"></div>
        </div>
       
         
		 <div class="modal fade login" id="loginModal">
		      <div class="modal-dialog login animated">
    		      <div class="modal-content">
    		         <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">로그인</h4>
                    </div>
                    <div class="modal-body">  
                        <div class="box">
                             <div class="content">
                                <div class="social">
                                    <a class="circle github" href="/auth/github">
                                        <i class="fa fa-github fa-fw"></i>
                                    </a>
                                    <a id="google_login" class="circle google" href="/auth/google_oauth2">
                                        <i class="fa fa-google-plus fa-fw"></i>
                                    </a>
                                    <a id="facebook_login" class="circle facebook" href="/auth/facebook">
                                        <i class="fa fa-facebook fa-fw"></i>
                                    </a>
                                </div>
                                <div class="division">
                                    <div class="line l"></div>
                                      <span>or</span>
                                    <div class="line r"></div>
                                </div>
                                <div class="error"></div>
                                <div class="form loginBox">
                                    <form method="post" action="/login" accept-charset="UTF-8">
                                    <input id="email" class="form-control" type="text" placeholder="이메일" name="email">
                                    <input id="password" class="form-control" type="password" placeholder="비밀번호" name="password">
                                    <input class="btn btn-default btn-login" type="button" value="로그인" onclick="loginAjax()">
                                    </form>
                                </div>
                             </div>
                        </div>
                        <div class="box">
                            <div class="content registerBox" style="display:none;">
                             <div class="form">
                                <form method="post" html="{:multipart=>true}" data-remote="true" action="/register" accept-charset="UTF-8">
                                <input id="email" class="form-control" type="text" placeholder="이메일" name="email">
                                <input id="password" class="form-control" type="password" placeholder="비밀번호" name="password">
                                <input id="password_confirmation" class="form-control" type="password" placeholder="비밀번호 확인" name="password_confirmation">
                                <input class="btn btn-default btn-register" type="submit" value="확인" name="commit">
                                </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <div class="forgot login-footer">
                            <span>회원이 아니신가요? 
                                 <a href="javascript: showRegisterForm();">회원가입 하기</a>
                            </span>
                        </div>
                        <div class="forgot register-footer" style="display:none">
                             <span>이미 회원이신가요?</span>
                             <a href="javascript: showLoginForm();">로그인</a>
                        </div>
                    </div>        
    		      </div>
		      </div>
		  </div>
    </div>
</body>
</body>
</html>