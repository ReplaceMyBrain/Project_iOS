<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
	String userId = request.getParameter("userId");

	String url_mysql = "jdbc:mysql://localhost/starbucks?serverTimezone=UTC&characterEncoding=utf8&useSSL=FALSE";
 	String id_mysql = "root";
 	String pw_mysql = "qwer1234";
	String query = "select o.orderId, o.orderNum, o.orderCount, o.orderPersonal, o.orderDate, o.storename, o.cd, o.userId, d.price, d.img, d.name, l.address, u.userNickname, o.orderPersonalPrice from starbucks.order as o, drink as d, location as l, user as u where d.cd = o.cd and o.userId = u.userId and o.storename = l.storename and o.userId = ?";
	int count = 0;
    
	PreparedStatement ps = null;
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn_mysql = DriverManager.getConnection(url_mysql, id_mysql, pw_mysql);

	ps = conn_mysql.prepareStatement(query);
	ps.setString(1, userId);

        ResultSet rs = ps.executeQuery(); // &quot;
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
			"orderId" : "<%=rs.getString(1) %>",
			"orderNum" : "<%=rs.getString(2) %>",
			"orderCount" : "<%=rs.getInt(3) %>", 
			"orderPersonal" : "<%=rs.getString(4) %>",
			"orderDate" : "<%=rs.getString(5) %>",
			"storename" : "<%=rs.getString(6) %>",
			"cd" : "<%=rs.getString(7) %>",
			"userId" : "<%=rs.getString(8) %>",
			"price" : "<%=rs.getString(9) %>",
			"img" : "<%=rs.getString(10) %>",
			"name" : "<%=rs.getString(11) %>",
			"address" : "<%=rs.getString(12) %>",
			"userNickname" : "<%=rs.getString(13) %>",
			"orderPersonalPrice" : "<%=rs.getString(14) %>"
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
