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
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width", initial-scale="1">
    <link rel="stylesheet" href="css.Chamjo.css">
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

    if (userID==null)
    {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('로그인을 하십시오. ')");
        script.println("location.href='login.jsp'");
        script.println("</script>");
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

    bBs bBs=new bBsDAO().getBbs(bbsID);
    if (!userID.equals(bBs.getUserID()))
    {
        PrintWriter script =response.getWriter();
        script.println("<script>");
        script.println("alert('권한이 없습니다')");
        script.println("location.href='bbs.jsp'");
        script.println("</script>");

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

                <ul class="nav navbar-nav navbar-right">
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                   aria-haspopup="true" aria-expanded="false" >회원관리<span class="caret"> </span> </a>

                <ul class="dropdown-menu">
                    <li> <a href="loginAction.jsp">로그아웃</a> </li>

    </div>
</nav>


<div class="container">
    <div class="row">
        <form method="post" action="updateAction.jsp?bbsID=<%= bbsID %>">
            <table class="table table-striped" style="text-align: center; border: #dddddd ">
                <thead>
                <tr>
                    <th colspan="5" style="background-color: #eeeeee; text-align: center; "> 게시판 글 수정 양식 </th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td><input type="text" class="form-control" placeholder="글 제목" name="bbsTitle" maxlength="50" value="<%= bBs.getBbsTitle() %>"></td>
                </tr>
                <tr>
                    <td><textarea class="form-control" placeholder="글 내용" name="bbsContent" maxlength="2048" style="height: 350px;"><%= bBs.getBbsContent() %>%</textarea></td>
                </tr>
                </tbody>
            </table>
            <input type="submit"  class="btn btn-primary pull-right" value="글 수정">
        </form>
    </div>



</div>

</body>
</html>