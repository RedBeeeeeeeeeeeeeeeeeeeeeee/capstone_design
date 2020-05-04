<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>Capstone</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<style>
body {
   font: 13px/20px 'Helvetica Neue', Helvetica, Arial, sans-serif;
   color: #333333;
   background: #ededed;
}

.signUp {
   position: relative;
   margin: 50px auto;
   width: 280px;
   padding: 33px 25px 29px;
   background: #FFFFFF;
   border-bottom: 1px solid #C4C4C4;
   border-radius: 5px;
   -webkit-box-shadow: 0 1px 5px rgba(0, 0, 0, 0.25);
   box-shadow: 0 1px 5px rgba(0, 0, 0, 0.25);
}

.signUp:before,
.signUp:after {
   content: '';
   position: absolute;
   bottom: 1px;
   left: 0;
   right: 0;
   height: 10px;
   background: inherit;
   border-bottom: 1px solid #D2D2D2;
   border-radius: 4px;
}

.signUp:after {
   bottom: 3px;
   border-color: #DCDCDC;
}

.signUpTitle {
   margin: -25px -25px 25px;
   padding: 15px 25px;
   line-height: 35px;
   font-size: 26px;
   font-weight: 300;
   color: #777;
   text-align: center;
   text-shadow: 0 1px rgba(255, 255, 255, 0.75);
   background: #F7F7F7;
}

