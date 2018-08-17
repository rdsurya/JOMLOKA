<%-- 
    Document   : tenant_update
    Created on : Apr 16, 2018, 5:24:40 AM
    Author     : user
--%>

<%@page import="main.RMIConnector"%>
<%@page import="dBConn.Conn"%>
<%@page import="org.json.JSONObject"%>
<%@page import="Formatter.PeriksaString"%>
<%@page import="ADM_helper.MySessionKey"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String tnt_cd = (String) session.getAttribute(MySessionKey.TENANT_CD);

    String name = request.getParameter("name");
    String add1 = request.getParameter("add1");
    String add2 = request.getParameter("add2");
    String bank = request.getParameter("bank");
    String town = request.getParameter("town");
    String district = request.getParameter("district");
    String state = request.getParameter("state");
    String pos = request.getParameter("pos");
    String phone = request.getParameter("phone");
    String country = request.getParameter("country");
    String email = request.getParameter("email");
    String account = request.getParameter("account");

    PeriksaString ps = new PeriksaString();
    JSONObject json = new JSONObject();

    String[] katas = { name, add1, add2, country, town, district, state, pos, phone, account, email};
    if (ps.adaPipe(katas)) {
        json.put("msg", "<h3 class='text-danger'>Illegal data!</h3>");
        json.put("isValid", false);
        out.print(json.toString());
        return;
    }
    
    String query = "UPDATE adm_tenant "
            + "SET tnt_name='"+name+"', address1='"+add1+"', address2='"+add2+"', country_cd='"+country+"', town_cd='"+town+"', "
            + "district_cd='"+district+"', state_cd='"+state+"', postcode='"+pos+"', telephone_no='"+phone+"', bank_name='"+bank+"', email='"+email+"', bank_account_no='"+account+"' "
            + "WHERE tnt_cd='"+tnt_cd+"';";
    
    Conn con = new Conn();
    
    RMIConnector rmi = new RMIConnector();
    if(rmi.setQuerySQL(con.HOST, con.PORT, query)){
        json.put("msg", "Tenant is registered successfully.");
        json.put("isValid", true);
        out.print(json.toString());
       
    }
    else{
        json.put("msg", "<b class='text-danger'>Something went wrong. Please try again later.</b>");
        json.put("isValid", false);
        out.print(json.toString());
        
    }
%>
