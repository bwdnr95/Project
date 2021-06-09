<%@page import="utils.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="./inc/boardHead.jsp" />
<!DOCTYPE html>

<html>
<head>

<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
<style>
	td > input {
		width : 250px;
		height : 50px;
	}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


 
<!--
	로그인에 실패한 경우 request영역에 속성을 저장한 후
	로그인 페이지로 포워드 하면 그 영역이 공유되어 아래
	메세지가 출력된다.
  -->



<%
//session 영역에 회원인증 정보가 없다면 로그아웃 상태이므로
//로그인 폼을 출력한다.
if(session.getAttribute("USER_ID")==null){
%>
	<script>
	//로그인 폼의 입력값을 검증하는 JS함수 정의
	function loginValidate(fn){
		if(!fn.user_id.value){
			alert("아이디를 입력하세요");
			fn.user_id.focus();
			return false;
		}
		if(fn.user_pw.value==""){
			alert("패스워드를 입력하세요");
			fn.user_pw.focus();
			return false;
		}
	}
	</script>
	<!--
		로그인 1단계 : LoginProcess.jsp
		로그인 2단계 : LoginProcessDTO.jsp
		로그인 3단계 : LoginProcessMap.jsp
	  -->
  	<div class="container">
		<jsp:include page="./inc/boardTop.jsp" />
		
		<div style="display : flex; justify-content: center; margin-top: 50px;">
			<img src="../images/랜드마크로고2.JPG" alt="" />
		</div>
		
		<form action="../lendmark/login.do" method="post" name="loginFrm"
		onsubmit="return loginValidate(this);">
	<table style= "display: flex; justify-content: center; margin-top : 50px;">
		<tr> 
			
			<td> 
				<input type="text" name="user_id" tabindex="1" placeholder="아이디"/>
			</td>
		</tr>
		<tr>
			
			<td>
				<input type="password" name="user_pw" tabindex="2" placeholder="패스워드"/>
			</td>			
		</tr>
		<tr>
			<td colspan="2" style="text-align:center;">
				<input type="submit" value="로그인" tabindex="4" style ="width: 250px; background-color: orange; color=white; "/>
			</td>			 
		</tr>
	</table>		
	</form> 
<% }
%>
	</div> 
<div style="height:250px"></div> 	
<jsp:include page="./inc/boardBottom.jsp" />
</body>
</html>