.signUpTitle:before {
   content: '';
   position: absolute;
   top: 0;
   left: 0;
   right: 0;
   height: 8px;
   background: #C4E17F;
   border-radius: 5px 5px 0 0;
   background-image: -webkit-linear-gradient(left, #C4E17F, #C4E17F 12.5%, #F7FDCA 12.5%, #F7FDCA 25%, #FECF71 25%, #FECF71 37.5%, #F0776C 37.5%, #F0776C 50%, #DB9DBE 50%, #db9CBE 62.5%, #C49CDE 62.5%, #C49CDE 75%, #669AE1 75%, #669AE1 87.5%, #62C2E4 87.5%, #62C2E4);
   background-image: -moz-linear-gradient(left, #c4e17f, #C4E17F 12.5%, #F7FDCA 12.5%, #F7FDCA 25%, #FECF71 25%, #FECF71 37.5%, #F0776C 37.5%, #F0776C 50%, #DB9DBE 50%, #DB9CBE 62.5%, #C49CDE 62.5%, #C49CDE 75%, #669AE1 75%, #669AE1 87.5%, #62C2E4 87.5%, #62C2E4);
   background-image: -o-linear-gradient(left, #C4E17F, #C4E17F 12.5%, #F7FDCC 12.5%, #F7FDCA 25%, #FECF71 25%, #FECF71 37.5%, #F0776C 37.5%, #F0776C 50%, #DB9DBE 50%, #DB9DBE 62.5%, #C49CDE 62.5%, #C49CDE 75%, #669AE1 75%, #669AE1 87.5%, #62C2E4 87.5%, #62C2E4);
   background-image: linear-gradient(to right, #C4E17F, #C4E17F 12.5%, #F7FDCA 12.5%, #F7FDCA 25%, #FECF71 25%, #FECF71 37.5%, #F0776C 37.5%, #F0776C 50%, #DB9DBE 50%, #DB9CBE 62.5%, #c49cde 62.5%, #C49CDE 75%, #669AE1 75%, #669AE1 87.5%, #62c2e4 87.5%, #62C2E4);
}

input {
   font-family: inherit;
   color: inherit;
   -webkit-box-sizing: border-box;
   -moz-box-sizing: border-box;
   box-sizing: border-box;
}

.loginInput {
   width: 100%;
   height: 50px;
   margin-bottom: 25px;
   padding: 0 15px 2px;
   font-size: 17px;
   background: white;
   border: 2px solid #EBEBEB;
   border-radius: 4px;
   -webkit-box-shadow: inset 0 -2px #EBEBEB;
   box-shadow: inset 0 -2px #EBEBEB;
}

.signUpInput {
   width: 100%;
   height: 30px;
   margin-bottom: 25px;
   padding: 0 15px 2px;
   font-size: 17px;
   background: white;
   border: 2px solid #EBEBEB;
   border-radius: 4px;
   -webkit-box-shadow: inset 0 -2px #EBEBEB;
   box-shadow: inset 0 -2px #EBEBEB;
}

.emailInput {
   width: 45%;
   height: 30px;
   margin-bottom: 25px;
   padding: 0 15px 2px;
   font-size: 17px;
   background: white;
   border: 2px solid #EBEBEB;
   border-radius: 4px;
   -webkit-box-shadow: inset 0 -2px #EBEBEB;
   box-shadow: inset 0 -2px #EBEBEB;
}

.signUpInput:focus {
   border-color: #62C2E4;
   outline: none;
   -webkit-box-shadow: inset 0 -2px #62C2E4;
   box-shadow: inset 0 -2px #62C2E4;
}

.lt-ie9 .signUpInput {
   line-height: 48px;
}

.loginButton {
   position: relative;
   vertical-align: top;
   width: 100%;
   height: 54px;
   padding: 0;
   font-size: 22px;
   color: white;
   text-align: center;
   text-shadow: 0 1px 2px rgba(0, 0, 0, 0.25);
   background: #CCCCFF;
   border: 0;
   border-bottom: 2px solid #D76B60;
   border-radius: 5px;
   cursor: pointer;
   -webkit-box-shadow: inset 0 -2px #D76B60;
   box-shadow: inset 0 -2px #D76B60;
}

.loginButton:active {
   top: 1px;
   outline: none;
   -webkit-box-shadow: none;
   box-shadow: none;
}

.signUpButton {
   position: relative;
   vertical-align: top;
   width: 100%;
   height: 54px;
   padding: 0;
   font-size: 18px;
   color: white;
   text-align: center;
   text-shadow: 0 1px 2px rgba(0, 0, 0, 0.25);
   background: #F0776C;
   border: 0;
   border-bottom: 2px solid #D76B60;
   border-radius: 5px;
   cursor: pointer;
   -webkit-box-shadow: inset 0 -2px #D76B60;
   box-shadow: inset 0 -2px #D76B60;
}

.signUpButton:active {
   top: 1px;
   outline: none;
   -webkit-box-shadow: none;
   box-shadow: none;
}

:-moz-placeholder {
   color: #AAAAAA;
   font-weight: 300;
}

::-moz-placeholder {
   color: #AAAAAA;
   opacity: 1;
   font-weight: 300;
}

::-webkit-input-placeholder {
   color: #AAAAAA;
   font-weight: 300;
}

:-ms-input-placeholder {
   color: #AAAAAA;
   font-weight: 300;
}

::-moz-focus-inner {
   border: 0;
   padding: 0;
}
</style>
</head>
<body>

<form class="signUp" id="signupForm">
   <h1 class="signUpTitle">�α���</h1>
   <input type="text" id="userId" class="signUpInput" placeholder="ID" autofocus onkeyup="enterKeyCheck()">
   <input type="password" id="password" class="signUpInput" placeholder="Password" onkeyup="enterKeyCheck()">
   <input type="button" value="�α���" onclick="loginValidation()" class="loginButton">
   <input type="button" value="ȸ������" onclick="signUpModalPop()" class="signUpButton">
</form>

<div class="modal fade" id="signUpModal" role="dialog"  tabindex="-1" aria-labelledby="modal-login-label" aria-hidden="true">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<form class="form-horizontal" method="POST" id="Frm" name="Frm">
					<div class="modal-body" style="padding: 40px 50px; height: 480px;">
						<form class="signUp" id="signupForm">
						   <h1 class="signUpTitle">ȸ������</h1>
						   	
						   <div class="fieldlabel"><label for="userId">*���̵�</label></div>
					        <div class="formfield"><input type="text" id="signup_userId" class="signUpInput" name="userId" maxlength="20" value=""></div>
					        
					        <div class="fieldlabel"><label for="password">*�н�����</label></div>
					        <div class="formfield">
								<input type="password" id="signup_password" class="signUpInput" name="password" maxlength="20" autocomplete="off">
							</div>
					
					        <div class="fieldlabel"><label for="passwordCheck">�н�����Ȯ��</label></div>
					        <div class="formfield">
								<input type="password" id="signup_passwordCheck" class="signUpInput" name="passwordCheck" maxlength="20" autocomplete="off">
							</div>
					       
					        <div class="fieldlabel"><label for="username">*�г���</label></div>
					        <div class="formfield"><input type="text" id="signup_username" class="signUpInput" name="username" maxlength="20" value=""></div>
					
					        <div class="fieldlabel"><label for="email">*�̸���</label></div>
					        <div class="formfield"><input type="text" id="signup_email" class="emailInput" name="email" size="20" maxlength="20" 
					             value="" autocomplete="off"><span>@</span>
					            <input id="domain" list="domains" name="domain" placeholder="�������Է�/����">
					            <datalist id="domains">
					                <option value="naver.com">
					                <option value="daum.net">
					                <option value="gmail.com">
					                <option value="yahoo.co.kr">
					            </datalist>
					        </div>
						   <input type="button" value="����" onclick="signUpValidation()" class="signUpButton">
						</form>
					</div>
				<div class="modal-footer">
				</div>
				</form>
			</div>
		</div>
</div>
<script type="text/javascript">

function loginValidation(){
	
	var vuserId = $("#userId").val();
	var vpassword = $("#password").val();
	
	if(!vuserId){
		$("#userId").focus();
		return false;
	}else if(!vpassword){
		$("#password").focus();
		return false;
	}else {
		login(vuserId,vpassword);
	}
	
}

function login(userid,userpw){
	$.ajax({
		url : "/user/jquery/login.do",
		type : 'POST',
		data : { userId : userid, 
				password : userpw	
		},
		success:function(data){
			if(data == 2){
				alert("���̵� Ȥ�� ��й�ȣ�� ���� �ʽ��ϴ�.");
				return false;
			}else if(data == 3){
				location.href="/user/home";
			}
		}		
	})
	
}

function signUpValidation(){
	
	var userId = $("#signup_userId").val();
	var userPw = $("#signup_password").val();
	var userPwCheck = $("#signup_passwordCheck").val();
	var userName = $("#signup_username").val();
	var email = $("#signup_email").val();
	
	if(!userId){
		alert("���̵� �Է��� �ʼ��Դϴ�.");
		$("#signup_userId").focus();
	}else if(!userPw){
		alert("��й�ȣ �Է��� �ʼ��Դϴ�.");
		$("#signup_password").focus();
	}else if(!userPwCheck){
		alert("��й�ȣ Ȯ�� �Է��� �ʼ��Դϴ�.");
		$("#signup_passwordCheck").focus();
	}else if(userPw != userPwCheck){
		alert("��й�ȣ�� ���� �ʽ��ϴ�.");
		$("#signup_userPwCheck").focus();		
	}else if(!userName){
		alert("�̸� �Է��� �ʼ��Դϴ�.");
		$("#signup_username").focus();
	}else {
		signUp(userId, userPw, userName);
	}
	
}


function signUp(id, pw, name){
	$.ajax({
		url : "/user/jquery/signUp.do",
		type:'POST',
		data :  { userId : id,
			userPw : pw,
			userName : name
		},
		success:function(data){
			if(data==1){
				alert("ȸ�������� �Ϸ�ƽ��ϴ�.");
				$('#signUpModal').modal("hide");
			}else if(data==2){
				alert("�̹� �����ϴ� ���̵��Դϴ�.");
				return false;
			}else if(data==3){
				alert("�̹� �����ϴ� �̸��Դϴ�.");
				return false;
			} else {
			}
		}
	})
}

function enterKeyCheck(){
	
 if(event.keyCode == 13)
	  {
	 loginValidation();
	  }
	
	
}

function signUpModalPop(){
	
	$('#signUpModal').modal('show');
	/*
	$('#signUpModal').on('show.bs.modal', function (e) {
		console.log("show.bs.modal");
	});
	$('#signUpModal').on('shown.bs.modal', function (e) {
		console.log("shown.bs.modal");
	});
	$('#signUpModal').on('hide.bs.modal', function (e) {
		console.log("hide.bs.modal");
	});
	$('#signUpModal').on('hidden.bs.modal', function (e) {
		console.log("hidden.bs.modal");
	});
	*/
}

function signUpModalPopOff(){
	alert("signUpModalPopOff");
	$('#signUpModal').modal('hide');	
}

</script>
</body>
</html>