<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="pizza.DB" %>

<%
	String total_query = "SELECT " +
								"SL.SALENO, " +
								"SH.SCODE || '-' || SH.SNAME, " +
								"SALEDATE, " +
								"PIZZA.PCODE, " +
								"PNAME, " +
								"AMOUNT, " + 
								"AMOUNT*COST " + 
						  "FROM " +
						  		"TBL_PIZZA_01 PIZZA, " +
						  		"TBL_SHOP_01 SH, " +
						  		"TBL_SALELIST_01 SL " +
						  "WHERE " +
						  		"SL.PCODE = PIZZA.PCODE AND " +
						  		"SL.SCODE = SH.SCODE " +
						  "ORDER BY " + 
						  		"SL.SALENO";

	ResultSet total_rs = DB.fetch(total_query);
%>

<table border=1>
	<thead>
		<tr>
			<td>매출전표번호</td>
			<td>지점명</td>
			<td>판매일자</td>
			<td>피자코드</td>
			<td>피자명</td>
			<td>판매수량</td>
			<td>매출액</td>
		</tr>
	</thead>
	<tbody>
		<%
			while(total_rs.next()) {
		%>
			<tr>
				<td><%=total_rs.getInt(1) %></td>
				<td><%=total_rs.getString(2) %></td>
				<td><%=total_rs.getString(3) %></td>
				<td><%=total_rs.getString(4) %></td>
				<td><%=total_rs.getString(5) %></td>
				<td><%=total_rs.getInt(6) %></td>
				<td><%=total_rs.getInt(7) %></td>
			</tr>
		<%
			};
			
			total_rs.close();
		%>
	</tbody>
</table>