<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>        
<%
	request.setCharacterEncoding("utf-8");
	String cartCheck = null;
	String userId= request.getParameter("userId");
	String cd= request.getParameter("cd");
	String cartPersonal= request.getParameter("cartPersonal");
	String cartCount= request.getParameter("cartCount");

	String url_mysql = "jdbc:mysql://localhost/starbucks?serverTimezone=UTC&characterEncoding=utf8&useSSL=FALSE";
 	String id_mysql = "root";
 	String pw_mysql = "qwer1234";

    	String A = "select cartId, cartCount from cart where userId = ? and cd = ? and cartPersonal = ? and cartCount = ?";


	PreparedStatement ps = null;
	try{
	    Class.forName("com.mysql.jdbc.Driver");
	    Connection conn_mysql = DriverManager.getConnection(url_mysql,id_mysql,pw_mysql);
	    Statement stmt_mysql = conn_mysql.createStatement();
		
	    ps = conn_mysql.prepareStatement(A);
	    ps.setString(1, userId);
	    ps.setString(2, cd);
	    ps.setString(3, cartPersonal);
	    ps.setInt(4, Integer.parseInt(cartCount));


        ResultSet rs = ps.executeQuery(); 
%>
  	[ 
<%	
 	
        if(rs.next()){
        		cartCheck = "true";
        }else{
        		cartCheck = "false";
        }

%>
		{
			"cartCheck" : "<%=cartCheck%>"
        }

		  ]
<%		
        conn_mysql.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
	
%>