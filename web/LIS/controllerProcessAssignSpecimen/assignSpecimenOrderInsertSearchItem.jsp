<%-- 
    Document   : assignSpecimenOrderInsertSearchItem
    Created on : Jan 15, 2018, 11:33:09 AM
    Author     : Shammugam
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
    Conn conn = new Conn();
    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String dis = session.getAttribute("DISCIPLINE_CODE").toString();
    String sub = session.getAttribute("SUB_DISCIPLINE_CODE").toString();

    String key = request.getParameter("input");

    String searchProblem = "SELECT item_cd,item_name FROM lis_item_detail "
            + " WHERE hfc_cd  = '" + hfc + "' "
            + " AND (item_cd like '%" + key + "%' OR item_name like '%" + key + "%') ";
    ArrayList<ArrayList<String>> search = conn.getData(searchProblem);
    if (search.size() > 0) {
%>

<ul id="matchListITEM" style="width: 300px; height: 200px; overflow: auto">
    <% for (int i = 0; i < search.size(); i++) {
    %>
    <li value="<%=search.get(i).get(0)%>"><a style="cursor:pointer; color: black;"><%=search.get(i).get(0)%> | <%=search.get(i).get(1)%></a></li>
        <%
            }
        %>
</ul>

<%} else {%>
<span>No Record Found!</span>
<%
    }
%>
