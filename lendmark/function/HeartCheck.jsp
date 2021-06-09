<%@page import="org.json.simple.JSONObject"%>
<%@page import="lendmarkServlet.LendmarkDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%
request.setCharacterEncoding("UTF-8");
String idx = request.getParameter("index");
String id = (String)session.getAttribute("USER_ID");
JSONObject json = new JSONObject();
LendmarkDAO dao = new LendmarkDAO();
boolean check = dao.heartCheck(idx, id);
if(check){
	json.put("check","no");
}
else{
	json.put("check","yes");
}
out.println(json.toString());
%>