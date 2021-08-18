<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
    request.setCharacterEncoding("utf-8");


  String result = "0";
  String email = request.getParameter("email");
  String userId = request.getParameter("userId");

    String url_mysql = "jdbc:mysql://localhost/starbucks?serverTimezone=Asia/Seoul&characterEncoding=utf8&useSSL=false";
    String id_mysql = "root";
    String pw_mysql = "qwer1234";

    PreparedStatement ps = null;
    try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn_mysql = DriverManager.getConnection(url_mysql,id_mysql,pw_mysql);
        Statement stmt_mysql = conn_mysql.createStatement();

        String A = "SELECT userEmail, userId FROM user WHERE userEmail = ? OR userId = ? AND userDropdate is null";

        ps = conn_mysql.prepareStatement(A);
        ps.setString(1, email);
        ps.setString(2, userId);

        ResultSet rs = ps.executeQuery();
        if(rs.next()){
            if(rs.getString("userEmail").equals(email)){
                result = rs.getString("userId");
            }
        }
%>
        {
            "result" : "<%=result%>"
        }

<%
        conn_mysql.close();
    } catch (Exception e) {
%>
    {
        "result" : "<%=result%>"
    }
<%
        e.printStackTrace();
    }

%>
