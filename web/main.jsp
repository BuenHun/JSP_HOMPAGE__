<%--
  Created by IntelliJ IDEA.
  User: seunghunlee
  Date: 2018. 6. 30.
  Time: 오후 10:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width", initial-scale="1">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css.Chamjo.css">
    <title>게시판 웹 사이트</title>

</head>
<body>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"> </script>
<script src="js/bootstrap.js"></script>
<%
    String userID= null;
    if (session.getAttribute("userID")!=null)
    {
        userID= (String)session.getAttribute("userID");
    }
%>
<nav class="navbar navbar-default">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle collapse"
                data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="true">

            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="main.jsp">메인 페이지 </a>
    </div>

    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">

        <ul class="nav navbar-nav">
            <li class="active"><a href="main.jsp">메인</a></li>
            <li><a href="bbs.jsp">게시판</a> </li>
        </ul>

        <%
            if (userID==null)
            {
                %>
        <ul class="nav navbar-nav navbar-right">
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                   aria-haspopup="true" aria-expanded="false" >접속하기<span class="caret"> </span> </a>

                <ul class="dropdown-menu">
                    <li> <a href="login.jsp">로그인</a> </li>
                    <li> <a href="join.jsp">회원가입</a> </li>
                </ul>
            </li>

        </ul>

        <%
            }else {
                %>

        <ul class="nav navbar-nav navbar-right">
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                   aria-haspopup="true" aria-expanded="false" >회원관리<span class="caret"> </span> </a>

                <ul class="dropdown-menu">
                    <li> <a href="loginAction.jsp">로그아웃</a> </li>
        <%
            }
        %>



    </div>
</nav>

<div class="container">
    <div class="jumbotron">
        <h1>소개</h1>
        <p>JSP를 활용하여 만든 포트폴리오 웹사이트 입니다. 디자인은 부트스트랩을 활용하였습니다. </p>
        <p><a class="btn btn-primary btn-pull" href="#" role="button"> 자세히 알아보기 </a> </p>
    </div>
</div>
<div class="container">
    <div id="myCarousel" class="carousel" data-ride="carousel">

        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="2" class="active"></li>
        </ol>

    </div>
</div>

</body>
</html>