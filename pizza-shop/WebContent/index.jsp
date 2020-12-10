<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<%
	String section = request.getParameter("section") == null ? "" : request.getParameter("section");
%>

<body>
	<%@ include file="static/header.jsp" %>
	<%@ include file="static/nav.jsp" %>
	<%@ include file="static/footer.jsp" %>
</body>
</html>