<%-- 
    Document   : evalAnswer
    Created on : Aug 17, 2018, 5:41:57 PM
    Author     : user
--%>

<%@page import="ADM_helper.Emailer"%>
<%@page import="org.json.JSONObject"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Conn con = new Conn();
    
    String user_id = request.getParameter("user_id");
    String answer = request.getParameter("answer");
    
    //                          0       1       2           3
    String query = "SELECT `ANSWER`, `EMAIL`, `USER_NAME`, `PASSWORD` FROM adm_users WHERE `USER_ID`='"+user_id+"' limit 1;";
    ArrayList<ArrayList<String>> data = con.getData(query);
    
    JSONObject json = new JSONObject();
    
    if(data.size()<1){
        json.put("isValid", false);
        json.put("msg", "User ID does not exist!");
        out.print(json.toString());
        return;
    }
    
    String theAnwer = data.get(0).get(0);
    if(!answer.equalsIgnoreCase(theAnwer)){
        json.put("isValid", false);
        json.put("msg", "Wrong answer!");
        out.print(json.toString());
        return;
    }
    
    String username = data.get(0).get(2);
    String password = data.get(0).get(3);
    String email = data.get(0).get(1);
    String subject = "JOMLOKA Forgot Password?";
    String message ="<h1>Good Day!</h1> "
            + "<p>Dear "+username+",</p> "
            + "<p>Following is your forgotten password</p> "
            + "<p>Password: "+password+"</p> "
            + "<p>Please remember your password next time. CHEERS!</p>";
    
    Emailer emailer = new Emailer(email, subject, message);
    boolean isSent = emailer.sendTextEmail();
    
    String msg = "Your password is sent to "+email+". Don't share your password with anyone.";
    
    if(!isSent){
        msg = "Failed to send email. Please try again later...";
    }
    
    json.put("isValid", isSent);
    json.put("msg", msg);
    
    out.print(json.toString());
    
%>
