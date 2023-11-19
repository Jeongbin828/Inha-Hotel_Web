<%@page import="java.security.MessageDigest"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="EUC-KR">
  <title>Inha Hotel</title>
</head>

<body>
<%
  String id = request.getParameter("_id");
  String pw = request.getParameter("_pw");
	
  try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/inha_hotel", "root", "1234");
    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery("select * from member where id='"+id+"' and pw='"+pw+"'");
		
    if(rs.next()){
      session.setAttribute("__ID", id);
      response.sendRedirect("Main.jsp");
    }else{
%>
  <script>
    alert("로그인 실패\n 아이디와 비밀번호를 다시 입력해주세요.");
    document.location.href="Login.jsp";
  </script>
<%
    }

    stmt.close();
    conn.close();
  }catch(Exception e){
    e.printStackTrace();
  }
%>
</body>
</html>