<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="pizza.DB" %>
<%@ page import="java.sql.ResultSet" %>

<%
	String sale_query = "SELECT DISTINCT P.PCODE, PNAME FROM TBL_PIZZA_01 P, TBL_SALELIST_01 SL WHERE P.PCODE = SL.PCODE";

	ResultSet sale_rs = DB.fetch(sale_query);
%>

<li>매출전표등록</li>

<form action="action/insert_sale.jsp" method="POST">
	<table border=1>
		<tr>
			<td>매출전표번호</td>
			<td><input type="number" name="saleno"></td>
		</tr>
		<tr>
			<td>지점코드</td>
			<td><input name="scode"></td>
		</tr>
		<tr>
			<td>판매일자</td>
			<td><input type="number" name="sale_date"></td>
		</tr>
		<tr>
			<td>피자코드</td>
			<td>
				<select name="pcode">
					<%
						while(sale_rs.next()) {
					%>
						<option value=<%=sale_rs.getString(1) %>><%=String.format("[%s] %s", sale_rs.getString(1), sale_rs.getString(2)) %></option>
					<%
						};
						
						sale_rs.close();
					%>
				</select>
			</td>
		</tr>
		<tr>
			<td>판매수량</td>
			<td><input type="number" name="amount"></td>
		</tr>
		<tr>
			<td><input type="submit" value="등록하기"></td>
			<td><button>다시쓰기</button></td>
		</tr>
	</table>
</form>

<script>
	document.forms[0].addEventListener("submit", function(event) {
		event.preventDefault();
		
		if(document.forms[0].saleno.value === "") {
			alert("매출전표번호칸이 비었습니다!");
			
			return document.forms[0].saleno.focus();
		};
		if(document.forms[0].scode.value === "") {
			alert("지점코드칸이 비었습니다!");
			
			return document.forms[0].scode.focus();
		};
		if(document.forms[0].sale_date.value === "") {
			alert("판매일자칸이 비었습니다!");
			
			return document.forms[0].sale_date.focus();
		};
		if(document.forms[0].amount.value === "") {
			alert("판매수량칸 비었습니다!");
			
			return document.forms[0].amount.focus();
		};
		
		alert("정상적으로 등록되었습니다!");
		return this.submit();
	});
	document.querySelector("button").onclick = function(event) {
		event.preventDefault();
		
		alert("정보를 지우고 처음부터 다시 입력합니다!");
		document.forms[0].reset();
		
		return document.forms[0].saleno.focus();
	};
</script>