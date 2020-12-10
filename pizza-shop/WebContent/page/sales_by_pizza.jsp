<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="pizza.DB" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.text.DecimalFormat"%>

<%
	DecimalFormat formatter2 = new DecimalFormat("###,###");

	String pizza_query = "SELECT " +
								"PIZZA.PCODE, " +
								"PNAME, " +
								"SUM(COST*AMOUNT) " +
						 "FROM " +
						 		"TBL_PIZZA_01 PIZZA, " +
						 		"TBL_SALELIST_01 " +
						 "WHERE " +
						 		"PIZZA.PCODE = TBL_SALELIST_01.PCODE " +
						 "GROUP BY " +
						 		"PIZZA.PCODE, PNAME " +
						 "ORDER BY " +
						 		"SUM(COST*AMOUNT) DESC";

	ResultSet pizza_rs = DB.fetch(pizza_query);
%>

<table border=1>
	<thead>
		<tr>
			<td>피자코드</td>
			<td>피자명</td>
			<td>총매출액</td>
		</tr>
	</thead>
	<tbody>
		<%
			while(pizza_rs.next()){
		%>
			<tr>
				<td><%=pizza_rs.getString(1) %></td>
				<td><%=pizza_rs.getString(2) %></td>
				<td>\<%=formatter2.format(pizza_rs.getInt(3)) %></td>
			</tr>
		<%
			};
			
			pizza_rs.close();
		%>
	</tbody>
</table>