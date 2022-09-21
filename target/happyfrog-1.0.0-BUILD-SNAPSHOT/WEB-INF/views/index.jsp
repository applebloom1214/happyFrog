<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <!-- w3스쿨 이미지 링크 -->
  <link
          rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <title>Document</title>
  <style>
    body {
      margin: 0;
      background-image: url(/happyfrog/resources/images/leaves.webp);
    }

    /*그리드 설정*/
    .grid-container {
      padding: 0.63em;
      display: grid;
      gap: 0.31em;
      grid-template-rows: 4.38em 4.38em 40em 3.13em 3.13em;
    }

    .grid-item {
      padding: 0.31em;
      /* border: 0.19em solid black; */
      color: green;
    }

    /*헤더 설정*/
    .header {
      color: green;
      display: flex;
      justify-content: space-between;
      align-items: center;
      background-color: whitesmoke;
    }
    .logo span,
    a {
      color: green;
      float: left;
      text-align: center;
      padding: 0.75em;
      text-decoration: none;
      font-size: 1.13em;
      line-height: 1.56em;
      border-radius: 0.25em;
    }

    .header a.active {
      background-color: #7DCE13;
      color: white;
    }

    .header a:hover {
      background-color: #ddd;
      color: black;
    }

    .header a.active {
      background-color: #7DCE13;
      color: white;
    }

    img {
      width: 3.44em;
      height: 3.44em;
    }

    /*검색 설정*/
    .search {
      display: flex;
      justify-content: center;
    }
    form.search input[type=text] {
      width: 18.75em;
      font-size: 1.06em;
      border: 0.06em solid grey;
      background: #f1f1f1;
    }

    form.search button {
      width: 3.13em;
      background: #7DCE13;
      color: white;
      font-size: 1.06em;
      border: 0.06em solid grey;
      border-left: none;
      /* 이중 테두리 방지 */
      cursor: pointer;
    }

    .search select {
      margin-right: 0.44em;
    }

    form.search button:hover {
      background: #075f04;
    }

    form.search::after {
      content: "";
    }

    /*페이징 설정*/
    .paging {
      display: flex;
      justify-content: center;
    }

    .paging button {
      height: 2.50em;
      padding: 0.31em 0.94em;
      font-size: 0.94em;
      text-align: center;
      cursor: pointer;
      outline: none;
      color: #fff;
      background-color: #7DCE13;
      border: none;
      border-radius: 0.94em;
    }

    .paging button:hover {
      background-color: #3e8e41;
    }

    .paging button:active {
      background-color: #3e8e41;
      box-shadow: 0 0.31em #666;
      transform: translateY(0.25em);
    }

    .paging a {
      color: black;
      padding: 0.40em;
      text-decoration: none;
      transition: background-color 0.3s;
    }

    .paging a.active {
      background-color: #7DCE13;
      color: white;
    }

    .paging a:hover:not(.active) {
      background-color: #7DCE13;
    }

    /*css table 설정(div를 이용해 table 작성)*/

    .table {
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
      height: 100%;

    }

    .sort {
      align-self: flex-start;
      margin-left: 10%;
      padding-bottom: 0.3%;
    }

    div.blueTable {
      border: 0.06em solid #020500;
      background-color: #EEEEEE;
      width: 80%;
      text-align: left;
      border-collapse: collapse;
    }
    .divTable.blueTable .divTableCell,
    .divTable.blueTable .divTableHead {
      border: 0.06em solid #AAAAAA;
      padding: 0.19em 0.75em;
    }
    .divTable.blueTable .divTableBody .divTableCell {
      font-size: 1em;
    }
    .divTable.blueTable .divTableHeading {
      background: #7DCE13;
      background: -moz-linear-gradient(top, #7DCE13 0%, #7DCE13 66%, #7DCE13 100%);
      background: -webkit-linear-gradient(top, #7DCE13 0%, #7DCE13 66%, #7DCE13 100%);
      background: linear-gradient(to bottom, #7DCE13 0%, #7DCE13 66%, #7DCE13 100%);
      border-bottom: 0.13em solid #444444;
    }
    .divTable.blueTable .divTableHeading .divTableHead {
      font-size: 1.25em;
      font-weight: bold;
      color: #000000;
      border-left: 0.13em solid #D0E4F5;
    }
    .divTable.blueTable .divTableHeading .divTableHead:first-child {
      border-left: none;
    }

    .divTable {
      display: table;
    }
    .divTableRow {
      display: table-row;
    }
    .divTableHeading {
      display: table-header-group;
    }
    .divTableCell,
    .divTableHead {
      display: table-cell;
    }
    .divTableHeading {
      display: table-header-group;
    }
    .divTableBody {
      display: table-row-group;
    }

    .divTableHead.bno {
      width: 10%;
    }

    .divTableHead.grade {
      width: 10%;
    }

    .divTableHead.day {
      width: 20%;
    }

    .sort button {
      box-shadow: inset 0 1px 0 0 #caefab;
      background: linear-gradient(to bottom, #7DCE13 5%, #7DCE13 100%);
      background-color: #7DCE13;
      border-radius: 6px;
      border: 1px solid #7DCE13;
      display: inline-block;
      cursor: pointer;
      color: #306108;
      font-family: Arial;
      font-size: 13px;
      font-weight: bold;
      padding: 6px 24px;
      text-decoration: none;
      text-shadow: 0 1px 0 #aade7c;
    }

    .sort button:hover {
      background: linear-gradient(to bottom, #a5cc52 5%, #b8e356 100%);
      background-color: #a5cc52;
    }
    .sort button:active {
      position: relative;
      top: 1px;
    }
  </style>
</head>
<body>
<div class="grid-container">
  <!-- 로고, 인포, 회원가입, 로그인/로그아웃 -->
  <div class="grid-item">
    <div class="header">
      <div class="logo">
        <img src="/happyfrog/resources/images/frog.png">
        <span>HappyFrog 0.0</span>
      </div>
      <div class="header-right">
        <a class="active" href="#home">Home</a>
        <a href="#signin">SignUp</a>
        <a href="#Login">Login</a>
      </div>
    </div>
  </div>
  <!-- API -->
  <div class="grid-item">HFApi</div>
  <!--게시판, 정렬 버튼-->
  <div class="grid-item">
    <div class="table">
      <div class="sort">
        <button class="reply">댓글순</button>
        <button class="grade">평점순</button>
        <button class="random">랜덤</button>
      </div>
      <div class="divTable blueTable">
        <div class="divTableHeading">
          <div class="divTableRow">
            <div class="divTableHead bno">번호</div>
            <div class="divTableHead title">제목</div>
            <div class="divTableHead day">날짜</div>
            <div class="divTableHead grade">평점</div>
          </div>
        </div>
        <div class="divTableBody">
          <div class="divTableRow">
            <div class="divTableCell">cell1_1</div>
            <div class="divTableCell">cell2_1</div>
            <div class="divTableCell">cell3_1</div>
            <div class="divTableCell">cell4_1</div>
          </div>
          <div class="divTableRow">
            <div class="divTableCell">cell1_2</div>
            <div class="divTableCell">cell2_2</div>
            <div class="divTableCell">cell3_2</div>
            <div class="divTableCell">cell4_2</div>
          </div>
          <div class="divTableRow">
            <div class="divTableCell">cell1_3</div>
            <div class="divTableCell">cell2_3</div>
            <div class="divTableCell">cell3_3</div>
            <div class="divTableCell">cell4_3</div>
          </div>
          <div class="divTableRow">
            <div class="divTableCell">cell1_4</div>
            <div class="divTableCell">cell2_4</div>
            <div class="divTableCell">cell3_4</div>
            <div class="divTableCell">cell4_4</div>
          </div>
          <div class="divTableRow">
            <div class="divTableCell">cell1_5</div>
            <div class="divTableCell">cell2_5</div>
            <div class="divTableCell">cell3_5</div>
            <div class="divTableCell">cell4_5</div>
          </div>
          <div class="divTableRow">
            <div class="divTableCell">cell1_6</div>
            <div class="divTableCell">cell2_6</div>
            <div class="divTableCell">cell3_6</div>
            <div class="divTableCell">cell4_6</div>
          </div>
          <div class="divTableRow">
            <div class="divTableCell">cell1_7</div>
            <div class="divTableCell">cell2_7</div>
            <div class="divTableCell">cell3_7</div>
            <div class="divTableCell">cell4_7</div>
          </div>
          <div class="divTableRow">
            <div class="divTableCell">cell1_8</div>
            <div class="divTableCell">cell2_8</div>
            <div class="divTableCell">cell3_8</div>
            <div class="divTableCell">cell4_8</div>
          </div>
          <div class="divTableRow">
            <div class="divTableCell">cell1_9</div>
            <div class="divTableCell">cell2_9</div>
            <div class="divTableCell">cell3_9</div>
            <div class="divTableCell">cell4_9</div>
          </div>
          <div class="divTableRow">
            <div class="divTableCell">cell1_10</div>
            <div class="divTableCell">cell2_10</div>
            <div class="divTableCell">cell3_10</div>
            <div class="divTableCell">cell4_10</div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!--목록 버튼 & 페이징 & 글쓰기 버튼-->
  <div class="grid-item">
    <div class="paging">
      <button type="button" class="listBtn">목록</button>
      <a href="#">&laquo;</a>
      <a href="#">1</a>
      <a class="active" href="#">2</a>
      <a href="#">3</a>
      <a href="#">4</a>
      <a href="#">5</a>
      <a href="#">6</a>
      <a href="#">7</a>
      <a href="#">8</a>
      <a href="#">9</a>
      <a href="#">10</a>
      <a href="#">&raquo;</a>
      <button type="button" class="writeBtn">글쓰기</button>
    </div>
  </div>
  <!--검색-->
  <div class="grid-item">
    <div class="searchD">
      <form class="search" action="#">
        <select class="search" style="height:42px">
          <option value="title">제목</option>
          <option value="content">내용</option>
          <option value="title&content">제목+내용</option>
          <option value="writer">작성자</option>
        </select>
        <input type="text" placeholder="검색할 내용을 입력해주세요" name="search">
        <button type="submit">
          <i class="fa fa-search"></i>
        </button>
      </form>
    </div>
  </div>
</div>
</body>
</html>