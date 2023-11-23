<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="EUC-KR" import= "java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="EUC-KR">
  <title>Inha Hotel/title>
  <link rel="stylesheet" href="css/Header.css"/>
  <link rel="stylesheet" href="css/Reserve_Check.css"/>
  <link rel="stylesheet" href="css/Footer.css"/>
</head>

<body>
  <header id="main_header">
    <div id="logo">
      <a id="logo_link" href="Main.jsp"><img class="logo" src="images/Logo.png"></a>
    </div>
    <nav id="nav_main">
      <ul id="top_menu">
        <li><a href='Reserve_Check.jsp' class='button'>예약확인</a></li><li>|</li>
        <li><a href='Member.jsp' class='button'>회원정보</a></li><li>|</li>
        <li><a href='Logout.jsp' class='button'>로그아웃</a></li>
      </ul>	
      <ul id="main_menu">
        <li><a href="Main.jsp" class="button">홈</a></li>
        <li><a href="Info.jsp" class="button">호텔 소개</a></li>
        <li><a href="Reserve.jsp" class="button">객실 예약</a></li>
      </ul>
    </nav>
  </header>

  <section id="reserve_check_section" style="margin-bottom: 50px;">
    <h2 style="margin-top:50px; margin-bottom: 30px;">예약확인</h2>
    <hr style="margin: auto; width: 95%; height: 3px; background-color: black">

    <table class="check_table">
      <thead>
        <tr>
          <th width=150>예약번호</th>
          <th width=200>체크인</th>
          <th width=200>체크아웃</th>
          <th width=100>객실 번호</th>
          <th width=180>객실명</th>
          <th width=150>객실 크기</th>
          <th width=100>예약인원</th>
          <th width=200>총 가격</th>
          <th width=100>변경</th>
          <th width=100>취소</th>
        </tr>	
      </thead>

      <tbody>
<%
  String id = (String)session.getAttribute("__ID");

  try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/inha_hotel", "root", "1234");
    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery("select rvId, checkIn, checkOut, reservation.rmId, rmName, rmSize, tPeople, tPrice from member, room, reservation where member.id='"+id+"' and member.id=reservation.id and room.rmId=reservation.rmId order by rvId");
			
    while(rs.next()){
      int rvId = rs.getInt("rvId");
      String checkIn = rs.getString("checkIn");
      String checkOut = rs.getString("checkOut");
      int rmId = rs.getInt("rmId");
      String rmName = rs.getString("rmName");
      int rmSize = rs.getInt("rmSize");
      int tPeople = rs.getInt("tPeople");
      int tPrice = rs.getInt("tPrice");

      out.println("<tr>");
      out.println("<td>"+rvId+"</td>");
      out.println("<td>"+checkIn+"</td>");
      out.println("<td>"+checkOut+"</td>");
      out.println("<td>"+rmId+"</td>");
      out.println("<td>"+rmName+"</td>");
      out.println("<td>"+rmSize+""㎡</td>");
      out.println("<td>"+tPeople+"</td>");
      out.println("<td>"+tPrice+"원</td>");
      out.println("<td><a href='Reserve_Update_UI.jsp?_rmId="+rmId+"&_rvId="+rvId+"&_checkIn="+checkIn+"&_checkOut="+checkOut+"&_tPeople="+tPeople+"'>변경</a></td>");
      out.println("<td><a href='Reserve_Delete_Query.jsp?_rvId="+rvId+"'>취소</a></td>");
      out.println("</tr>");
    }
      rs.close();
      stmt.close();
      conn.close();
    }catch(Exception e){
      e.printStackTrace();
    }
%>
      </tbody>
    </table>
  </section>

  <footer id="main_footer">
    <section id="footer_top">
      <h1 id="hotel_title">인하 호텔</h1>
      <nav id="link_info">
        <dl id="contact_info">
          <dd>인하호텔 032-123-4567</dd>
        </dl>
        <dl id="introduction">
          <dd><a href="Main.jsp">인하호텔 소개</a></dd>
        </dl>
      </nav>
    </section>
    <section id="footer_bottom">
      <nav id="bottom_nav">
        <ul id="top_menu">
          <li>인하 호텔 약관</li><li>|</li>
          <li>개인정보처리방침</li><li>|</li>
          <li>이메일 무단 수집 금지</li><li>|</li>
          <li>윤리경영(부정제보)</li><li>|</li>
          <li>건축/시설물 안전관리</li>
        </ul>
      </nav>
      <p id="address">인천광역시 미추홀구 인하로 100 대표이사 홍길동 사업자 등록번호 012-34-56789 통신판매신고번호 중구 123456호</p>
      <p id="inha_email">호스팅서비스 제공자 인하(주) 객실예약 a01234567@inha.com</p>
      <p id="copyright">Copyright (C) HOTEL INHA co.LTD. All Right Reserved</p>
    </section>
  </footer>
</body>
</html>