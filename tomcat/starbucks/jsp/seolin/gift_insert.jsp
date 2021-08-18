<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>        
<%
	request.setCharacterEncoding("utf-8");
	String giftSender = request.getParameter("giftSender");
	String giftReceiver = request.getParameter("giftReceiver");
	String card_cd = request.getParameter("card_cd");
	String price = request.getParameter("price");

//------
	String url_mysql = "jdbc:mysql://localhost/starbucks?serverTimezone=UTC&characterEncoding=utf8&useSSL=FALSE";
	String id_mysql = "root";
	String pw_mysql = "qwer1234";

	PreparedStatement ps = null;
	try{
	    Class.forName("com.mysql.cj.jdbc.Driver");
	    Connection conn_mysql = DriverManager.getConnection(url_mysql,id_mysql,pw_mysql);
	    Statement stmt_mysql = conn_mysql.createStatement();
	
	    String A = "insert into gift (giftSender, giftReceiver, card_cd, price, payDate) ";
	    String B = "values (?,?,?,?,now());";
	
	    ps = conn_mysql.prepareStatement(A+B);
	    ps.setString(1, giftSender);
	    ps.setString(2, giftReceiver);
	    ps.setString(3, card_cd);
	    ps.setString(4, price);

	    ps.executeUpdate();
	
	    conn_mysql.close();
	} 
	
	catch (Exception e){
	    e.printStackTrace();
	}

%>

