<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
	String orderNum= request.getParameter("orderNum");

	String url_mysql = "jdbc:mysql://localhost/starbucks?serverTimezone=UTC&characterEncoding=utf8&useSSL=FALSE";
 	String id_mysql = "root";
 	String pw_mysql = "qwer1234";

   	String A = "select o.orderCount, o.orderPersonal, o.orderDate, o.cd, o.orderPersonalPrice, d.name, d.img, d.price from starbucks.drink as d, starbucks.order as o where d.cd = o.cd and o.orderNum = ?;";
    	int count = 0;
    
	PreparedStatement ps = null;
   	 try {
        		Class.forName("com.mysql.cj.jdbc.Driver");
        		Connection conn_mysql = DriverManager.getConnection(url_mysql, id_mysql, pw_mysql);
        		Statement stmt_mysql = conn_mysql.createStatement();

	    	ps = conn_mysql.prepareStatement(A);
	    	ps.setString(1, orderNum);
	
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
			"orderCount" : "<%= rs.getInt(1) %>",
			"orderPersonal" : "<%= rs.getString(2) %>",
			"orderDate" : "<%= rs.getString(3) %>",
			"cd" : "<%=rs.getString(4) %>",
			"orderPersonalPrice" : "<%=rs.getInt(5) %>",
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
