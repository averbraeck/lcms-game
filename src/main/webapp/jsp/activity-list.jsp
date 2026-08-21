<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page import="nl.tudelft.simulation.lcms.data.tables.records.UserRecord"%>
<%@page import="nl.tudelft.simulation.lcms.activity.ActivityListState"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Messages</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/activity-list.css">
    <script src="${pageContext.request.contextPath}/js/activity-list.js"></script>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Material+Icons+Outlined" rel="stylesheet">
</head>

<body>

  <form id="activityListForm" action="${pageContext.request.contextPath}/activity-list" method="POST">
    <input type="hidden" name="command" id="command">
  
    <div class="app">
    
      <div class="screen">
      
        <aside class="sidebar ${sessionScope.activityListState.collapse ? 'nav-collapsed' : ''}">
      
          <div class="top">
                  
            <button type="submit" class="menu-btn" onclick="submitForm('refresh');">
              <div class="icon">
                <img src="${pageContext.request.contextPath}/images/lcms-logo-green.png" 
                    style="max-width: 40px; height:auto; display:block; margin:auto;">
              </div>
              <div class="nav">
                <span class="green">PDPC / TU DELFT</span><br>
                <span class="green">LCMS GAME</span>
              </div>
            </button>
      
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
            
            <button type="submit" class="menu-btn" onclick="submitForm('menu:other');">
              <div class="icon">
                <span class="material-icons" 
                    style="font-size: 30px; display:block; margin-top:-15px;">more_horiz</span>
              </div>
              <div class="nav">
                OVERIG
              </div>
            </button>
            
            <button type="submit" class="menu-btn" onclick="submitForm('menu:plot');">
              <div class="icon">
                &nbsp; 
              </div>
              <div class="nav">
                PLOT
              </div>
            </button>
            
            <button type="submit" class="menu-btn" onclick="submitForm('menu:docs');">
              <div class="icon">
                &nbsp; 
              </div>
              <div class="nav">
                DOCUMENTEN
              </div>
            </button>
            
            <button type="submit" class="menu-btn" onclick="submitForm('menu:maintenance');">
              <div class="icon">
                &nbsp;
              </div>
              <div class="nav">
                ONDERHOUD
              </div>
            </button>
            
          </div> <!-- bottom -->
      
        </aside> <!-- sidebar -->
    
        <div class="main">
        
          <div class="bar">
          
            <div class="left" style="margin-left: -15px;">
              
              <!-- img src="${pageContext.request.contextPath}/images/tria-left.png" 
                  style="max-width:10px; height:auto; display:block; margin-right: 2px;" -->
              <span class="material-icons" style="color:#00cc00; vertical-align:middle; font-size:20pt; margin-right:-8px;">
                ${sessionScope.activityListState.collapse ? '&nbsp;&nbsp;&nbsp;' : 'arrow_left'}
              </span> 
              <button type="submit" class="btn" onclick="submitForm('collapse');">
                <span class="material-icons" style="font-size: 30px;">menu</span>
              </button>
              <span class="material-icons" style="color:#00cc00; vertical-align:middle; font-size:20pt; margin-left:-8px;">
                ${sessionScope.activityListState.collapse ? 'arrow_right' : ''}
              </span> 
            </div>
            
            <div class="right" style="color:#9c9c9e;">
              <button type="submit" class="btn" onclick="submitForm('menu:profile');">
                <span class="material-icons-outlined" style="font-size:16px;">person</span>
                <span>&nbsp;Wissel profiel</span>
              </button>
                
              <button type="submit" class="btn" onclick="submitForm('menu:application');">
                <img src="${pageContext.request.contextPath}/images/lcms-logo-grey.png" 
                    style="max-width:14px; height:auto; display:block; margin:auto;">
                <span>&nbsp;Wissel applicatie</span>
              </button>
                
              <button type="submit" class="btn" onclick="submitForm('menu:help');">
                <span class="material-icons" style="font-size:16px;">question_mark</span>
                <span>&nbsp;Help</span>
              </button>
  
              <button type="submit" class="btn" onclick="submitForm('menu:logout');">
                <span class="material-icons" style="font-size:16px;">logout</span>
                <span>&nbsp;Uitloggen</span>
              </button>
                  
              <button type="submit" class="btn" onclick="submitForm('users');">
                <span class="material-icons-outlined" 
                    style="font-size:24px; color:black">arrow_circle_left</span>
              </button>
              
            </div> <!-- right -->
            
          </div> <!-- bar -->
          
          <div class="bar">
            <div class="left">
              <span style="font-size: 14pt; font-weight: 600">ACTIVITEITEN</span>
            </div>
          </div>
          
          <div class="bar">
            <div class="left">
              <button type="submit" 
                      class="${sessionScope.activityListState.activityTypes == 'running' ? 'btn-white-selected' : 'btn-white'}"
                      onclick="submitForm('running');">
                Lopend
              </button>

              <button type="submit" 
                      class="${sessionScope.activityListState.activityTypes == 'prepared' ? 'btn-white-selected' : 'btn-white'}"
                      onclick="submitForm('prepared');">
                Voorbereid
              </button>

              <button type="submit" 
                      class="${sessionScope.activityListState.activityTypes == 'all' ? 'btn-white-selected' : 'btn-white'}"
                      onclick="submitForm('all');">
                Alle
              </button>
            </div> <!-- left -->
            
            <div class="right" style="gap:1px; margin-right: 0px;">
              <input type="text" class="search" name="search-term" 
                <c:if test="${searchTerm == ''}">
                  placeholder="Zoek activiteiten"
                </c:if>
                <c:if test="${searchTerm != ''}">
                  value="${searchTerm}"
                </c:if>
              >
              <button type="submit" class="btn" onclick="submitForm('clear-search');">
                <span class="btn-search material-icons">close</span>
              </button>
              <button type="submit" class="btn" onclick="submitForm('search');">
                <span class="btn-search material-icons">search</span>
              </button>
            </div> <!-- right -->
          </div> <!-- bar -->
    
          <div class="bar">
            <div class="left">
              <div>
                <input type="checkbox" onclick="submitForm('unread');"
                    ${sessionScope.activityListState.unread ? 'checked' : ''}>
                <span>Toon ongelezen activiteiten</span>
              </div>
              <div style="margin-left: 10px;">
                <input type="checkbox" onclick="submitForm('neighbor');"
                    ${sessionScope.activityListState.neighbor ? 'checked' : ''}>
                <span>Toon buurorganisaties</span>
              </div>
            </div> <!-- left -->
            
            <div class="right">
              <button type="submit" class="btn-dark" onclick="submitForm('new-activity');">
                <span style="font-size: 28px;">+&nbsp;</span>
                <span>Activiteit aanmaken</span>
              </button>
            </div> <!-- right -->
          </div> <!-- bar -->
    
          <div class="content" style="margin-top:10px;">
            <table class="messageTable">
              <thead>
              <tr>
                <th>
                  <input type="checkbox" id="selectAll">
                </th>
  
                <th>
                  <button type="submit" onclick="submitForm('sort:activity');" class="sortable-header">
                    LOPENDE ACTIVITEITEN (#)
                    <c:if test="${sessionScope.activityListState.sort == 'activity'}">
                      <span class="material-icons" style="color:#00cc00; vertical-align:middle; font-size:20pt;">
                        ${sessionScope.activityListState.ascDirection ? 'arrow_drop_down' : 'arrow_drop_up'}
                      </span>
                    </c:if>
                  </button>
                </th>
  
                <th>
                  &nbsp;
                </th>
  
                <th>
                  <button type="submit" onclick="submitForm('sort:grip');" class="sortable-header">
                    GRIP
                    <c:if test="${sessionScope.activityListState.sort == 'grip'}">
                      <span class="material-icons" style="color:#00cc00; vertical-align:middle; font-size:20pt;">
                        ${sessionScope.activityListState.ascDirection ? 'arrow_drop_down' : 'arrow_drop_up'}
                      </span>
                    </c:if>
                  </button>
                </th>
  
                <th>
                  <button type="submit" onclick="submitForm('sort:organization');" class="sortable-header">
                    ORGANISATIE
                    <c:if test="${sessionScope.activityListState.sort == 'organization'}">
                      <span class="material-icons" style="color:#00cc00; vertical-align:middle; font-size:20pt;">
                        ${sessionScope.activityListState.ascDirection ? 'arrow_drop_down' : 'arrow_drop_up'}
                      </span>
                    </c:if>
                  </button>
                </th>
  
                <th>
                  <button type="submit" onclick="submitForm('sort:date-created');" class="sortable-header">
                    AANGEMAAKT
                    <c:if test="${sessionScope.activityListState.sort == 'date-created'}">
                      <span class="material-icons" style="color:#00cc00; vertical-align:middle; font-size:20pt;">
                        ${sessionScope.activityListState.ascDirection ? 'arrow_drop_down' : 'arrow_drop_up'}
                      </span>
                    </c:if>
                  </button>
                </th>
  
                <th>
                  <button type="submit" onclick="submitForm('sort:date-changed');" class="sortable-header">
                    LAATST GEWIJZIGD
                    <c:if test="${sessionScope.activityListState.sort == 'date-changed'}">
                      <span class="material-icons" style="color:#00cc00; vertical-align:middle; font-size:20pt;">
                        ${sessionScope.activityListState.ascDirection ? 'arrow_drop_down' : 'arrow_drop_up'}
                      </span>
                    </c:if>
                  </button>
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
                    <td>${msg.name}</td>
                    <td>&nbsp;</td>
                    <td>${msg.severityCode}</td>
                    <td>${msg.organisationName}</td>
                    <td>${msg.dateCreated}</td>
                    <td>${msg.dateChanged}</td>
                    <td>&nbsp;</td>
                  </tr>
                </c:forEach>
              </tbody>
            </table>
          
          </div> <!-- content -->
          
          <hr width="99%" style="border: solid 1px #cccccc;">
          
          <div class="bar">
            <div class="left">
              <button type="submit" onclick="submitForm('mark-read');" class="btn-bottom" style="width:200px;">
                <span class="material-icons" style="font-size:20px;">check</span>
                <span style="margin-left: 10px;">Markeer als gelezen</span>
              </button>
            </div>
  
            <div class="right">
              <button type="submit" onclick="submitForm('more');" class="btn-bottom" style="width:150px;">
                <span style="margin-left: 10px;">Meer laden (#)</span>
              </button>
            </div>
  
          </div> <!-- bar -->
                    
        </div> <!-- main -->
  
      </div> <!-- screen -->
      
      <footer class="footer">
        <div class="left">
          INGELOGD ALS ${sessionScope.user.name}
        </div>
        <div class="right">
          <div>
            <span style="font-weight:bold; color:#555555;">JE BEVINDT JE IN DE LCMS OMGEVING</span>
            <span style="font-weight:bold; color:black;"> PDPC / TU DELFT LCMS GAME</span>
          </div>
        </div>
      </footer>
  
    </div> <!-- app -->
  
  </form>
  
</body>
</html>
