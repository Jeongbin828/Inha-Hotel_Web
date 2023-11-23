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
  String rmId = request.getParameter("_rmId");
  String rvId = request.getParameter("_rvId");
  String checkIn = request.getParameter("_checkIn");
  String checkOut = request.getParameter("_checkOut");
  int tPeople = Integer.parseInt(request.getParameter("_tPeople"));
	
  String checkInObj = checkIn.substring(0, 4) + checkIn.substring(5, 7) + checkIn.substring(8, 10); 
  String checkOutObj = checkOut.substring(0, 4) + checkOut.substring(5, 7) + checkOut.substring(8, 10);
    
  int date = Integer.parseInt(checkOutObj) - Integer.parseInt(checkInObj);
	
  try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/inha_hotel", "root", "1234");
    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery("select * from room where rmId='"+rmId+"'");
		
    if(rs.next()){
      int maxP = rs.getInt("maxP");
      int price = rs.getInt("price");
            
      int tPrice = price * date;

      if(maxP < tPeople || tPeople < 1){
%>
  <script>
    alert("인원을 다시 입력해주세요.");
    history.back();
  </script>
<% 
    }else{
      stmt.executeUpdate("update reservation set checkIn='"+checkIn+"', checkOut='"+checkOut+"', tPeople="+tPeople+", tPrice="+tPrice+" where id='"+id+"' and rvId="+rvId+"");
              
      out.println("<script>");
      out.println("alert('');");
      out.println("document.location.href='Reserve_Check.jsp';");
      out.println("</script>");
    }
  }
    stmt.close();
    conn.close();
  }catch(Exception e){
    e.printStackTrace();
  }
%>
</body>
</html>