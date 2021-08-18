<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
	String userId= request.getParameter("userId");
	String cd= request.getParameter("cd");
	String cartPersonal= request.getParameter("cartPersonal");
	String cartCount= request.getParameter("cartCount");

	String url_mysql = "jdbc:mysql://localhost/starbucks?serverTimezone=UTC&characterEncoding=utf8&useSSL=FALSE";
 	String id_mysql = "root";
 	String pw_mysql = "qwer1234";

   	String A = "select c.cartId, c.cartCount from drink as d, cart as c where d.cd = c.cd and c.userId = ? and c.cd = ? and c.cartPersonal = ? and c.cartCount = ?;";
    	int count = 0;
    
	PreparedStatement ps = null;
   	 try {
        		Class.forName("com.mysql.cj.jdbc.Driver");
        		Connection conn_mysql = DriverManager.getConnection(url_mysql, id_mysql, pw_mysql);
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
			"cartCount" : "<%= rs.getInt(2) %>"
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
