<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="pizza.DB" %>

<%
	int saleno = Integer.parseInt(request.getParameter("saleno"));
	String scode = request.getParameter("scode");
	String sale_date = request.getParameter("sale_date");
	String pcode = request.getParameter("pcode");
	int amount = Integer.parseInt(request.getParameter("amount"));
	
	String year = sale_date.substring(0, 4);
	String month = sale_date.substring(4, 6);
	String day = sale_date.substring(6);
	
	String[] datas = {String.valueOf(saleno), scode, String.valueOf(year + "-" + month + "-" + day), pcode, String.valueOf(amount)};
	
	String insert_query = "INSERT INTO TBL_SALELIST_01 VALUES(?, ?, ?, ?, ?)";
	
	DB.fetch(insert_query, datas);
	
	response.sendRedirect("../index.jsp?section=total_sale");
%>