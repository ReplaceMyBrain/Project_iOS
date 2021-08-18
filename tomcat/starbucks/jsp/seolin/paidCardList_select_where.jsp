<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

	request.setCharacterEncoding("utf-8");
	String userId = request.getParameter("userId");

	String url_mysql = "jdbc:mysql://localhost/starbucks?serverTimezone=UTC&characterEncoding=utf8&useSSL=FALSE";
 	String id_mysql = "root";
 	String pw_mysql = "qwer1234";
    String WhereDefault = "SELECT g.giftId, g.giftSender, g.giftReceiver, g.price, g.payDate, g.card_cd, c.name, c.img, c.launch FROM starbucks.gift as g inner join starbucks.card as c on g.card_cd = c.cd where g.giftSender = '"+userId+"'";
    int count = 0;
    
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn_mysql = DriverManager.getConnection(url_mysql, id_mysql, pw_mysql);
        Statement stmt_mysql = conn_mysql.createStatement();

        ResultSet rs = stmt_mysql.executeQuery(WhereDefault); // &quot;
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
			"giftId" : "<%=rs.getString(1) %>",
			"giftSender" : "<%=rs.getString(2) %>",
			"giftReceiver" : "<%=rs.getString(3) %>",
			"price" : "<%=rs.getString(4) %>",
			"payDate" : "<%=rs.getString(5) %>",  
			"card_cd" : "<%=rs.getString(6) %>",  
			"name" : "<%=rs.getString(7) %>",  
			"img" : "<%=rs.getString(8) %>"			
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
