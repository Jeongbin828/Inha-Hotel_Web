<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="EUC-KR">
  <title>Inha Hotel Admin/title>
</head>

<body>
<%
  String rmName = request.getParameter("_rmName");
  String rmSize = request.getParameter("_rmSize");
  String maxP = request.getParameter("_maxP");
  String price = request.getParameter("_price");

  try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/inha_hotel", "root", "1234");
    Statement stmt = conn.createStatement();
    stmt.executeUpdate("insert into room(rmName, rmSize, maxP, price) values('"+rmName+"', "+rmSize+", "+maxP+", "+price+")");
%>
  <script>
    alert("객실이 등록되었습니다.");
    document.location.href="Room_List_UI.jsp";
  </script>
<%	
    stmt.close();
    conn.close();
  }catch(Exception e){
    e.printStackTrace();}
%>
</body>
</html>