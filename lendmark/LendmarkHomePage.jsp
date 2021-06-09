<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href='https://fonts.googleapis.com/css?family=Architects Daughter' rel='stylesheet'>
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
<jsp:include page="./inc/boardHead.jsp" />
<head>
<meta charset="UTF-8">
<title>Lendmark Homepage</title>
<style>
	body{
		font-family:'Architects Daughter';
	}
	.category-Session{
		position: relative;
	}
	.category-firstLine{
		margin-left : 300px;
		padding : 0px;
		border : 0px;
		font : inherit;
		vertical-align : baseline;
		
	}
	.category-secondLine{
		margin : 0px;
		padding : 0px;
		border : 0px;
		font : inherit;
		vertical-align : baseline;
		
	}
	.category-Each-space{
		width : 98px;
		margin-right : 22px;
		margin-bottom : 22px;
		display :inline-block;
		flex-wrap : wrap;
		align-items: center;
		
	}
	.category-LinkBox{
		
		border-radius : 50px;
		border : 1px solid rgb(238,238,238);
		background : rgb(255,255,255);
		display : block;
	}
	.inner-category-icon{
		padding: 20px;
		position : relative;
		width: 100%;
		display : block;
		align-content: center;
	}
	.category-title{
		margin-left : 20px;
		padding : 5px 5px;
		font-size: 12px;
		color: gray;
		text-align: center;
	}
	.product-Session{
		position: relative;
		overflow: hidden;
	}
	.product-Session-font{
		margin : 0px;
		padding : 0px;
		border : 0px;
		font : inherit;
		vertical-align : baseline;
	}
	.product-Session-box{
		display : flex;
		flex-wrap : wrap;
	}
	.product-Each-space{
		width : 196px;
		margin-right : 11px;
		margin-bottom : 11px;
	}
	.product-LinkBox{
		border : 1px solid rgb(238,238,238);
		background : rgb(255,255,255);
		display : block;
	}
	.inner-imgBox{
		position : relative;
		width: 100%;
		height : 194px;
		display : block;
	}
	.inner-text-Session{
		padding : 15px 10px;
		height : 80px;
	}
	.title-box{
		position : relative;
		font-size: 14px;
		padding-bottom: 20px;
		text-overflow : ellipsis;
		white-space : nowrap;
		overflow: hidden;
	}
	.price-Session{
		display: flex;
		justify-content: space-between;
		align-items: center;
		height: 20px;
	}
	.price{
		font-size: 16px;
		font-weight: 600;
		text-overflow: ellipsis;
		white-space: nowrap;
		overflow: hidden;
		
	}
	.post-time{
		font-size: 12px
		color : rgb(136,136,136);
	}
</style>
</head>
<body>
<div class="container">
	<jsp:include page="./inc/boardTop.jsp" />
	<div class="row">		
		<div class="col-12">
			<div style="height: 100px; line-height: 100px; margin:10px 0; text-align: center; 
				color:#ffffff; background-color:rgb(133, 133, 133); border-radius:10px; font-size: 1.5em;">
				<a href="advertising.do?"><img src="../images/홈페이지상단광고배너.jpg" alt="" style="width : 500px; height:95px; margin-top:2px;"/></a>
			</div>
			</div>  
		</div>
		<div class="col-12 pt-3">
		<div style="display:flex; justify-content: center;">
			<h3 style="color: orange; font-weight: bold; font-family:'Architects Daughter'; ">Category</h3>
		</div>
			
			<div class ="category-Session">
				<div class="category-firstLine">
					<div class="category-Each-space">
						<a class="category-Linkbox" href="list.do?category=fassion">
							<span class ="inner-category-icon">
								<i class='fas fa-tshirt' style='font-size:36px; color : gray;'></i>
							</span>
							<span class="category-title">
								패션
							</span>
						</a>
					</div>
					
					<div class="category-Each-space">
						<a class="category-Linkbox" href="list.do?category=sports">
							<span class ="inner-category-icon">
								<i class='fas fa-bicycle' style='font-size:36px; color : gray; '></i>
							</span>
							<span class="category-title">
								스포츠
							</span>
						</a>
					</div>
					<div class="category-Each-space">
						<a class="category-Linkbox" href="list.do?category=electronics">
							<span class ="inner-category-icon">
								<i class="fa fa-mobile-phone" style="font-size:36px;color:gray; margin-left : 15px;"></i>
							</span>
							<span class="category-title">
								전자제품
							</span>
						</a>
					</div>
						<div class="category-Each-space">
						<a class="category-Linkbox" href="list.do?category=furniture">
							<span class ="inner-category-icon">
								<i class='fas fa-chair' style='font-size:36px; color:gray; margin-left : 12px;'></i>
							</span>
							<span class="category-title" style="margin-left : 30px;">
								가구
							</span>
						</a>
						</div>		
				</div>
				<div class="category-secondLine">
				
				</div>
			</div>
			<div class ="product-Session">
				<div class="product-Session-font">
					<div class="product-Session-box">
					<c:forEach items="" varStatus="">
						<div class="product-Each-space">
							<a class="product-LinkBox" href="View.do?idx=?" >
								<span class="inner-imgBox">
									<img src="" alt="" style="width : 194px; height : 194px "/>
								</span>
								<span class = "inner-textBox">
									<span class = "title-box">
									
									</span>
									<span class = "price-Session">
										<span class= "price"></span>
									</span>
									<span class = "post-time"></span>
								</span>	
							</a>
						</div>
					</c:forEach>
					</div>
				</div>
			</div>
			
		</div>
	</div>
	<div style="height:250px"></div> 
	<jsp:include page="./inc/boardBottom.jsp" />
</body>
</html>

