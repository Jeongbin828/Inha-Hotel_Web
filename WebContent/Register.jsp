<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <style>
  *{
    margin: 0;
    padding: 0;
    box-sizing: border-box;
  }

  li{
    list-style-type: none;
  }
  
  .box{
    width: 1000px;
    margin: 0 auto;
  }

  .button{
    text-decoration: none;
    color: black;
  }

  #col{
    width: 120px;
  }
  
  #table{
    margin: auto;
    padding: 60px 80px;
  }
  
  .text{
    text-align: center;
    margin-bottom: 10px;
  }

  .ip{
    width: 300px;
    height: 40px;
    font-size: 15px;
    margin-bottom: 17px;
    padding-left: 5px;
  }

  #email{
    width: 160px;
    height: 40px;
    font-size: 15px;
    padding-left: 5px;
  }
  
  #join{
    width: 300px;
    height: 50px;
    padding: 0 100px;
    background-color: black;
    color: white;
  }

  .radio{
    text-align: center;
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

  <h2 style="border-bottom: solid 5px black; margin: 50px 150px; text-align: left;">회원가입</h2>
  <h2 class="text">인하 호텔에 오신 것을 환영합니다.</h2><p>
  <h5 class="text">개인 정보를 정확히 입력해 주시기 바랍니다.</h5>

  <form action="Register_Check.jsp" method="post">
    <table id="table">
      <tr>
        <td><input type="text" placeholder="아이디" name="_id" class="ip"></td>
      </tr>
      <tr>
        <td><input type="password" placeholder="비밀번호" name="_pw" class="ip"></td>
      </tr>
      <tr>
        <td><input type="password" placeholder="비밀번호 확인" name="_pwok" class="ip"></td>
      </tr>
      <tr>
        <td><input type="text" placeholder="이름" name="_name" class="ip"></td>
      </tr>
      <tr>
        <td><input type="text" placeholder="010-1234-5678" name="_phone" class="ip"></td>
      </tr>
      <tr>
        <td><input type="text" placeholder="이메일" name="_email1" id="email"> &nbsp @ &nbsp
        <select style="width: 100px; height: 38px;" name="_email2">
          <option value="@naver.com">naver.com</option>
          <option value="@gmail.com">gmail.com</option>
          <option value="@hanmail.net">hanmail.net</option>
        </select></td>
      </tr>
      <tr>
        <td class="radio"><br><h4>문자수신 여부</h4></td>
      </tr>
      <tr>
        <td class="radio">
          <input style="margin-top: 10px;" type="radio" name="_message" value="Y" checked> 예
          <input type="radio" name="_message" value="N"> 아니오
        </td>
      </tr>
      <tr>
        <td><input id="join" style="margin-top: 15px; cursor: pointer;" type="submit" name="_login" value="가입하기"></td>
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