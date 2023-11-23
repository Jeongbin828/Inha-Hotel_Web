<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="EUC-KR">
  <title>Inha Hotel</title>
</head>

<body>
<%
  String id = (String)session.getAttribute("__ID");
  String rvId = request.getParameter("_rvId");
	
  try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/inha_hotel", "root", "1234");
    Statement stmt = conn.createStatement();
    stmt.executeUpdate("delete from reservation where id='"+id+"' and rvId="+rvId+"");
%>
  <script>
    alert("예약이 취소되었습니다.");
    document.location.href="Reserve_Check.jsp";
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