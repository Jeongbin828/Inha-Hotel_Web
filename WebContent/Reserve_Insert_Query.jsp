<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="EUC-KR">
  <title>Inha Hotel</title>
</head>

<body>
<%
  String id = (String)session.getAttribute("__ID");                 // 아이디
  String rmId = request.getParameter("_rmId");                      // 객실 번호
  String checkIn = request.getParameter("_checkIn");                // 체크인 날짜
  String checkOut = request.getParameter("_checkOut");              // 체크아웃 날짜
  int tPeople = Integer.parseInt(request.getParameter("_tPeople")); // 예약인원
	
  String checkInObj = checkIn.substring(0, 4) + checkIn.substring(5, 7) + checkIn.substring(8, 10); 
  String checkOutObj = checkOut.substring(0, 4) + checkOut.substring(5, 7) + checkOut.substring(8, 10);
	
  int date = Integer.parseInt(checkOutObj) - Integer.parseInt(checkInObj);  // 숙박일
	
  try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/inha_hotel", "root", "1234");
    Statement stmt = conn.createStatement();
		
    ResultSet rs = stmt.executeQuery("select * from room where rmId='"+rmId+"'");
		
    if(rs.next()){
      int maxP = rs.getInt("maxP");   // 해당 객실 최대 인원
      int price = rs.getInt("price"); // 해당 객실 1박 가격
			
      int tPrice = price * date;      // 총 가격 = 1박 가격 * 숙박일
			
      if(maxP < tPeople || tPeople < 1){
%>
  <script>
    alert("인원을 다시 입력해주세요.");
    document.location.href="Reserve_Insert_UI.jsp";
  </script>
<%
    }else{
      stmt.executeUpdate("insert into reservation(id, rmId, checkIn, checkOut, tPeople, tPrice) values('"+id+"', "+rmId+", '"+checkIn+"', '"+checkOut+"', "+tPeople+", "+tPrice+")");
				
      out.println("<script>");
      out.println("alert('예약되었습니다.');");
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