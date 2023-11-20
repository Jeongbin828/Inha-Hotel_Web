<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="EUC-KR">
  <title>Inha Hotel Admin</title>
</head>

<body>
<%
  String rmId = request.getParameter("_rmId");
  String rmName = request.getParameter("_rmName");
  String rmSize = request.getParameter("_rmSize");
  String maxP = request.getParameter("_maxP");
  String price = request.getParameter("_price");

  try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/inha_hotel", "root", "1234");
    Statement stmt = conn.createStatement();
    stmt.executeUpdate("update room set rmName='"+rmName+"', rmsize="+rmSize+", maxP="+maxP+", price="+price+" where rmid="+rmId+"");		
%>
  <script>
    alert("객실 정보가 수정되었습니다.");
    document.location.href="Room_List_UI.jsp";
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