<%-- 
    Document   : setOperationHour
    Created on : Aug 21, 2018, 3:24:23 PM
    Author     : user
--%>

<%@page import="org.json.JSONObject"%>
<%@page import="main.RMIConnector"%>
<%@page import="dBConn.Conn"%>
<%@page import="org.json.JSONArray"%>
<%@page import="ADM_helper.MySessionKey"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String tenant_cd = (String) session.getAttribute(MySessionKey.TENANT_CD);
    String strTime = request.getParameter("time");
    
    JSONArray arrTime = new JSONArray(strTime);
    
    String query ="UPDATE jlk_medic_master set mon_from='"+arrTime.getString(0) +"', mon_to='"+arrTime.getString(1)+"', tue_from='"+arrTime.getString(2)+"', tue_to='"+arrTime.getString(3)+"', wed_from='"+arrTime.getString(4)+"', wed_to='"+arrTime.getString(5)+"', "
            + "thu_from='"+arrTime.getString(6)+"', thu_to='"+arrTime.getString(7)+"', fri_from='"+arrTime.getString(8)+"', fri_to='"+arrTime.getString(9)+"', sat_from='"+arrTime.getString(10)+"', sat_to='"+arrTime.getString(11)+"', sun_from='"+arrTime.getString(12)+"', sun_to='"+arrTime.getString(13)+"' "
            + "WHERE tenant_cd='"+tenant_cd+"';";
    
    Conn con = new Conn();
    RMIConnector rmi = new RMIConnector();
    boolean isValid = rmi.setQuerySQL(con.HOST, con.PORT, query);
    
    JSONObject json = new JSONObject();
    json.put("isValid", isValid);
    
    String msg = "Operation hours is updated.";
    if(!isValid){
        msg = "Oops! Failed to update operation hours. Try again later...";
        json.put("sql", query);
    }
    
    json.put("msg", msg);
    
    out.print(json.toString());
    
    
%>
