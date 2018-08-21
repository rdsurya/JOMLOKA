<%-- 
    Document   : setDocument
    Created on : Aug 21, 2018, 11:49:23 AM
    Author     : user
--%>

<%@page import="org.json.JSONObject"%>
<%@page import="main.RMIConnector"%>
<%@page import="dBConn.Conn"%>
<%@page import="ADM_helper.MySessionKey"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String tenant_cd = (String) session.getAttribute(MySessionKey.TENANT_CD);
    
    String img = request.getParameter("img");
    String src = request.getParameter("src");
    img += "_image";
    String query = "UPDATE jlk_medic_master set "+img+" = '"+src+"' WHERE tenant_cd='"+tenant_cd+"';";
    
    Conn con = new Conn();
    RMIConnector rmi = new RMIConnector();
    
    JSONObject json = new JSONObject();
    String msg = "Document is uploaded.";
    boolean isValid = rmi.setQuerySQL(con.HOST, con.PORT, query);
    
    if(!isValid){
        msg = "Oops! Failed to upload document. Try again later...";
    }
    
    json.put("isValid", isValid);
    json.put("msg", msg);
    
    out.print(json.toString());
    
    
%>
