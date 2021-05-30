<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>광고배너페이지</h2>
	<c:choose>
		<c:when test="${empty dto }">
			<h4>비회원이 LendMark 홈페이지 광고배너를 통해서 접근하였습니다.</h4>
		</c:when>
		
		<c:otherwise>
			<h4>${dto.id }님이 lendmark 홈페이지 광고배너를 통해서 접근하였습니다.  </h4>
	
			<h4>상세정보 :</h4> 
			이름 : ${dto.name } <br />
   			생년월일 : ${dto.birth } <br />
  			이메일 : ${dto.email1 } @ ${dto.email2 } <br /> 
		</c:otherwise>
	</c:choose>
	
</body>
</html>