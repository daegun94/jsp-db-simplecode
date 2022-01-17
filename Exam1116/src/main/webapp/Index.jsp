<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.initialContext"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	Context ctx = new initialContext();
	DataSource source = (DataSource)ctx.lookup("java:/jboss/datasources/MariaDB_S");
try{
	Connection con = source.getConnection();
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery("select * from member");
	 
 	out.print("<table border =" + "2 " + "width =" + "700 " + "align ="
             + "center " + "bordercolor =" + "green " + "cellspacing ="
             + "2 " + " bordercolor =" + "green >");
	while(rs.next()) {
		out.print("<tr><td>" + rs.getInt("id") + "</td>");
		out.print("<td>" + rs.getString("pass") + "</td>");
		out.print("<td>" + rs.getString("name") + "</td>");
		out.print("<td>" + rs.getString("phone") + "</td>");
		out.print("<td>" + rs.getString("address") + "</td>");
		String update = String.format("<a href='UpdateMember.jsp?id=%s'>수정</a> ", rs.getInt("id"));
		out.print("<td>" + update);
		String delete = String.format("<a href='DeleteMember.jsp?id=%s'>삭제</a>", rs.getInt("id"));
		out.print(delete + "</td></tr>");
		
	}
	out.print("</table>");
	
} catch(Exception e) {
	e.printStackTrace();
}
%>
<br />
<h1>학생 정보 입력</h1>
	<form action="AddMember.jsp">
		<table border="1">
			<tr>
				<th>학번</th>
				<th><input type="text" name="id" value="500"></th>
			</tr>
			<tr>
				<th>계정</th>
				<th><input type="text" name="pass" value="yu500"></th>
			</tr>
			<tr>
				<th>이름</th>
				<th><input type="text" name="name" value="유지환"></th>
			</tr>
			<tr>
				<th>연락처</th>
				<th><input type="text" name="phone" value="219-7125"></th>
			</tr>
			<tr>
				<th>주소</th>
				<th><input type="text" name="address" value="인천"></th>
			</tr>
		</table>
		<br>
		<button type="submit">추가</button>
	</form>
</body>
</html>