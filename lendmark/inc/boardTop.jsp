<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
<style>
	nav{
		font-size:12px; font-family:verdana;
		width : 100%;
	}
</style>
	<div class="row">		
		<div class="col-12">			 
			<nav class="navbar navbar-expand-sm bg-light justify-content-center">
				<!-- Brand/logo -->
				<a class="navbar-brand" href="../lendmark/LendmarkHomePage.jsp" style="margin-left: 70px;">
					<img src="../images/LendMarkLogo.png" style="width:100px;">
				</a>
				
				<!-- Links -->
				
				<form class="form-inline mt-3 ml-3" method="get" action="../lendmark/list.do">
					<div class="input-group mb-3">
						<input type="text" class="form-control" name="searchWord" placeholder="검색어를 입력해주세요." style ="width:380px; margin-left:70px">
						<div class="input-group-append">
							<button class="btn btn-warning" type="submit"><i class='fas fa-search' style='font-size:12px'></i></button>
						</div>
					</div>
				</form>
				<ul class="navbar-nav" style ="margin-left : 20px">
					<li class="nav-item" style="margin-left:15px">
						<a class="nav-link text-dark" href="../lendmark/write.do">판매하기</a>
					</li>
					<li class="nav-item" style="margin-left:15px">
						<a class="nav-link text-dark" href="../seunghyun.do">내 상점</a>
					</li>
					<li class="nav-item" style="margin-left:20px">
						<a class="nav-link text-dark" href="#"><i class='fab fa-rocketchat' style='font-size:18px'></i></a>
					</li>
				</ul>

				
				<ul class="navbar-nav ml-auto" >
					<c:choose>
						<c:when test="${USER_ID eq null }">
							<li class="nav-item">
								<a class="nav-link text-dark" href="../lendmark/login.do"><i class='fas fa-sign-in-alt' style='font-size:20px'></i>로그인</a>
							</li>
							<li class="nav-item">
								<a class="nav-link text-dark" href="../lendmark/regist.do"><i class='fas fa-edit' style='font-size:20px'></i>회원가입</a>
							</li>
						</c:when>
						<c:otherwise>
							<li class="nav-item">
								<a class="nav-link text-dark" href="../lendmark/logout.do"><i class='fas fa-sign-out-alt' style='font-size:20px'></i>로그아웃</a>
							</li>
							<li class="nav-item">
								<a class="nav-link text-dark" href="#"><i class='fa fa-cogs' style='font-size:20px'></i>회원정보수정</a>
							</li>
						</c:otherwise>
					</c:choose>
				</ul>
			</nav>
		</div>
	</div>