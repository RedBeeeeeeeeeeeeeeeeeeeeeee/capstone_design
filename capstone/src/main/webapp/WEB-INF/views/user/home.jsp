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
			"/resources/Downloads.json");
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
                             <p> ${sessionScope.loginUser.id } </p> 
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
					style="margin-left: 6px; margin-right: 10px; margin-top: 270px; font-size: 3em; color: #482b19; width: 10%; float: left">
				</i>
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
								style="font-size: 20px;">
							</button>
						</div>

					</div>

					<div id="listview">
					</div>

				</div>
			</div>

			<div id="unityContainer"
				style="width: 91%; height: 100%; position: absolute; transform: translate(5%, 0); z-index: 1;">
			</div>

			<div id="right">
				<i class="fas fa-cart-arrow-down" aria-hidden="true"
					style="margin-right : 6px; margin-left: 6px; margin-top: 270px; font-size: 3em; color: #482b19; width: 10%; float: right">
				</i>
				<div id = "basket">
					<div id = "totalprice">
						<button id = "total">total</button>
					</div>
					<div id = "basketview">
						
					</div>
				
				
				
				</div>
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
    	function clicked(){
        	unityInstance.SendMessage("UIEvent",'CreateButtonClick');
     	}
		
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
		
		function listContainerCreate(list){
			var tc = new Array();
			var html = '';
			for(var i = 0 in list){   
				tc.push({num : list[i].num, name : list[i].name, brand : list[i].brand, type : list[i].type, price : list[i].price, img : list[i].image, link : list[i].detail, modeling : list[i].modeling }); 
			}
			if(tc.length == 0){
				$("#listview").empty();
			}else{
				for(key in tc){
					html += '<table border = "1" width="100%">';
				    html += '<tr>';
				    html += '<td rowspan="4" width="20%"><img src="' + tc[key].image + '" height="100"/></td>';
				    html += '<td colspan="3">' + tc[key].brand + '</td>';
				    html += '</tr>';
				    html += '<tr>';
				    html += '<td colspan="3">' + tc[key].name + '</td>';
				    html += '</tr>';
				    html += '<tr>';
				    html += '<td colspan = "3">' + tc[key].price + '</td>';
				    html += '</tr>';
				    html += '<tr>';
				    html += "<td width='20%'><button onclick ='insertbasket("+tc[key].num+")' style=' width:100%; align:center'>장바구니</button></td>";
					html += "<td width='20%''><button style=' width:100%; align:center'>가구 추가</button></td>"
				    html += '<td width="20%"><button type="button" onclick="window.open(\'' + tc[key].link + '\')" target="_blank" style=" width:100%; align:center">구매 링크</button></td>';
					html += '</tr>';
					html += '</table>';	
				}
				$("#listview").empty()
				$("#listview").append(html);	
			
			}
		}
		function basketContainerCreate(list){
			var tc = new Array();
			var html = '';
			for(var i = 0 in list){   
				tc.push({num : list[i].num, name : list[i].name, brand : list[i].brand, price : list[i].price, img : list[i].image, link : list[i].detail, count : list[i].count}); 
			}
			if(tc.length == 0){
				$("#basketview").empty();
			}else{
				for(key in tc){
					html += '<table border = "1" width="100%">';
				    html += '<tr>';
				    html += '<td rowspan="4" width="20%"><img src="' + tc[key].image + '" height="100"/></td>';
				    html += '<td colspan="3">' + tc[key].brand + '</td>';
				    html += '</tr>';
				    html += '<tr>';
				    html += '<td colspan="3">' + tc[key].name + '</td>';
				    html += '</tr>';
				    html += '<tr>';
				    html += '<td colspan = "3">' + tc[key].price + '</td>';
				    html += '</tr>';
				    html += '<tr>';
				    html += "<td width='20%'><button onclick = 'minus()' style = 'float:left;'>-</button><label style>"+tc[key].count+"</label><button onclick = 'plus()' style = 'float:right;'>+</button></td>";
				    html += "<td width='20%''><button onclick = 'deletebasket("+tc[key].num+")' style=' width:100%; align:center'>장바구니 삭제</button></td>"
				    html += '<td width="20%"><button type="button" onclick="window.open(\'' + tc[key].link + '\')" target="_blank" style=" width:100%; align:center">구매 링크</button></td>';	
					html += '</tr>';
					html += '</table>';
				}
				$("#basketview").empty()
				$("#basketview").append(html);
			}		
		}
			 

		
		// 검색 조건에 맞는 가구 보여주기
		 function showList(){
			$.ajax({
				url : "/jquery/furnlist.do",
				type : 'POST',
				data : {type : type.innerText, brand : brand.innerText, color : color.innerText, price : price.innerText},
				success : function(check){
					listContainerCreate(check);
				}
			})
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
		
		//unity의 방 정보 저장
		function test(arg){
			var save = "${sessionScope.loginUser.id}";
			if(save != ""){
				$.ajax({
		    		url : "/jquery/save.do",
		    		type : 'POST',
		    		data : {ID : save, route : arg},
		    		success : function(check){
		    			if(check == 1) {
	    					alert("저장 완료");
	 		   			}else{
	    					alert("저장 실패")
	    				}	
		    		}
				})
			}else{
				alert("로그인해라");
			}
		}
		
		// 가구 저장
    	function clicked(){
        	unityInstance.SendMessage("UIEvent",'CreateButtonClick');// 파라메터 무엇???
     	}
		
		
		// 유니티에다가 방 정보 load
		function load(){
			var load = "${sessionScope.loginUser.id}";
			if(load != ""){
				$.ajax({
					url : "/jquery/load.do",
					type : 'POST',
					data : {ID : load},
					success : function(check){
						alert(check);
					}
				})
			}else{
				alert("로그인해라");
			}
		}
		
		//로그인하고 돌아왔을 때 업데이트를 위함
		window.onload = reloadbasket();
		window.onload = showList();
		
		// 장바구니 리로드 메소드
		function reloadbasket(){
			var reloadbasket = "${sessionScope.loginUser.id}";
			if(reloadbasket != ""){
				$.ajax({
					url : "/jquery/basket.do",
					type : 'POST',
					data : {reloadID : reloadbasket},
					success : function(check){
						basketContainerCreate(check);
					}
				})
			}else{
			}
		}
		
		// 장바구니 추가
		function insertbasket(furnNum){
			var insertbasket = "${sessionScope.loginUser.id}";
			if(insertbasket != ""){
				$.ajax({
					url : "/jquery/insert.do",
					type : 'POST',
					data : {insertID : insertbasket, insertFurn : furnNum},
					success : function(check){
						if(check == 0) alert("이미 추가되어 있는 가구");
						else {
							alert("장바구니 담기")
							reloadbasket();
						}
					}
				})
			}else{
			}
		}
		
		// 장바구니 삭제
		function deletebasket(furnNum){
			var deletebasket = "${sessionScope.loginUser.id}";
			if( deletebasket != ""){
				$.ajax({
					url : "/jquery/delete.do",
					type : 'POST',
					data : {deleteID : deletebasket, deleteFurn : furnNum},
					success : function(check){
						if(check == 1) {
							alert("장바구니 삭제")
							reloadbasket();
						}
					}
				})
			}else{
			}
		}		
		
		function minus(){
				
		}
		
		function plus(){
			
		}
		
	</script>

</body>
</html>
