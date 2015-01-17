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
        <title>Search</title>
        <link href="css/default.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div id="centerDiv">
            <header>
                <form action="Search">
                    search: <input type="text" name="search">
                    <input type="submit" value="Search">
                </form>
        
            </header>
        <main>
            <h2>Search results for <%= request.getParameter("search") %>.</h2>
        
        <%
            for(DAL.Character c: chars ){
                %>
                <a href="ViewCharacter/<%= c.getName() %>">
                <div class="charListBlock">
                
                    <div class="left">
                        <% String iconPath = Services.MiscServices.GetImagePath(c.getRace().getIconPath()); %>
                        <img src="<%= iconPath %>">
                    </div>
                    <div class="right">
                        <div class="name">
                            <%=c.getName()%>
                        </div>
                        <div class="detail">
                            <% iconPath = Services.MiscServices.GetImagePath(c.getCharclass().getIconPath(), 26); %>
                            <img src="<%= iconPath %>">
                            <%=c.getRace().getName()%> <%=c.getCharclass().getName()%>
                        </div>
                    </div>
                
                </div>
                </a>
                
               
                
                
                <!--
                out.println("<a href='ViewCharacter/"+ c.getName() +"'>");
                out.println("<div class='charListBlock'>");
                
                    out.println("<div class='left'>");
                        String iconPath = Services.MiscServices.GetImagePath(c.getRace().getIconPath());
                        out.println("<img src='"+ iconPath +"' >");
                    out.println("</div>");
                    out.println("<div class='right'>");
                        out.println("<div class='name'>");
                            out.println(c.getName());
                        out.println("</div>");
                        out.println("<div class='detail'>");
                            iconPath = Services.MiscServices.GetImagePath(c.getCharclass().getIconPath(), 26);
                            out.println("<img src='"+ iconPath +"' >");
                            out.println(c.getRace().getName() + " " + c.getCharclass().getName());
                        out.println("</div>");
                    out.println("</div>");
                
                out.println("</div>");
                out.println("</a>");
                
                /*out.println("<tr>");
                out.println("<td>" + c.getRace().getName() + "</td>");
                out.println("<td>" + c.getCharclass().getName() + "</td>");
                out.println("<td>" + c.getName() + "</td>");
                out.println("</tr>");
                */
                -->
                <%
            }
        %>
                </main>

        </div>
    </body>
</html>
