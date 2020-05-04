<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<html>
<head>
<title>Capstone</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>


<link rel="shortcut icon"
	href="<c:url value="/resources/favicon.ico" />">
<link rel="stylesheet" href="<c:url value="/resources/style.css" />">
<script src="<c:url value="/resources/UnityLoader.js" />"></script>
<script src="https://kit.fontawesome.com/c176709a0d.js"
	crossorigin="anonymous"></script>
<script>
	var unityInstance = UnityLoader.instantiate("unityContainer",
			"/resources/webGL0429.json");
</script>
<script type="javascript">
      function clicked(){
         unityInstance.SendMessage("UIEvent",'CreateButtonClick');
      }
</script>
</head>
<body>
	<div id="wrap">
		<div id="header">
			<div id="logo">
				<img src="<c:url value="/resources/caplogo.jpg"/>" width="20%"
					height="100%">
			</div>
			<c:choose>
				<c:when test="${empty sessionScope.loginUser }">
					<div id="signin">
						<button type="button" class="fas fa-user-circle" id="signInButton"
							onclick="location.href='/user/login'"
							style="margin-left: 50px; font-size: 30px">
							<span aria-hidden=true></span>
						</button>
					</div>
				</c:when>
				<c:otherwise>
					<div id="signout">
						<div id="nickname">
							<p>${sessionScope.loginUser.nickname }</p>
						</div>
						<div id="logout">
							<button type="button" class="far fa-user-circle"
								id="signOutButton" onclick="logoutCall()"
								style="margin-left: 30px; font-size: 30px">
								<span aria-hidden=true></span>
							</button>
						</div>
					</div>
				</c:otherwise>
			</c:choose>
		</div>

		<div id=content>
			<div id="left">
				<i class="fas fa-couch" aria-hidden="true" style="margin-left: 6px; margin-right: 10px; margin-top: 270px; font-size: 3em; color: #482b19; width: 10%; float: left"></i>
				<div id="list">
					<div id="kategorie">
						<ul class = "Menu">
							<li class = "menu">
								Menu
								<ul class = "subMenu">
								<li>책상</li>
								<li>의자</li>
								<li>쇼파</li>
								<li>침대</li>
								<li>옷장</li>
								<li>화장대</li>
								<li>선반</li>
								<li>기타</li>
								</ul>
							</li>
						</ul>
					</div>
				
					<div id="search">
							<input name="keyword" type = "text" onFocus="this.value= '';return true;">
						 	<button type="submit" onclick="reload()">search</button>
					</div>
					<div id="listview">
					</div>
				</div>
			</div>

			<div id="unityContainer"
				style="width: 91%; height: 100%; position: absolute; transform: translate(5%, 0); z-index: 1;"></div>

			<div id="right">
				<i class="fas fa-cart-arrow-down" aria-hidden="true"
					style="text-align: right; width: 100%; margin-top: 270px; font-size: 3em; color: #482b19;">
				</i>
			</div>
		</div>

		<div id="footer">
			<div id="footer_inner" class="clfix">
				<div class="foot_info">
					E-MAIL. Decrescendo@naver.com<br /> Copyright team Crescendo. all
					right reserved.
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
		function reload() {
			$("#left #list #listview").load("/user/home #left #list #listview ")
		}
		
		function (){
			
		}
		
		
		function logoutCall() {
			$.ajax({
				url : "/jquery/logout.do",
				type : 'POST',
				success : function(data) {
					if (data == 1) {
						location.href = "/user/home";
					} else {
						return false;
					}
				}
			})
		}
	</script>
	
</body>
</html>
