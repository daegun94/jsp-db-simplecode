<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.initialContext"%>
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
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	String name = request.getParameter("name");
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");
	Context ctx = new initialContext();
	DataSource source = (DataSource)ctx.lookup("java:/jboss/datasources/MariaDB_S");
try {
	Connection con = source.getConnection();
	Statement stmt = con.createStatement();
	// ResultSet rs = stmt.executeQuery("select * from member");
	 
	String sql = String.format("insert into member values(%s,'%s','%s','%s','%s')",
			id, pass, name, phone, address);
	int res = stmt.executeUpdate(sql);
	if (res == 1) {
		out.println("레코드 insert 성공");
	}
	
	/* while(rs.next()) {
		out.println("<tr><td>" + rs.getInt("id") + "</td>");
		out.println("<td>" + rs.getString("pass") + "</td>");
		out.println("<td>" + rs.getString("name") + "</td>");
		out.println("<td>" + rs.getString("phone") + "</td>");
		out.println("<td>" + rs.getString("address") + "</td></tr>");
	} */
	
} catch(Exception e) {
	e.printStackTrace();
}
%>
<br />
<h3><a href="index.jsp">처음으로</a></h3>
</body>
</html>