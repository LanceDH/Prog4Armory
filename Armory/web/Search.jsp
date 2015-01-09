<%-- 
    Document   : Search
    Created on : 9-jan-2015, 22:16:41
    Author     : LanceDH
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% ArrayList<DAL.Character> chars = (ArrayList<DAL.Character>)session.getAttribute("Characters"); %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <table>
        <%
            for(DAL.Character c: chars ){
                out.println("<tr>");
                out.println("<td>" + c.getRace().getName() + "</td>");
                out.println("<td>" + c.getCharclass().getName() + "</td>");
                out.println("<td>" + c.getName() + "</td>");
                out.println("</tr>");
                
            }
        %>
        </table>
    </body>
</html>
