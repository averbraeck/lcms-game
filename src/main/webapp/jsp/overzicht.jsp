<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page import="nl.tudelft.simulation.lcms.data.tables.records.UserRecord"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Messages</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/overzicht.css">
    <% UserRecord user = (UserRecord) session.getAttribute("user"); %>
    <script src="${pageContext.request.contextPath}/js/overzicht.js"></script>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Material+Icons+Outlined" rel="stylesheet">
</head>

<body>
  
  <div class="app">
  
    <div class="screen">
    
      <aside class="sidebar">
    
        <div class="top">
    
          <form action="${pageContext.request.contextPath}/overzicht" method="POST">
            <button type="submit" class="menu-btn" name="command" value="refresh">
              <div class="icon">
                <img src="${pageContext.request.contextPath}/images/lcms-logo-green.png" style="max-width: 40px; height:auto; display:block; margin:auto;"> 
              </div>
              <div class="nav">
                <span class="green">PDPC / TU DELFT</span><br>
                <span class="green">LCMS GAME</span>
              </div>
            </button>
          </form>
    
          <div class="menu" style="margin-top: 10px;">
            <div class="icon">
              &nbsp; 
            </div>
            <div class="nav">
              <div id="currentTime">Loading...</div>
            </div>
          </div>
        
        </div> <!-- top -->
    
        <div class="bottom">
          
          <hr style="width: 100%; border: none; border-top: 1px solid #ccc; margin: 8px 0;">
          
          <form action="${pageContext.request.contextPath}/overig" method="POST">
            <button type="submit" class="menu-btn" name="command" value="overig">
              <div class="icon">
                <span class="material-icons" style="font-size: 30px; display:block; margin-top:-15px;">more_horiz</span>
              </div>
              <div class="nav">
                OVERIG
              </div>
            </button>
          </form>
          
          <form action="${pageContext.request.contextPath}/plot" method="POST">
            <button type="submit" class="menu-btn" name="command" value="plot">
              <div class="icon">
                &nbsp; 
              </div>
              <div class="nav">
                PLOT
              </div>
            </button>
          </form>
          
          <form action="${pageContext.request.contextPath}/documenten" method="POST">
            <button type="submit" class="menu-btn" name="command" value="documenten">
              <div class="icon">
                &nbsp; 
              </div>
              <div class="nav">
                DOCUMENTEN
              </div>
            </button>
          </form>
          
          <form action="${pageContext.request.contextPath}/onderhoud" method="POST">
            <button type="submit" class="menu-btn" name="command" value="onderhoud">
              <div class="icon">
                &nbsp;
              </div>
              <div class="nav">
                ONDERHOUD
              </div>
            </button>
          </form>
          
        </div> <!-- bottom -->
    
      </aside> <!-- sidebar -->
  
      <div class="main">
      
        <div class="bar">
        
          <div class="left" style="margin-left: -5px;">
            <img src="${pageContext.request.contextPath}/images/tria-left.png" style="max-width:10px; height:auto; display:block; margin-right: 2px;">
            <form action="${pageContext.request.contextPath}/overzicht" method="POST">
              <button type="submit" class="btn" name="command" value="collapse">
                <span class="material-icons" style="font-size: 30px;">menu</span>
              </button>
            </form>
          </div>
          
          <div class="right" style="color:#9c9c9e;">
            <form action="${pageContext.request.contextPath}/profiel" method="POST">
              <button type="submit" class="btn" name="command" value="profiel">
                <span class="material-icons-outlined" style="font-size:16px;">person</span>
                <span>&nbsp;Wissel profiel</span>
              </button>
            </form>
              
            <form action="${pageContext.request.contextPath}/applicatie" method="POST">
              <button type="submit" class="btn" name="command" value="applicatie">
                <img src="${pageContext.request.contextPath}/images/lcms-logo-grey.png" style="max-width:14px; height:auto; display:block; margin:auto;">
                <span>&nbsp;Wissel applicatie</span>
              </button>
            </form>
              
            <form action="${pageContext.request.contextPath}/help" method="POST">
              <button type="submit" class="btn" name="command" value="help">
                <span class="material-icons" style="font-size:16px;">question_mark</span>
                <span>&nbsp;Help</span>
              </button>
            </form>

            <form action="${pageContext.request.contextPath}/logout" method="POST">
              <button type="submit" class="btn" name="command" value="help">
                <span class="material-icons" style="font-size:16px;">logout</span>
                <span>&nbsp;Uitloggen</span>
              </button>
            </form>
                
            <form action="${pageContext.request.contextPath}/overzicht" method="POST">
              <button type="submit" class="btn" name="command" value="gebruikers">
                <span class="material-icons-outlined" style="font-size:24px; color:black">arrow_circle_left</span>
              </button>
            </form>
            
          </div> <!-- right -->
          
        </div> <!-- bar -->
        
        <div class="bar">
          <div class="left">
            <span style="font-size: 14pt; font-weight: 600">ACTIVITEITEN</span>
          </div>
        </div>
        
        <div class="bar">
          <div class="left">
            <form action="${pageContext.request.contextPath}/overzicht" method="POST">
              <button type="submit" class="btn-white-selected" name="command" value="lopend">
                Lopend
              </button>
              <button type="submit" class="btn-white" name="command" value="voorbereid">
                Voorbereid
              </button>
              <button type="submit" class="btn-white" name="command" value="alle">
                Alle
              </button>
            </form>
          </div> <!-- left -->
          
          <div class="right">
            <form action="${pageContext.request.contextPath}/overzicht" method="POST">
              <input type="text" class="search" name="zoekterm" placeholder="Zoek activiteiten">
              <button type="submit" class="btn" name="command" value="zoek">
                <span class="btn-search material-icons">search</span>
              </button>
            </form>
          </div> <!-- right -->
        </div> <!-- bar -->
  
        <div class="bar">
          <form class="left" action="${pageContext.request.contextPath}/overzicht" method="POST">
            <div>
              <input type="checkbox" name="command" value="ongelezen">
              <span>Toon ongelezen activiteiten</span>
            </div>
            <div style="margin-left: 10px;">
              <input type="checkbox" name="command" value="buur">
              <span>Toon buurorganisaties</span>
            </div>
          </form> <!-- left -->
          
          <div class="right">
            <form action="${pageContext.request.contextPath}/activiteit" method="POST">
              <button type="submit" class="btn-dark" name="command" value="nieuw">
                <span style="font-size: 28px;">+&nbsp;</span>
                <span>Activiteit aanmaken</span>
              </button>
            </form>
          </div> <!-- right -->
        </div> <!-- bar -->
  
        <div class="content" style="margin-top:10px;">
          <form id="sortForm" method="get" action="${pageContext.request.contextPath}/messages">
              <input type="hidden" id="sortField" name="sort" value="${sort}">
              <input type="hidden" id="sortDirection" name="direction" value="${direction}">
          </form>
  
          <form id="bulkForm" method="post" action="${pageContext.request.contextPath}/markRead">
  
            <table class="messageTable">
              <thead>
              <tr>
                <th>
                  <input type="checkbox" id="selectAll">
                </th>
  
                <th onclick="sortBy('activiteit')">
                  LOPENDE ACTIVITEITEN (#)
                </th>
  
                <th>
                  &nbsp;
                </th>
  
                <th onclick="sortBy('grip')">
                  GRIP
                </th>
  
                <th onclick="sortBy('organisatie')">
                  ORGANISATIE
                </th>
  
                <th onclick="sortBy('datumAanmaak')">
                  AANGEMAAKT
                </th>
  
                <th onclick="sortBy('datumWijzig')">
                  LAATST GEWIJZIGD
                </th>
  
                <th>
                  &nbsp;
                </th>
  
              </tr>
              </thead>
  
              <tbody>
                <c:forEach var="msg" items="${messages}">
                  <tr data-id="${msg.id}">
                    <td>
                        <input type="checkbox" name="selectedIds" value="${msg.id}">
                    </td>
                    <td>${msg.naam}</td>
                    <td>&nbsp;</td>
                    <td>${msg.opschalingCode}</td>
                    <td>${msg.organisatieNaam}</td>
                    <td>${msg.aanmaakDatum}</td>
                    <td>${msg.wijzigDatum}</td>
                    <td>&nbsp;</td>
                  </tr>
                </c:forEach>
              </tbody>
            </table>
  
          </form>
        
        </div> <!-- content -->
        
        <hr width="99%" style="border: solid 1px #cccccc;">
        
        <div class="bar">
          <form class="left" action="${pageContext.request.contextPath}/overzicht" method="POST">
            <button type="submit" form="markeer" class="btn-bottom" style="width:200px;">
              <span class="material-icons" style="font-size:20px;">check</span>
              <span style="margin-left: 10px;">Markeer als gelezen</span>
            </button>
          </form>

          <form class="right" action="${pageContext.request.contextPath}/overzicht" method="POST">
            <button type="submit" form="laden" class="btn-bottom" style="width:150px;">
              <span style="margin-left: 10px;">Meer laden (#)</span>
            </button>
          </form>

        </div> <!-- bar -->
                  
      </div> <!-- main -->

    </div> <!-- screen -->
    
    <footer class="footer">
      <div class="left">
        INGELOGD ALS ${userName}
      </div>
      <div class="right">
        <div>
          <span style="font-weight:bold; color:#555555;">JE BEVINDT JE IN DE LCMS OMGEVING</span>
          <span style="font-weight:bold; color:black;"> PDPC / TU DELFT LCMS GAME</span>
        </div>
      </div>
    </footer>

  </div> <!-- app -->
  
</body>
</html>
