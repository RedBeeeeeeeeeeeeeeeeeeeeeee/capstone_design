<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>Capstone</title>
<style type="text/css">
#content {
	float: left;
	width: 90%;
	height: 85%;
}
</style>
<link rel="shortcut icon"
	href="<c:url value="/resources/favicon.ico" />">
<link rel="stylesheet" href="<c:url value="/resources/style.css" />">
<script src="<c:url value="/resources/UnityProgress.js" />"></script>
<script src="<c:url value="/resources/UnityLoader.js" />"></script>
<script src="https://kit.fontawesome.com/c176709a0d.js"
	crossorigin="anonymous"></script>
<script>
	var unityInstance = UnityLoader.instantiate("unityContainer",
			"/resources/webb.json", {
				onProgress : UnityProgress
			}
	);
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
			<div id="signin">
				<a target="_blank" style="margin-left:50px;">
					<button type="button" class="btn btn-primary btn-lg" id="signBtn"
						onclick="Button()">
						<i class="fas fa-house-user" aria-hidden="true" style="text-align:right; font-size:2em;"></i>
					</button>
				</a>
			</div>
 		<div id="signup">
				<a target="_blank" style="margin-left: 30px;"> <i
					class="fas fa-user-plus" aria-hidden="true"
					style="text-align: right; font-size: 2em;"></i>
				</a>
			</div>
		</div>
	
		<div id=content>
			<div id="left">
				<i class="fas fa-couch" aria-hidden="true"
					style="margin-left: 6px; margin-top: 270px; font-size: 3em; color: #482b19; width: 10%; float: left">
				</i>

				<div id="kategorie">
					<ul style="margin-top: 60px;">
						<li><p>책상</p></li>
						<li><p>의자</p></li>
						<li><p>쇼파</p></li>
						<li><p>침대</p></li>
						<li><p>옷장</p></li>
						<li><p>화장대</p></li>
						<li><p>선반</p></li>
						<li><p>기타</p></li>
					</ul>
				</div>

				<div id="list">
					<div id="search">
						<form>
							<input name="keyword"> <input type="submit" value="조회">
						</form>
					</div>
					<div id="listview">
						<table border="2">

						</table>
					</div>
				</div>
			</div>

			<div id="unityContainer"
				style="width: 91%; height: 100%; position: absolute; transform: translate(5%, 0); z-index: 1;"></div>

			<div id="right">
				<i class="fas fa-cart-arrow-down" aria-hidden="true"
					style="text-align: right; width: 100%; margin-top: 270px; font-size: 3em; color: #c8c8c8;">
				</i>
			</div>
		</div>

		<div id="footer">
			<div id="footer_inner" class="clfix">
				<div class="foot_info">
					TEL. <font style="color: #075ba4;">010-5035-2500 </font><br />
					E-MAIL. rudejr34591@naver.com<br /> Copyright team Crescendo. all
					right reserved.
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function Button() {
			location.href = "/user/login"
		}
	</script>
</body>
</html>