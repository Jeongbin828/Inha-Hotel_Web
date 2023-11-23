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
  String name = request.getParameter("_name");
  String phone = request.getParameter("_phone");
  String email = request.getParameter("_email");

  try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/inha_hotel", "root", "1234");
    Statement stmt = conn.createStatement();
    stmt.executeUpdate("update member set name='"+name+"', phone='"+phone+"', email='"+email+"' where id='"+id+"'");
%>
  <script>
  alert("회원정보가 수정되었습니다.");
  document.location.href="Member.jsp";
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