<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
	String userId= request.getParameter("userId");

	String url_mysql = "jdbc:mysql://localhost/starbucks?serverTimezone=UTC&characterEncoding=utf8&useSSL=FALSE";
 	String id_mysql = "root";
 	String pw_mysql = "qwer1234";

   	String A = "select c.cartId, c.cartCount, c.cartPersonal, c.cd, c.cartPersonalPrice, d.name, d.img, d.price from drink as d, cart as c where d.cd = c.cd and userId = ?;";
    	int count = 0;
    
	PreparedStatement ps = null;
   	 try {
        		Class.forName("com.mysql.cj.jdbc.Driver");
        		Connection conn_mysql = DriverManager.getConnection(url_mysql, id_mysql, pw_mysql);
        		Statement stmt_mysql = conn_mysql.createStatement();

	    	ps = conn_mysql.prepareStatement(A);
	    	ps.setString(1, userId);
	
        		ResultSet rs = ps.executeQuery(); 

        
%>
  	[ 
<%
        while (rs.next()) {
            if (count == 0) {

            }else{
%>
            , 
<%           
            }
            count++;                 
%>
			{
			"cartId" : "<%=rs.getString(1) %>",
			"cartCount" : "<%= rs.getInt(2) %>",
			"cartPersonal" : "<%= rs.getString(3) %>",
			"cd" : "<%=rs.getString(4) %>",
			"cartPersonalPrice" : "<%=rs.getInt(5) %>",
			"name" : "<%= rs.getString(6) %>",
			"img" : "<%= rs.getString(7) %>",
			"price" : "<%=rs.getInt(8) %>"
			}
<%		
        }
%>
		  ]
<%		
        conn_mysql.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
	
%>
