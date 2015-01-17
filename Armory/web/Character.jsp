<%-- 
    Document   : Character
    Created on : 11-jan-2015, 23:20:19
    Author     : LanceDH
--%>

<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% DAL.Character c = (DAL.Character)session.getAttribute("Character"); %>
<% Map<String, Integer> attributeMap = (Map<String, Integer>)session.getAttribute("Attributes"); %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Character Page</title>
        <link href="../css/default.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div id="centerDiv">
        <header><form action="../Search">
                    search: <input type="text" name="search">
                    <input type="submit" value="Search">
                </form></header>
        <main>
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
            
            <div class="CharDetailLeft">
                

                
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
                                <%=c.getItemByWeaponItemId().getName()%> <%=c.getItemByWeaponItemId().getSlot().getName() %>
                            </div>
                            <div class="detail">
                                +<%=c.getItemByWeaponItemId().getAttribute1value() %> <%=c.getItemByWeaponItemId().getAttribute().getName() %>
                            </div>
                        <% }else{ %>
                            No weapon for you!<br>
                        <% } %>
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
                                <%=c.getItemByChestItemId().getName()%> <%=c.getItemByChestItemId().getSlot().getName() %>
                            </div>
                            <div class="detail">
                                +<%=c.getItemByChestItemId().getAttribute1value() %> <%=c.getItemByChestItemId().getAttribute().getName() %>
                            </div>
                        <% }else{ %>
                            No chest for you!<br>
                        <% } %>
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
                                <%=c.getItemByLegsItemId().getName()%> <%=c.getItemByLegsItemId().getSlot().getName() %>
                            </div>
                            <div class="detail">
                                +<%=c.getItemByLegsItemId().getAttribute1value() %> <%=c.getItemByLegsItemId().getAttribute().getName() %>
                            </div>
                        <% }else{ %>
                            No legs for you!<br>
                        <% } %>
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
                                <%=c.getItemByBootsItemId().getName()%> <%=c.getItemByBootsItemId().getSlot().getName() %>
                            </div>
                            <div class="detail">
                                +<%=c.getItemByBootsItemId().getAttribute1value() %> <%=c.getItemByBootsItemId().getAttribute().getName() %>
                            </div>
                        <% }else{ %>
                            No boots for you!<br>
                        <% } %>
                    </div>
                
                </div>
                
                        
                <div class="floatClear"></div>
            </div>
            <div class="CharDetailRight">
                <% for (Map.Entry<String, Integer> attr : attributeMap.entrySet()) { %>
                    <%= attr.getValue() %> <%= attr.getKey()%><br>
                
                <% } %>
            </div>
            
            <div class="floatClear"></div>
            
        
                </main>

        </div>
    </body>
</html>