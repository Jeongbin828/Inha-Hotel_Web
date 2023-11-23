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

  try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/inha_hotel", "root", "1234");
    Statement stmt = conn.createStatement();
    stmt.executeUpdate("delete from member where id='"+id+"'");
    
    session.removeAttribute("__ID");
%>
  <script>
    alert("회원 탈퇴되었습니다.");
    document.location.href="Main.jsp";
  </script>
<%
    stmt.close();
    conn.close();
  }catch(Exception e){
    e.printStackTrace();
  }
%>
</body>
</html>