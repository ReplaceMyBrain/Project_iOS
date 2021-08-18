<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>        
<%
	request.setCharacterEncoding("utf-8");
	String cartCount = request.getParameter("cartCount");
	String cartPersonal = request.getParameter("cartPersonal");
	String cd = request.getParameter("cd");
	String userId = request.getParameter("userId");
	String cartPersonalPrice = request.getParameter("cartPersonalPrice");
		
//------
	String url_mysql = "jdbc:mysql://localhost/starbucks?serverTimezone=UTC&characterEncoding=utf8&useSSL=FALSE";
	String id_mysql = "root";
	String pw_mysql = "qwer1234";

	PreparedStatement ps = null;
	try{
	    Class.forName("com.mysql.cj.jdbc.Driver");
	    Connection conn_mysql = DriverManager.getConnection(url_mysql,id_mysql,pw_mysql);
	    Statement stmt_mysql = conn_mysql.createStatement();
	
	    String A = "insert into starbucks.cart(cartCount, cartPersonal, cd, userId, cartPersonalPrice) ";
	    String B = "values (?,?,?,?,?);";
	
	    ps = conn_mysql.prepareStatement(A+B);
	    ps.setInt(1, Integer.parseInt(cartCount));
	    ps.setString(2, cartPersonal);
	    ps.setString(3, cd);
	    ps.setString(4, userId);
	    ps.setInt(5, Integer.parseInt(cartPersonalPrice));

	    ps.executeUpdate();
	
	    conn_mysql.close();
	} 
	
	catch (Exception e){
	    e.printStackTrace();
	}

%>

