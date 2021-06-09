<%@page import="utils.JSFunction"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="lendmarkServlet.LendmarkDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%
request.setCharacterEncoding("UTF-8");

JSONObject json = new JSONObject();
int heartPlus = 0;
String idx = request.getParameter("index");
String id = (String)session.getAttribute("USER_ID");
/* out.println(id+"고객아이디"); */
session.setAttribute("url", "../lendmark/BoardWrite.jsp");

if(id==null) {
	JSFunction.alertLocation(response, "로그인 후 이용해주세요.", "../lendmark/login.do");
}
else{
	LendmarkDAO dao = new LendmarkDAO();
	heartPlus = dao.heartCountCheck(idx, id);
	
	
	if(heartPlus==1) {
		dao.heartCountPlus(idx);
		json.put("result",1);
		
	}
	else{
		dao.heartCountMinus(idx);
		json.put("result",0);
	}
	int totalHeart = dao.totalHeart(idx);
	json.put("totalHeart",totalHeart);
	dao.close();
	out.println(json.toString());	
}
%>