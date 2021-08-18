<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>        
<%
	request.setCharacterEncoding("utf-8");
	String orderNum = request.getParameter("orderNum");
	String orderCount = request.getParameter("orderCount");
	String orderPersonal = request.getParameter("orderPersonal");
	String storename = request.getParameter("storename");
	String cd = request.getParameter("cd");
	String userId = request.getParameter("userId");
	String orderPersonalPrice = request.getParameter("orderPersonalPrice");
		
//------
	String url_mysql = "jdbc:mysql://localhost/starbucks?serverTimezone=UTC&characterEncoding=utf8&useSSL=FALSE";
	String id_mysql = "root";
	String pw_mysql = "qwer1234";

	PreparedStatement ps = null;
	try{
	    Class.forName("com.mysql.cj.jdbc.Driver");
	    Connection conn_mysql = DriverManager.getConnection(url_mysql,id_mysql,pw_mysql);
	    Statement stmt_mysql = conn_mysql.createStatement();
	
	    String A = "insert into starbucks.order(orderNum, orderCount, orderPersonal, orderDate, storename, cd, userId, orderPersonalPrice) ";
	    String B = "values (?,?,?,now(),?,?,?,?);";
	
	    ps = conn_mysql.prepareStatement(A+B);
	    ps.setString(1, orderNum);
	    ps.setInt(2, Integer.parseInt(orderCount));
	    ps.setString(3, orderPersonal);
	    ps.setString(4, storename);  
	    ps.setString(5, cd);
	    ps.setString(6, userId);
	    ps.setInt(7, Integer.parseInt(orderPersonalPrice));

	    ps.executeUpdate();
	
	    conn_mysql.close();
	} 
	
	catch (Exception e){
	    e.printStackTrace();
	}

%>

