<%-- 
    Document   : getSecurityQuestion
    Created on : Aug 17, 2018, 4:41:00 PM
    Author     : user
--%>

<%@page import="org.json.JSONObject"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String user_id = request.getParameter("user_id");
    String query = "SELECT `QUESTION` FROM adm_users WHERE `USER_ID`='"+user_id+"' limit 1;";
    
    Conn con = new Conn();
    ArrayList<ArrayList<String>> data = con.getData(query);
    
    JSONObject json = new JSONObject();
    
    if(data.size()<1){
        json.put("isValid", false);
        json.put("msg", "User ID does not exist!");
        out.print(json.toString());
        return;
    }
    
    String question = data.get(0).get(0);
    json.put("isValid", true);
    json.put("question", question);
    
    out.print(json.toString());
    
%>