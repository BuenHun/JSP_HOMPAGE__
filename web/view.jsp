<%--
  Created by IntelliJ IDEA.
  User: seunghunlee
  Date: 2018. 6. 30.
  Time: 오후 10:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.bBs" %>
<%@ page import="bbs.bBsDAO" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width", initial-scale="1">
    <link rel="stylesheet" href="css/bootstrap.css">
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

    int bbsID=0;
    if (request.getParameter("bbsID") !=null)
    {
        bbsID=Integer.parseInt(request.getParameter("bbsID"));
    }
    if (bbsID==0)
    {
        PrintWriter script =response.getWriter();
        script.println("<script>");
        script.println("alert('유효하지 않는 글입니다')");
        script.println("location.href='login.jsp'");
        script.println("</script>");

    }
    bBs bbs=new bBsDAO().getBbs(bbsID);
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
                    <li> <a href="loginAction.jsp">로그아웃</a> </li>
                        <%
            }
        %>

    </div>
</nav>


<div class="container">
    <div class="row">
            <table class="table table-striped" style="text-align: center; border: #dddddd ">
                <thead>
                <tr>
                    <th colspan="5" style="background-color: #eeeeee; text-align: center; "> 게시판 글 보기 </th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td style="width: 30%;">글 제목 </td>
                    <td colspan="2"><%= bbs.getBbsTitle().replaceAll("","&nbsp").replaceAll("<","&lt;").replaceAll(">","&gt").replaceAll("\n","<br>") %></td>
                </tr>
                <tr>
                    <td style="width: 30%;">작성자</td>
                    <td colspan="2"><%= bbs.getUserID().replaceAll("","&nbsp").replaceAll("<","&lt;").replaceAll(">","&gt").replaceAll("\n","<br>")%></td>
                </tr>
                <tr>
                    <td style="with: 30%;">TIME</td>
                    <td colspan="2"><%= bbs.getBbsDate().substring(0,11) + bbs.getBbsDate().substring(11,13)+"시"+bbs.getBbsDate().substring(14,16)+"분".replaceAll("","&nbsp").replaceAll("<","&lt;").replaceAll(">","&gt").replaceAll("\n","<br>") %></td>
                </tr>
                <tr>
                    <td style="width: 30%;">글 내용</td>
                    <td colspan="2" style="min-height: 200px; text-align: left; "><%= bbs.getBbsContent().replaceAll("","&nbsp").replaceAll("<","&lt;").replaceAll(">","&gt").replaceAll("\n","<br>")%></td>
                </tr>
                </tbody>
            </table>
        <a href="bbs.jsp" class="btn btn-primary ">LIST</a>
        <%
            if (userID !=null && userID.equals(bbs.getUserID())){ /* 현재 사용자와 글 작성자 비고*/
                %>

        <a href="update.jsp?bbsID=<%= bbsID %>" class="btn btn-primary pull-right">수정</a>
        <a onclick="return confirm('정말로 삭제하시겠습니까?')" href="deleteAction.jsp?bbsID=<%= bbsID %>" class="btn btn-primary pull-right">삭제</a>

        <%

            }
        %>
        <a href="write.jsp"><input type="submit"  a href="write.jsp" class="btn btn-primary pull-right" value="글쓰기"></a>

    </div>



</div>

</body>
</html>