<%-- 
    Document   : Character
    Created on : 11-jan-2015, 23:20:19
    Author     : LanceDH
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% DAL.Character c = (DAL.Character)session.getAttribute("Character"); %>
<% Map<String, Integer> attributeMap = (Map<String, Integer>)session.getAttribute("Attributes"); %>
<% ArrayList<DAL.Character> relatedCharacters = (ArrayList<DAL.Character>)session.getAttribute("AccountCharacters"); %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Character Page</title>
        <link href="../css/default.css" rel="stylesheet" type="text/css"/>
        
    </head>
    <body>
        <div id="centerDiv">
            
        <header>
                <a href="../../Armory" id="logo">
                </a>
                <form action="../Search" class="search">
                    <input type="text" name="search" class="searchInput">
                    <input type="submit" value="Search">
                </form>
            <div class="floatClear"></div>
            </header>
        <main>
            
            <div class="characterInfo">
            <div class="CharDetailLeft">
                <div id="charName"><%=c.getName()%></div>
            <div id="charComboInfo">
                <% String raceIcon = Services.MiscServices.GetImagePath(c.getRace().getIconPath(), 26); 
                   String classIcon = Services.MiscServices.GetImagePath(c.getCharclass().getIconPath(), 26); 
                %>
                <img src="../<%= raceIcon %>">
                <%=c.getRace().getName()%>
                  <img src="../<%= classIcon %>">
                <%=c.getCharclass().getName()%>
            </div>
                
                <div class="attributeList">
                    <h3>Attributes:</h3>
                    <% for (Map.Entry<String, Integer> attr : attributeMap.entrySet()) { %>
                        + <%= attr.getValue() %> <%= attr.getKey()%><br>

                    <% } %>
                </div>
            </div>
            
            <div class="CharDetailRight">
                

                
                <!-- Weapon -->
                
                
                <div class="itemBlock">
                
                    <div class="left">
                        <% String weaponIconPath = Services.MiscServices.GetImagePath("Slot-MainHand");
                            if(c.getItemByWeaponItemId()!= null){
                                weaponIconPath = Services.MiscServices.GetImagePath(c.getItemByWeaponItemId().getIconPath()); 
                            }
                        %>
                        <img src="../<%= weaponIconPath %>">
                    </div>
                    <div class="right">
                        <% if(c.getItemByWeaponItemId()!= null){ %>
                            <div class="name">
                                <%=c.getItemByWeaponItemId().getName()%> 
                            </div>
                            <div class="detail">
                                +<%=c.getItemByWeaponItemId().getAttribute1value() %> <%=c.getItemByWeaponItemId().getAttribute1().getName() %>
                                <% if(c.getItemByWeaponItemId().getAttribute2() != null){ %>
                                    <br>+<%=c.getItemByWeaponItemId().getAttribute2value() %> <%=c.getItemByWeaponItemId().getAttribute2().getName() %>
                                <% }%>
                            </div>
                        <% }%>   
                    </div>
                
                </div>

                
                <!-- Chest -->
               
                
                <div class="itemBlock">
                
                    <div class="left">
                        <% String chestIconPath = Services.MiscServices.GetImagePath("Slot-Chest");
                            if(c.getItemByChestItemId()!= null){                        
                                chestIconPath = Services.MiscServices.GetImagePath(c.getItemByChestItemId().getIconPath());
                            }
                        %>
                        <img src="../<%= chestIconPath %>">
                    </div>
                    <div class="right">
                         <% if(c.getItemByChestItemId()!= null){ %>
                            <div class="name">
                                <%=c.getItemByChestItemId().getName()%> 
                            </div>
                            <div class="detail">
                                +<%=c.getItemByChestItemId().getAttribute1value() %> <%=c.getItemByChestItemId().getAttribute1().getName() %>
                                <% if(c.getItemByChestItemId().getAttribute2() != null){ %>
                                    <br>+<%=c.getItemByChestItemId().getAttribute2value() %> <%=c.getItemByChestItemId().getAttribute2().getName() %>
                                <% }%>
                            </div>
                        <% }%>   
                    </div>
                
                </div>
                
                
                <!-- Legs -->
                
                
                <div class="itemBlock">
                
                    <div class="left">
                        <% String legsIconPath = Services.MiscServices.GetImagePath("Slot-Legs"); 
                            if(c.getItemByLegsItemId()!= null){                        
                                legsIconPath = Services.MiscServices.GetImagePath(c.getItemByLegsItemId().getIconPath()); 
                            }
                        %>
                        <img src="../<%= legsIconPath %>">
                    </div>
                    <div class="right">
                        <% if(c.getItemByLegsItemId()!= null){ %>
                            <div class="name">
                                <%=c.getItemByLegsItemId().getName()%>
                            </div>
                            <div class="detail">
                                +<%=c.getItemByLegsItemId().getAttribute1value() %> <%=c.getItemByLegsItemId().getAttribute1().getName() %>
                                <% if(c.getItemByLegsItemId().getAttribute2() != null){ %>
                                    <br>+<%=c.getItemByLegsItemId().getAttribute2value() %> <%=c.getItemByLegsItemId().getAttribute2().getName() %>
                                <% }%>
                            </div>
                        <% }%>
                            
                    </div>
                </div>
                
                
                <!-- Boots -->
                
                
                <div class="itemBlock">
                
                    <div class="left">
                        <% String bootsIconPath = Services.MiscServices.GetImagePath("Slot-Feet");
                            if(c.getItemByBootsItemId() != null){
                                bootsIconPath = Services.MiscServices.GetImagePath(c.getItemByBootsItemId().getIconPath());
                            }%>
                        <img src="../<%= bootsIconPath %>">
                    </div>
                    <div class="right">
                        <% if(c.getItemByBootsItemId() != null){ %>
                            <div class="name">
                                <%=c.getItemByBootsItemId().getName()%> 
                            </div>
                            <div class="detail">
                                +<%=c.getItemByBootsItemId().getAttribute1value() %> <%=c.getItemByBootsItemId().getAttribute1().getName() %>
                                <% if(c.getItemByBootsItemId().getAttribute2() != null){ %>
                                    <br>+<%=c.getItemByBootsItemId().getAttribute2value() %> <%=c.getItemByBootsItemId().getAttribute2().getName() %>
                                <% }%>
                            </div>
                        <% }%>
                            
                    </div>
                </div>
                
                        
                <div class="floatClear"></div>
            </div>
            
            
            <div class="floatClear"></div>
            </div>
            <div class="hSeperator"></div>
            
            <div id="relatedCharacters">
                
                <h2>Related Characters</h2>
                
                <% for(DAL.Character chara : relatedCharacters){ 
                
                if(!chara.getName().equals(c.getName())){
                %>
                <% 
                   String relRaceIcon = Services.MiscServices.GetImagePath(chara.getRace().getIconPath()); 
                   String relClassIcon = Services.MiscServices.GetImagePath(chara.getCharclass().getIconPath(), 26); 
                %>

                
                
                <div class="charListBlock">
                    <a href="<%= chara.getName() %>">
                    <div class="left">
                        <img src="../<%= relRaceIcon %>">
                    </div>
                    <div class="right">
                        <div class="name">
                            <%=chara.getName()%>
                        </div>
                        <div class="detail">
                            <img src="../<%= relClassIcon %>">
                            <%=chara.getRace().getName()%> <%=chara.getCharclass().getName()%>
                        </div>
                    </div>
                        <div class="floatClear"></div>
                                                                    </a>        
                </div>
                        
                
                <% }} %>
                <div class="floatClear"></div>
            </div>
            
        
                </main>

        </div>
    </body>
</html>