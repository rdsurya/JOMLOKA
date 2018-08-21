<%-- 
    Document   : getDocument
    Created on : Aug 21, 2018, 10:15:32 AM
    Author     : user
--%>

<%@page import="org.json.JSONObject"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="ADM_helper.MySessionKey"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String tenant_cd = (String) session.getAttribute(MySessionKey.TENANT_CD);
    
    String img = request.getParameter("img");
    
    img += "_image";
    
    String query = "SELECT "+img+" FROM jlk_medic_master WHERE tenant_cd='"+tenant_cd+"';";
    Conn con = new Conn();
    
    ArrayList<ArrayList<String>> data = con.getData(query);
    
    String src="../assets/img/no-image.png";
    
    if(data.size()>0){
        src = data.get(0).get(0);
    }
    
    JSONObject json = new JSONObject();
    json.put("src", src);
    
    out.print(json.toString());
%>