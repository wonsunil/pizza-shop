<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="pizza.DB" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.text.DecimalFormat"%>

<%
	DecimalFormat formatter = new DecimalFormat("###,###");

	String shop_query = "SELECT " +
								"SH.SCODE, " +
								"SNAME, " +
								"SUM(SL.AMOUNT*COST) " +
						"FROM " +
								"TBL_PIZZA_01 PIZZA, " +
								"TBL_SHOP_01 SH, " +
								"TBL_SALELIST_01 SL " +
						"WHERE " +
								"SH.SCODE = SL.SCODE AND " +
								"SL.PCODE = PIZZA.PCODE " +
						"GROUP BY " +
								"SH.SCODE, " +
								"SNAME " +
						"ORDER BY SCODE";
	
	ResultSet shop_rs = DB.fetch(shop_query);
%>

<table border=1>
	<thead>
		<tr>
			<td>지점 코드</td>
			<td>지점명</td>
			<td>총매출액</td>
		</tr>
	</thead>
	<tbody>
		<%
			while(shop_rs.next()) {
		%>
			<tr>
				<td><%=shop_rs.getString(1) %></td>
				<td><%=shop_rs.getString(2) %></td>
				<td>\<%=formatter.format(shop_rs.getInt(3)) %></td>
			</tr>
		<%
			};
			
			shop_rs.close();
		%>
	</tbody>
</table>