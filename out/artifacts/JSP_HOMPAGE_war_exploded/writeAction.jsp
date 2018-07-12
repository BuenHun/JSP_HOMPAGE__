<%@page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8" %>
<%@page import="bbs.bBsDAO" %>
<%@page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="bbs" scope="page" class="bbs.bBs"></jsp:useBean>
<jsp:setProperty name="bbs" property="bbsTitle"></jsp:setProperty>
<jsp:setProperty name="bbs" property="bbsContent"></jsp:setProperty>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html"; charset="UTF-8">
    <title>WEB SITE</title>
</head>
<body>
<%

        String userID=null;
        if (session.getAttribute("userID")!=null)
        {
            userID=(String)session.getAttribute("userID");
        }

        if (userID ==null){
            PrintWriter script=response.getWriter();
            script.println("<script>");
            script.println("alert('로그인을 하십시오')");
            script.println("location.href='login.jsp'");
            script.println("</script>");
        }

        else
            {

                if (bbs.getBbsTitle()==null && bbs.getBbsContent()==null){
                    PrintWriter script=response.getWriter();
                    script.println("<script>");
                    script.println("alert('입력되지 않은 사항이 있습니다.')");
                    script.println("history.back()");
                    script.println("</script>");

                }

                else
                {
                    bBsDAO bBsDAO=new bBsDAO();
                    int result= bBsDAO.write(bbs.getBbsTitle(),userID,bbs.getBbsContent());
                    if(result==-1) {
                            PrintWriter script = response.getWriter();
                            script.println("<script>");
                            script.println("alert('글쓰기에 실패하였습니다')");
                            script.println("history.back()");
                            script.println("</script>");
                    }

                    else
                        {
                            PrintWriter script=response.getWriter();
                            script.println("<script>");
                            script.println("location.href='bbs.jsp'");
                            script.println("</script>");

                        }
                }
            }
        %>
</body>