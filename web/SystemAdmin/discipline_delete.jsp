<%-- 
    Document   : discipline_delete
    Created on : Feb 3, 2017, 6:34:44 PM
    Author     : user
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Config.Config"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.sql.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="validateSession.jsp" %>
<%--<%@include file="controller/super_user_check.jsp" %>--%>

<%
    Conn conn = new Conn();

    String id = request.getParameter("disciplineCode");
    String D_hfc_cd = request.getParameter("hfc_cd");

    String sqlSelect = "select discipline_cd from adm_subdiscipline where discipline_cd = '" + id + "' and subdiscipline_hfc_cd = '"+D_hfc_cd+"' limit 1";

    ArrayList<ArrayList<String>> dataUse = conn.getData(sqlSelect);

    if (dataUse.size() > 0) {
        
        out.print("You can't delete this item because it is referenced by subdiscipline");

    } else {

        RMIConnector rmic = new RMIConnector();
        String sql = "DELETE FROM adm_discipline WHERE discipline_cd = '" + id + "' and discipline_hfc_cd = '"+D_hfc_cd+"' ";

        boolean status = rmic.setQuerySQL(conn.HOST, conn.PORT, sql);

        if (status == true) {
            out.print("Success");
        } else {
            out.print("Failed");
        }

    }


%>