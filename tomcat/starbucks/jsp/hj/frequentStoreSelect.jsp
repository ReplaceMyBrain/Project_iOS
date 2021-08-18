<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
	String userId = request.getParameter("userId");

	String url_mysql = "jdbc:mysql://localhost/starbucks?serverTimezone=UTC&characterEncoding=utf8&useSSL=FALSE";
 	String id_mysql = "root";
 	String pw_mysql = "qwer1234";

   	String A = "select count(o.storename) as count, l.storename, l.lat, l.lon, l.address from starbucks.location as l, starbucks.order as o where ";
	String B = "o.storename = l.storename and o.userId = ? group by o.storename order by count desc limit 10;";
    	int count = 0;
    
	PreparedStatement ps = null;
   	 try {
        		Class.forName("com.mysql.cj.jdbc.Driver");
        		Connection conn_mysql = DriverManager.getConnection(url_mysql, id_mysql, pw_mysql);
        		Statement stmt_mysql = conn_mysql.createStatement();

	    	ps = conn_mysql.prepareStatement(A+B);
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
			"storename" : "<%=rs.getString(2) %>",
			"lat" : "<%=rs.getDouble(3) %>",
			"lon" : "<%=rs.getDouble(4) %>",	
			"address" : "<%=rs.getString(5) %>"			
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
