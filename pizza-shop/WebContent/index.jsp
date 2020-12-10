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
	
	<section>
		<%
			switch(section) {
				case "insert_sale" : %> <%@ include file="page/insert_sale.jsp" %> <%
				break;
				case "total_sale" : %> <%@ include file="page/total_sale.jsp" %> <%
				break;
				case "sales_by_shop" : %> <%@ include file="page/sales_by_shop.jsp" %> <%
				break;
				case "sales_by_pizza" : %> <%@ include file="page/sales_by_pizza.jsp" %> <%
				break;
				default: %> <%@ include file="static/index.jsp" %> <%
				break;
			};
		%>
	</section>
	
	<%@ include file="static/footer.jsp" %>
</body>
</html>