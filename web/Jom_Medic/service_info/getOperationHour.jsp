<%-- 
    Document   : getOperationHour
    Created on : Aug 21, 2018, 2:58:06 PM
    Author     : user
--%>

<%@page import="org.json.JSONArray"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="ADM_helper.MySessionKey"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String tenant_cd = (String) session.getAttribute(MySessionKey.TENANT_CD);
    String query = "SELECT mon_from, mon_to, tue_from, tue_to, wed_from, wed_to, thu_from, thu_to, fri_from, fri_to, sat_from, sat_to, sun_from, sun_to "
            + "FROM jlk_medic_master WHERE tenant_cd='"+tenant_cd+"';";
    Conn con = new Conn();
    ArrayList<ArrayList<String>> data = con.getData(query);
    
    JSONArray arr = new JSONArray();
    
    if(data.size()>0){
        ArrayList<String> arrTime = data.get(0);
        
        for(int i=0; i<arrTime.size(); i++){
            arr.put(arrTime.get(i));
        }
    }
    else{
        for(int i=0; i < 14; i++){
            arr.put("OFF");
        }
    }
    
    out.print(arr.toString());
%>
