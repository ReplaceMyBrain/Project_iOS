<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
	String cd = request.getParameter("cd");

	String url_mysql = "jdbc:mysql://localhost/starbucks?serverTimezone=UTC&characterEncoding=utf8&useSSL=FALSE";
 	String id_mysql = "root";
 	String pw_mysql = "qwer1234";

   	String A = "select volume,kcal,protein,fat,sodium,sugars,caffeine,cholesterol,carbo from drink where cd = ?;";
    	int count = 0;
    
	PreparedStatement ps = null;
   	 try {
        		Class.forName("com.mysql.cj.jdbc.Driver");
        		Connection conn_mysql = DriverManager.getConnection(url_mysql, id_mysql, pw_mysql);
        		Statement stmt_mysql = conn_mysql.createStatement();

	    	ps = conn_mysql.prepareStatement(A);
	    	ps.setString(1, cd);
	
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
			"volume" : "<%=rs.getString(1) %>",
			"kcal" : "<%=rs.getString(2) %>",
			"protein" : "<%=rs.getString(3) %>",
			"fat" : "<%=rs.getString(4) %>",
			"sodium" : "<%=rs.getString(5) %>",
			"sugars" : "<%=rs.getInt(6) %>",
			"caffeine" : "<%=rs.getInt(7) %>",
			"cholesterol" : "<%=rs.getString(8) %>",
			"carbo" : "<%=rs.getInt(9) %>"
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
