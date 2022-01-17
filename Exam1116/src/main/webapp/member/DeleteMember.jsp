<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.initialContext"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.sql.DataSource"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	Context ctx = new initialContext();
	DataSource source = (DataSource)ctx.lookup("java:/jboss/datasources/MariaDB_S");
	String id = request.getParameter("id");
	String pass = "";
    String name = "";
    String phone = "";
    String address = "";
	String sql = String.format("select * from member where id = %s", id);
try {
	Connection con = source.getConnection();
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
 	rs.next();
 	pass = rs.getString("pass");
 	name = rs.getString("name");
 	phone = rs.getString("phone");
 	address = rs.getString("address");
	
} catch(Exception e) {
	e.printStackTrace();
}
%>
<h1>학생 정보 입력</h1>
	<form action="./WorkFinish.jsp">
		<table border="1">
			<tr>
				<th>학번</th>
				<th><input type="text" name="id" value="<%=id%>"></th>
			</tr>
			<tr>
				<th>계정</th>
				<th><input type="text" name="pass" value="<%=pass%>"></th>
			</tr>
			<tr>
				<th>이름</th>
				<th><input type="text" name="name" value="<%=name%>"></th>
			</tr>
			<tr>
				<th>연락처</th>
				<th><input type="text" name="phone" value="<%=phone%>"></th>
			</tr>
			<tr>
				<th>주소</th>
				<th><input type="text" name="address" value="<%=address%>">
					<input type="hidden" name="pagetype" value="delete" />
				</th>
				
			</tr>
		</table>
		<br>
		<button type="submit">삭제</button>
		<h3><a href="index.jsp">취소</a></h3>
	</form>
</body>
</html>