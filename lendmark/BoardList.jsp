<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="./inc/boardHead.jsp" />
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
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
		text-overflow : ellipsis;
		
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
		display : inline-block;
		width : 194px;
		position : relative;
		font-size: 18px;
		/* padding-bottom: 20px; */
		text-overflow : ellipsis;
		white-space : nowrap;
		overflow: hidden;
		color : black;
		
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
		color : black;
		
	}
	.post-time{
		font-size: 12px;
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
				<a href="advertising.do"><img src="../images/홈페이지상단광고배너.jpg" alt="" style="width : 500px"/></a>
			</div>
			</div>
		</div>
		<div class="col-12 pt-3">
			<div style="display:flex; justify-content: center;">
				<c:choose>
					<c:when test="${param.category eq 'fassion' }">
						<h3 style="color: orange; font-weight: bold; font-family:'Architects Daughter'; ">패션</h3>
					</c:when>
					<c:when test="${param.category eq 'sports' }">
						<h3 style="color: orange; font-weight: bold; font-family:'Architects Daughter'; ">스포츠</h3>
					</c:when>
					<c:when test="${param.category eq 'electronics' }">
						<h3 style="color: orange; font-weight: bold; font-family:'Architects Daughter'; ">전자제품</h3>
					</c:when>
					<c:when test="${param.category eq 'furniture' }">
						<h3 style="color: orange; font-weight: bold; font-family:'Architects Daughter'; ">가구</h3>
					</c:when>
					<c:otherwise>
						<h3 style="color: orange; font-weight: bold; font-family:'Architects Daughter'; ">category</h3>
					</c:otherwise>
				</c:choose>
				
			</div>
			<div class ="product-Session">
				<div class="product-Session-font"> 
					<div class="product-Session-box">
					<c:choose>
						<c:when test="${empty boardLists }">
							<div style=" justify-content: center; margin-left: 415px; margin-top:50px; color: orange; font-weight: bold; font-family:'Architects Daughter';">
								<h3>등록된 게시물이 없습니다.</h3> 
							</div>
						</c:when>
						<c:otherwise>
							<c:forEach items="${boardLists }" var="product" varStatus="loop">
								<div class="product-Each-space">
									<a class=".product-LinkBox" href="view.do?idx=${product.idx }" >
										<span class="inner-imgBox">
											<img src="../Uploads/${product.simg }" alt="상품사진" style="width : 194px; height : 194px "/>
										</span>
										<span class = "inner-textBox" >
											<span class = "title-box">
												${product.title }
											</span>
											<span class = "price-Session">
												<span class= "price">
													${product.price }원
												</span>
											</span>
											<span class = "post-time">
												${product.postdate }
											</span>
										</span>	
									</a>
								</div>
							</c:forEach>
						</c:otherwise>
					</c:choose>
					</div>
				</div>
			</div>
			
		</div>
	</div>
<div style="height:250px"></div> 
<div class="row border border-dark border-bottom-0 border-right-0 border-left-0"></div>
<jsp:include page="./inc/boardBottom.jsp" />
</body>
</html>

<!-- 
	<i class='fas fa-edit' style='font-size:20px'></i>
	<i class='fa fa-cogs' style='font-size:20px'></i>
	<i class='fas fa-sign-in-alt' style='font-size:20px'></i>
	<i class='fas fa-sign-out-alt' style='font-size:20px'></i>
	<i class='far fa-edit' style='font-size:20px'></i>
	<i class='fas fa-id-card-alt' style='font-size:20px'></i>
	<i class='fas fa-id-card' style='font-size:20px'></i>
	<i class='fas fa-id-card' style='font-size:20px'></i>
	<i class='fas fa-pen' style='font-size:20px'></i>
	<i class='fas fa-pen-alt' style='font-size:20px'></i>
	<i class='fas fa-pen-fancy' style='font-size:20px'></i>
	<i class='fas fa-pen-nib' style='font-size:20px'></i>
	<i class='fas fa-pen-square' style='font-size:20px'></i>
	<i class='fas fa-pencil-alt' style='font-size:20px'></i>
	<i class='fas fa-pencil-ruler' style='font-size:20px'></i>
	<i class='fa fa-cog' style='font-size:20px'></i>

	아~~~~힘들다...ㅋ
 -->