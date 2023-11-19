<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <style>
  * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
  }
  
  li {
    list-style-type: none;
  }
  
  .box {
    width: 1000px;
    margin: 0 auto;
  }
  
  .button {
    text-decoration: none;
    color: black;
  }
  
  #col {
    width: 80px;
  }
  
  #table{
    margin: auto;
    margin-top:50px;
    margin-bottom:150px;
    padding: 50px 80px;
    background-color: rgb(235, 228, 207);
  }
  
  .ip {
    width: 200px;
    height: 25px;
    font-size: 20px;
    margin-bottom: 5px;
  }
  
  .text {
    text-align: center;
    margin-bottom: 10px;
  }
  
  #login {
    padding: 18px 23px;
    margin-left: 5px;
    background-color: black;
    color: white;
  }
  </style>
  <title>Inha Hotel</title>
  <link rel="stylesheet" href="css/Header.css"/>
  <link rel="stylesheet" href="css/Footer.css"/>
</head>
  
<body>
  <header id="main_header">
    <div id="logo">
      <a id="logo_link" href="Main.jsp"><img class="logo" src="images/Logo.png"></a>
    </div>
    <nav id="nav_main">
      <ul id="top_menu">
        <li><a href="Login.jsp" class="button">로그인</a></li><li>|</li>
        <li><a href="Register.jsp" class="button">회원가입</a></li>
      </ul>	
      <ul id="main_menu">
        <li><a href="Main.jsp" class="button">홈</a></li>
        <li><a href="Info.jsp" class="button">호텔 소개</a></li>
        <li><a href="Reserve.jsp" class="button">객실 예약</a></li>
      </ul>
    </nav>
  </header>

  <h2 style="border-bottom: solid 5px black; margin: 50px 150px; text-align: left;">로그인</h2>
  <h2 class="text">인하 호텔에 오신 것을 환영합니다.</h2><p>
  <h5 class="text">아이디와 비밀번호를 정확히 입력해 주시기 바랍니다.</h5>

  <form action="Login_Check.jsp" method="post">
    <table id="table">
      <tr>
        <td id="col">아이디</td> <td><input type="text" name="_id" class="ip"></td>
        <td rowspan="2"><input id="login" type="submit" value="로그인" style="cursor: pointer;">
      </tr>
      <tr>
        <td>비밀번호</td> <td><input type="password" name="_pw" class="ip"></td>
      </tr>
      <tr>
        <td></td>
        <td><br><a href="Register.jsp" class="button" style="color: rgb(136, 106, 72); font-size: 14px;">회원가입</a></td>
      </tr>
    </table>
  </form>

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