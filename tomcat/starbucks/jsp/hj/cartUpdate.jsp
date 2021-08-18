<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>        
<%
	request.setCharacterEncoding("utf-8");
	String cartCount = request.getParameter("cartCount");
	String cartId = request.getParameter("cartId");
		
//------
	String url_mysql = "jdbc:mysql://localhost/starbucks?serverTimezone=UTC&characterEncoding=utf8&useSSL=FALSE";
	String id_mysql = "root";
	String pw_mysql = "qwer1234";

	PreparedStatement ps = null;
	try{
	    Class.forName("com.mysql.cj.jdbc.Driver");
	    Connection conn_mysql = DriverManager.getConnection(url_mysql,id_mysql,pw_mysql);
	    Statement stmt_mysql = conn_mysql.createStatement();
	
	    String A = "update cart set cartCount = ? ";
	    String B = "where cartId = ?";
	
	    ps = conn_mysql.prepareStatement(A+B);
	    ps.setInt(1, Integer.parseInt(cartCount));
	    ps.setInt(2, Integer.parseInt(cartId));

	    ps.executeUpdate();
	
	    conn_mysql.close();
	} 
	
	catch (Exception e){
	    e.printStackTrace();
	}

%>

