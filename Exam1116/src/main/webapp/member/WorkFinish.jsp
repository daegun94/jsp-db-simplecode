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
	Context ctx = new initialContext();
	DataSource source = (DataSource)ctx.lookup("java:/jboss/datasources/MariaDB_S");
	
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
    String name = request.getParameter("name");
    String phone = request.getParameter("phone");
    String address = request.getParameter("address");
    String sql = request.getParameter("id");
    String pagetype = request.getParameter("pagetype");
    
    if (pagetype.equals("udpate")) {
    	sql = String.format("update member set id = %s, pass = '%s', name = '%s', phone = '%s', address = '%s' where id = %s"
    			, id, pass, name, phone, address, id);
    } else {
    	sql = String.format("delete from member where id = %s", id);
    }

try {
	Connection con = source.getConnection();
	Statement stmt = con.createStatement();
	 
	 int res = stmt.executeUpdate(sql);
	    if (res == 1) {
	    	out.println("레코드" + pagetype + " 성공");
	    }
	
} catch(Exception e) {
	e.printStackTrace();
}
%>
<br />
<h3><a href="index.jsp">초기 화면</a></h3>
</body>
</html>