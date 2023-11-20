<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="EUC-KR">
  <style>
  table{
    width: 100%;
    border-top: 1px solid;
    border-collapse: collapse;
    text-align: center;
  }

  th{
    background-color: rgb(235, 228, 207);
  }

  th, td{
    border-bottom: 1px solid;
    padding: 10px;
  }
  </style>
  <title>Inha Hotel Admin</title>
</head>

<body>
  <h2>예약 정보</h2>
  <table>
	  <tr>
      <th>예약 번호</th><th>아이디</th><th>객실 번호</th><th>체크인</th><th>체크아웃</th><th>총 인원</th><th>총 가격</th>
    </tr>
<%
  try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/inha_hotel", "root", "1234");
    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery("select * from reservation");

    while(rs.next()){
      int rvId = rs.getInt("rvId");
      String id = rs.getString("id");
      int rmId = rs.getInt("rmId");
      String checkIn = rs.getString("checkIn");
      String checkOut = rs.getString("checkOut");
      int tPeople = rs.getInt("tPeople");
      int tPrice = rs.getInt("tPrice");

      out.println("<tr>");
      out.println("<td>"+rvId+"</td>");
      out.println("<td>"+id+"</td>");
      out.println("<td>"+rmId+"</td>");
      out.println("<td>"+checkIn+"</td>");
      out.println("<td>"+checkOut+"</td>");
      out.println("<td>"+tPeople+"</td>");
      out.println("<td>"+tPrice+"</td>");
      out.println("</tr>");
    }
%>
  </table>	
<%
    rs.close();
    stmt.close();
    conn.close();
  }catch(Exception e){
    e.printStackTrace();
  }
%>
</body>
</html>