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
				<i class="fas fa-couch" aria-hidden="true"
					style="margin-left: 6px; margin-right: 10px; margin-top: 270px; font-size: 3em; color: #482b19; width: 10%; float: left"></i>
				<div id="list">

					<div id="kategorie">

						<div id="find">
							<ul class="Menu">
								<li id="type">Type
									<ul class="subMenu">
										<li id="Type" onclick="findType(this)">Type</li>
										<li id="책상" onclick="findType(this)">책상</li>
										<li id="의자" onclick="findType(this)">의자</li>
										<li id="쇼파" onclick="findType(this)">쇼파</li>
										<li id="침대" onclick="findType(this)">침대</li>
										<li id="옷장" onclick="findType(this)">옷장</li>
										<li id="화장대" onclick="findType(this)">화장대</li>
										<li id="선반" onclick="findType(this)">선반</li>
										<li id="기타" onclick="findType(this)">기타</li>
									</ul>
								</li>

								<li id="brand">Brand
									<ul class="subMenu">
										<li id="Brand" onclick="findBrand(this)">Brand</li>
										<li id="브랜드1" onclick="findBrand(this)">브랜드1</li>
										<li id="브랜드2" onclick="findBrand(this)">브랜드2</li>
										<li id="브랜드3" onclick="findBrand(this)">브랜드3</li>
										<li id="브랜드4" onclick="findBrand(this)">브랜드4</li>
										<li id="브랜드5" onclick="findBrand(this)">브랜드5</li>
									</ul>
								</li>

								<li id="color">Color
									<ul class="subMenu">
										<li id="Color" onclick="findColor(this)">Color</li>
										<li id="색깔1" onclick="findColor(this)">색깔1</li>
										<li id="색깔2" onclick="findColor(this)">색깔2</li>
										<li id="색깔3" onclick="findColor(this)">색깔3</li>
										<li id="색깔4" onclick="findColor(this)">색깔4</li>
										<li id="색깔5" onclick="findColor(this)">색깔5</li>
									</ul>
								</li>


								<li id="price">Price
									<ul class="subMenu">
										<li id="Price" onclick="findPrice(this)">Price</li>
										<li id="가격1" onclick="findPrice(this)">가격1</li>
										<li id="가격2" onclick="findPrice(this)">가격2</li>
										<li id="가격3" onclick="findPrice(this)">가격3</li>
										<li id="가격4" onclick="findPrice(this)">가격4</li>
										<li id="가격5" onclick="findPrice(this)">가격5</li>
									</ul>
								</li>
							</ul>
						</div>

						<div id="search">
							<button type="button" class="fas fa-search" onclick = "showList()"
								style="font-size: 20px;"></button>
						</div>

					</div>

					<div id="listview"></div>

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

		
		function findType(e) {
			type = document.getElementById('type');
			type.innerHTML = "<li id = 'type' style = 'list-style:none'>"
					+ e.innerText
					+ "<ul class = 'subMenu'><li id = 'Type' onclick = 'findType(this)'>Type</li><li id = '책상' onclick = 'findType(this)'>책상</li><li id = '의자' onclick = 'findType(this)'>의자</li><li id = '쇼파' onclick = 'findType(this)'>쇼파</li><li id = '침대' onclick = 'findType(this)'>침대</li><li id = '옷장' onclick = 'findType(this)'>옷장</li><li id = '화장대' onclick = 'findType(this)'>화장대</li><li id = '선반' onclick = 'findType(this)'>선반</li><li id = '기타' onclick = 'findType(this)'>기타</li></ul></li>";
		}
		
		function findBrand(e){
			brand = document.getElementById('brand');
			brand.innerHTML = "<li id = 'brand' style = 'list-style:none'>"
					+ e.innerText
					+"<ul class='subMenu'><li id='Brand' onclick='findBrand(this)'>Brand</li>	<li id='브랜드1' onclick='findBrand(this)'>브랜드1</li>	<li id='브랜드2' onclick='findBrand(this)'>브랜드2</li>	<li id='브랜드3' onclick='findBrand(this)'>브랜드3</li>	<li id='브랜드4' onclick='findBrand(this)'>브랜드4</li>	<li id='브랜드5' onclick='findBrand(this)'>브랜드5</li>	</ul></li>"
		}
		
		function findColor(e){
			color = document.getElementById('color');
			color.innerHTML = "<li id = 'color' style = 'list-style:none'>"
					+ e.innerText
					+ "<ul class='subMenu'><li id='Color' onclick='findColor(this)'>Color</li><li id='색깔1' onclick='findColor(this)'>색깔1</li><li id='색깔2' onclick='findColor(this)'>색깔2</li>	<li id='색깔3' onclick='findColor(this)'>색깔3</li>	<li id='색깔4' onclick='findColor(this)'>색깔4</li>	<li id='색깔5' onclick='findColor(this)'>색깔5</li>	</ul></li>"
		}
		
		function findPrice(e){
			price = document.getElementById('price');
			price.innerHTML = "<li id = 'price' style = 'list-style:none'>"
					+ e.innerText
					+ "<ul class='subMenu'>	<li id='Price' onclick='findPrice(this)'>Price</li><li id='가격1' onclick='findPrice(this)'>가격1</li>	<li id='가격2' onclick='findPrice(this)'>가격2</li>	<li id='가격3' onclick='findPrice(this)'>가격3</li>	<li id='가격4' onclick='findPrice(this)'>가격4</li>	<li id='가격5' onclick='findPrice(this)'>가격5</li>	</ul></li>"
		}
		
		function showList(){
			var values =[];
			alert(type.innerText+" "+brand.innerText+" "+color.innerText+" "+price.innerText);
			$.ajax({
				url : "/jquery/list.do",
				type : 'POST',
				data : {type : type.innerText, brand : brand.innerText, color : color.innerText, price : price.innerText},
				success : function(check){
					for(var i = 0 in check){
						alert(check[i].num+" "+check[i].furnName+" "+check[i].type+" "+check[i].brand+" "+check[i].price+" "+check[i].imgLink+" "+check[i].detailLink);
					}
				}
			})
			$("#left #list #listview").load("/user/home #left #list #listview");
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
