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
                <a href="../Armory" id="logo">
                </a>
                <form action="Search" class="search">
                    <input type="text" name="search" class="searchInput">
                    <input type="submit" value="Search">
                </form>
                <div class="floatClear"></div>
            </header>
        <main>
            <h2>Search results for <%= request.getParameter("search") %>.</h2>
        
        <%
            for(DAL.Character c: chars ){
                %>
                
                <div class="charListBlock">
                    <a href="ViewCharacter/<%= c.getName() %>">
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
                        <div class="floatClear"></div>
                                                                    </a>        
                </div>
                <%
            }
        %>
        <div class="floatClear"></div>
                </main>

        </div>
    </body>
</html>
