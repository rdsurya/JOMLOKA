<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Config.connect"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%


    String idResult = request.getParameter("idResult");
    
    RMIConnector rmic = new RMIConnector();
    Conn conn = new Conn();
    String sql = "DELETE FROM lis_result WHERE id_result='"+idResult+"'";

    boolean status = rmic.setQuerySQL(conn.HOST, conn.PORT, sql);

    if (status) {
        out.print("-|1");
        return;
    } else {
        out.print("-|-1");
        return;
    }
%>