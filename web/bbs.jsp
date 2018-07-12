<%--
  Created by IntelliJ IDEA.
  User: seunghunlee
  Date: 2018. 6. 30.
  Time: 오후 10:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.bBsDAO" %>
<%@ page import="bbs.bBs" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <style type="text/css">
        a, a:hover{ color: #555555;
            text-decoration: none;
        }

    </style>
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

    int pageNumber=1;
    if (request.getParameter("pageNumber")!=null){
        pageNumber=Integer.parseInt(request.getParameter("pageNumber"));
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
            <li><a href="main.jsp">메인</a></li>
            <li class="active"><a href="bbs.jsp">게시판</a> </li>
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
                    <li> <a href="loginAction.jsp.jsp">로그아웃</a> </li>
        <%
            }
        %>

    </div>
</nav>

<div class="container">
    <table class="table table-striped" style="text-align: center; border: #dddddd ">
        <thead>
            <th style="background-color: #eeeeee; text-align: center;">번호</th>
            <th style="background-color: #eeeeee; text-align: center;">제목</th>
            <th style="background-color: #eeeeee; text-align: center;">작성자</th>
            <th style="background-color: #eeeeee; text-align: center;">작성일</th>
        </thead>
        <tbody>
        <%
            bBsDAO bBsDAO=new bBsDAO();
            ArrayList<bBs> list= bBsDAO.getList(pageNumber);
            for (int i=0; i<list.size(); i++)
            {


        %>
            <tr>
               <td><%= list.get(i).getBbsID() %></td>
                <td><a href="view.jsp?bbsID=<%= list.get(i).getBbsID()%>"><%= list.get(i).getBbsTitle() %></a> </td>
                <td><%= list.get(i).getUserID() %></td>
                <td><%= list.get(i).getBbsDate().substring(0,11) + list.get(i).getBbsDate().substring(11,13)+"시"+list.get(i).getBbsDate().substring(14,16)+"분" %></td>

            </tr>
<%
    }
%>
        </tbody>

    </table>
    <a href="write.jsp" class="btn btn-primary pull-right">글쓰기</a>
    <%

        if (pageNumber!=1){
            %>
            <a href="bbs.jsp?pageNumber=<%=pageNumber-1%>" class="btn btn-success btn-arraw-left">이전</a>
    <%
        } if (bBsDAO.nextPage(pageNumber))
        { %>
            <a href="bbs.jsp?pageNumber=<%=pageNumber+1%>" class="btn btn-success btn-arraw-left">다음</a>
    <%
        }
    %>

</div>

</body>
</html>