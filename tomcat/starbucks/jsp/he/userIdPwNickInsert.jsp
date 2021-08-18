<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>        
<%
	request.setCharacterEncoding("utf-8");

	String userId = request.getParameter("userId");
	String userPw = request.getParameter("userPw");
	String userNickname = request.getParameter("userNickname");
	String userEmail = request.getParameter("userEmail");
		
//------
	String url_mysql = "jdbc:mysql://localhost/starbucks?serverTimezone=UTC&characterEncoding=utf8&useSSL=FALSE";
	String id_mysql = "root";
	String pw_mysql = "qwer1234";

	PreparedStatement ps = null;
	try{
	    Class.forName("com.mysql.cj.jdbc.Driver");
	    Connection conn_mysql = DriverManager.getConnection(url_mysql,id_mysql,pw_mysql);
	    Statement stmt_mysql = conn_mysql.createStatement();
	
	    String A = "insert into starbucks.user(userId, userPw, userNickname, userEmail, userSigndate) ";
	    String B = "values (?,?,?,?,now());";
	
	    ps = conn_mysql.prepareStatement(A+B);
	    ps.setString(1, userId);
	    ps.setString(2, userPw);
	    ps.setString(3, userNickname);
	    ps.setString(4, userEmail);

	    ps.executeUpdate();
	
	    conn_mysql.close();
	} 
	
	catch (Exception e){
	    e.printStackTrace();
	}

%>

